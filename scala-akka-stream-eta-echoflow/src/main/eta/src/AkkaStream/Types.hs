{-# LANGUAGE MagicHash, TypeOperators, MultiParamTypeClasses, TypeFamilies, DataKinds, FlexibleContexts, OverloadedStrings, ScopedTypeVariables #-}

module AkkaStream.Types where

import Java

data {-# CLASS "akka.japi.function.Function" #-} Function t r = Function (Object# (Function t r))
  deriving Class

data {-# CLASS "akka.stream.javadsl.Flow" #-} Flow i o m = Flow (Object# (Flow i o m))
  deriving Class

data {-# CLASS "akka.NotUsed" #-} NotUsed = NotUsed (Object# NotUsed)
  deriving Class
