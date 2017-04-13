{-# LANGUAGE MagicHash, TypeOperators, MultiParamTypeClasses, TypeFamilies, DataKinds, FlexibleContexts, ScopedTypeVariables, OverloadedStrings #-}

module AkkaStream.Exports where

import Java hiding (Map)
import AkkaStream.Types
import AkkaStream.Methods
import Data.ByteString.Lazy.Char8 (pack)
import Data.Char
import Data.Map
import Data.Maybe (fromMaybe)
import Data.Aeson


data {-# CLASS "stream.Example" #-} Example = Example (Object# Example)

extractNameFlow :: Java Example (Flow JString JString NotUsed)
extractNameFlow = flowFromFunction $ applyFunction f
  where
    f js = return (toJava $ g $ pack (fromJava js :: [Char]))
    g s  = (fromMaybe empty (decode s :: Maybe (Map String String))) ! "name"

wookieeFlow :: Java Example (Flow JString JString NotUsed)
wookieeFlow = flowFromFunction $ applyFunction f
  where
    f js = return (toJava $ (fromJava js :: [Char]) >>= wookiee)

type JStringFlow = Flow JString JString NotUsed
foreign export java extractNameFlow :: Java Example JStringFlow
foreign export java wookieeFlow     :: Java Example JStringFlow


wookiee :: Char -> [Char]
wookiee c = case (toLower c) of
  'a' -> "RA"
  'b' -> "RH"
  'c' -> "OA"
  'd' -> "WA"
  'e' -> "WO"
  'f' -> "WW"
  'g' -> "RR"
  'h' -> "AC"
  'i' -> "AH"
  'j' -> "SH"
  'k' -> "OR"
  'l' -> "AN"
  'm' -> "SC"
  'n' -> "WH"
  'o' -> "OO"
  'p' -> "AK"
  'q' -> "RQ"
  'r' -> "RC"
  's' -> "C"
  't' -> "AO"
  'u' -> "HU"
  'v' -> "HO"
  'w' -> "OH"
  'x' -> "K"
  'y' -> "RO"
  'z' -> "UF"
  '-' -> " "
  ' ' -> " "
  _   -> []
