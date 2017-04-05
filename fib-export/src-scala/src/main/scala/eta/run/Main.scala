package eta.run

import eta.example.MyExportedClass

object EtaExports extends App {
  val mec = new MyExportedClass
  val fib = mec.fib(10)
  println(s"fib(10): $fib")
}
