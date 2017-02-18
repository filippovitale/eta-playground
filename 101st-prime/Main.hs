module Main where

primes = filterPrime [2..]
  where filterPrime (p:xs) =
          p : filterPrime [x | x <- xs, x `mod` p /= 0]

main = putStrLn $ "The 101st prime is " ++ show (primes !! 100)
