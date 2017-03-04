{-# LANGUAGE MagicHash, MultiParamTypeClasses, TypeFamilies, DataKinds, FlexibleContexts, OverloadedStrings, TypeOperators #-}
module Main where

import Java

data {-# CLASS "java.io.Reader" #-} Reader = Reader (Object# (Reader))
  deriving Class
data {-# CLASS "java.io.CharArrayReader" #-} CharArrayReader = CharArrayReader (Object# (CharArrayReader))
  deriving Class
data {-# CLASS "java.io.BufferedReader" #-} BufferedReader = BufferedReader (Object# (BufferedReader))
  deriving Class

type instance Inherits CharArrayReader = '[Reader]
type instance Inherits BufferedReader = '[Reader]

foreign import java unsafe "toCharArray" toCharArray :: JString -> JCharArray
foreign import java unsafe "@new" newCharArrayReader :: JCharArray -> Java a CharArrayReader
foreign import java unsafe "@new" newBufferedReader :: (b <: Reader) => b -> Java a BufferedReader
foreign import java unsafe readLine :: (b <: Reader) => Java b String

main = java $ do
  -- final CharArrayReader r = new CharArrayReader("123".toCharArray());
  r <- newCharArrayReader (toCharArray "123")
  -- final BufferedReader b = new BufferedReader(r);
  b <- newBufferedReader r
  -- String result = b.readLine();
  result <- b <.> readLine
  -- System.out.println(result);
  io $ putStrLn result
