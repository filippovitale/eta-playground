# Scala akka-stream integration with Eta

To compile the Eta code as a "fat-jar":

```
cd scala-akka-stream-eta/src/main/eta

etlas clean
etlas configure --enable-uberjar-mode
etlas build
```

To run the example:

```
cd scala-akka-stream-eta

mv src/main/eta/dist/build/scala-akka-stream-eta/scala-akka-stream-eta.jar lib/
sbt run
```
