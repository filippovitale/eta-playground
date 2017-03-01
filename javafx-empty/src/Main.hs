module Main where

import JavaFX
import EmptyApp

main :: IO ()
main = javafx (Proxy :: Proxy EmptyApp)
