{-# LANGUAGE MagicHash #-}
module Main where

import Java

foreign import java unsafe "@static java.lang.System.nanoTime" nanoTimeJava  :: Java a Int64
foreign import java unsafe "@static java.lang.System.nanoTime" nanoTimeIO    :: IO Int64
foreign import java unsafe "@static java.lang.System.nanoTime" nanoTimePlain :: Int64

main :: IO ()
main = do
  (java $ nanoTimeJava) >>= (putStrLn . show)
  (java $ nanoTimeJava) >>= (putStrLn . show)
  (java $ nanoTimeJava) >>= (putStrLn . show)
  (nanoTimeIO) >>= (putStrLn . show)
  (nanoTimeIO) >>= (putStrLn . show)
  (nanoTimeIO) >>= (putStrLn . show)
  putStrLn $ show nanoTimePlain
  putStrLn $ show nanoTimePlain
  putStrLn $ show nanoTimePlain
