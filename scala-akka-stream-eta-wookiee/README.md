# Scala akka-stream integration with Eta

To compile the Eta code as a "fat-jar":

```
cd scala-akka-stream-eta-wookiee/src/main/eta

etlas install aeson
etlas clean
etlas configure --enable-uberjar-mode
etlas build
```

To run the example:

```
cd scala-akka-stream-eta-wookiee

mkdir lib
mv src/main/eta/dist/build/scala-akka-stream-eta-wookiee/scala-akka-stream-eta-wookiee.jar lib/
sbt run
```
