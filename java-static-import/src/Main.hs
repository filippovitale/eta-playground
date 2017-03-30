{-# LANGUAGE MagicHash #-}
module Main where

import Java

foreign import java unsafe "@static java.lang.System.nanoTime" nanoTimeJava  :: Java a Int64
foreign import java unsafe "@static java.lang.System.nanoTime" nanoTimeIO    :: IO Int64
foreign import java unsafe "@static java.lang.System.nanoTime" nanoTimePlain :: Int64

main :: IO ()
main = do
  java (nanoTimeJava) >>= print
  java (nanoTimeJava) >>= print
  nanoTimeIO >>= print
  nanoTimeIO >>= print
  print nanoTimePlain
  print nanoTimePlain
