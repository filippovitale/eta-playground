module Main where

import JavaFX
import TeaStormApp

main :: IO ()
main = javafx (Proxy :: Proxy TeaStormApp)
