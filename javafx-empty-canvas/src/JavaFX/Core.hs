module JavaFX.Core (javafx, Proxy(..)) where

import System.Environment
import JavaFX.Methods
import Data.Proxy
import Java.Utils

javafx :: Proxy a -> IO ()
javafx p = do
  args <- getJavaArgs -- command line args like `def main(args: Array[String])`
  launch (getClass p) args -- Application.launch(Empty.class, args);
