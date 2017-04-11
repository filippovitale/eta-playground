# Scala akka-stream integration with Eta

To compile the Eta code as a "fat-jar":

```
cd scala-akka-stream-eta-echoflow/src/main/eta

etlas clean
etlas configure --enable-uberjar-mode
etlas build
```

To run the example:

```
cd scala-akka-stream-eta-echoflow

mv src/main/eta/dist/build/scala-akka-stream-eta-echoflow/scala-akka-stream-eta-echoflow.jar lib/
sbt run
```
