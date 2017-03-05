module Main where

import JavaFX
import EmptyCanvasApp

main :: IO ()
main = javafx (Proxy :: Proxy EmptyCanvasApp)
