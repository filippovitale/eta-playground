name := "scala-akka-streams-eta"

version := "1.0"

scalaVersion := "2.12.1"

libraryDependencies += "com.typesafe.akka" %% "akka-stream" % "2.4.17"

initialCommands in console := "import akka.actor.ActorSystem;" +
  "import akka.stream.ActorMaterializer;" +
  "import akka.stream.scaladsl._;"
