{-# LANGUAGE MagicHash #-}

import Java

data {-# CLASS "eta.example.MyExportedClass" #-} MyExportedClass = MyExportedClass (Object# MyExportedClass)

fib' 0 = 1
fib' 1 = 1
fib' n = fib' (n - 1) + fib' (n - 2)

fib :: Int -> Java MyExportedClass Int
fib n = return $ fib' n

foreign export java fib :: Int -> Java MyExportedClass Int

main :: IO ()
main = return ()
