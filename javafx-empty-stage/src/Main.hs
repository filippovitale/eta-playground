module Main where

import JavaFX
import EmptyStageApp

main :: IO ()
main = javafx (Proxy :: Proxy EmptyStageApp)
