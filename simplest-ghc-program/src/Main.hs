module Main where

import System.CPUTime

main :: IO ()
main = getCPUTime >>= print
