{-# LANGUAGE MagicHash, TypeOperators, MultiParamTypeClasses, TypeFamilies, DataKinds, FlexibleContexts, OverloadedStrings, ScopedTypeVariables #-}

module AkkaStream.Methods where

import Java
import AkkaStream.Types

-- trait Function[-T, +R] { def apply(param: T): R }
foreign import java unsafe "@wrapper apply"
  applyFunction :: (t <: Object, r <: Object) => (t -> Java (Function t r) r) -> Function t r

-- public static <I,O> Flow<I,O,NotUsed> fromFunction(Function<I,O> f)
foreign import java unsafe "@static akka.stream.javadsl.Flow.fromFunction"
  flowFromFunction :: (t <: Object) => Function t t -> Java a (Flow t t NotUsed)
