package stream

import java.nio.file.Paths

import akka.NotUsed
import akka.actor.ActorSystem
import akka.stream.scaladsl.Compression.gunzip
import akka.stream.scaladsl.{FileIO, Framing, Sink}
import akka.stream.{ActorMaterializer, javadsl}
import akka.util.ByteString

object Main extends App {
  implicit val system = ActorSystem("Sys")
  implicit val materializer = ActorMaterializer()

  import system.dispatcher

  // static methods exports are not ready yet
  // https://github.com/typelead/eta/issues/255
  val e = new Example()

  // signature attribute for exported class to preserve generics information
  // is not ready yet: https://github.com/typelead/eta/issues/298
  val extractNameFlow = e.extractNameFlow().asInstanceOf[javadsl.Flow[String, String, NotUsed]]
  val wookieeFlow = e.wookieeFlow().asInstanceOf[javadsl.Flow[String, String, NotUsed]]

  val jsonURL = getClass.getResource("/all_characters.json-stream.gz")
  val jsonPath = Paths.get(jsonURL.toURI)

  val lineSplitter = Framing.delimiter(ByteString("\n"), Int.MaxValue)

  FileIO.fromPath(jsonPath)
    .via(gunzip())
    .via(lineSplitter)
    .map(_.utf8String)
    .via(extractNameFlow)
    .via(wookieeFlow)
    .runWith(Sink.foreach(println))
    .onComplete(_ => system.terminate())
}
