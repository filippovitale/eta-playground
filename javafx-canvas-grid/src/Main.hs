module Main where

import JavaFX
import CanvasGridApp

main :: IO ()
main = javafx (Proxy :: Proxy CanvasGridApp)
