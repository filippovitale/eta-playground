{-# LANGUAGE MagicHash, TypeOperators, MultiParamTypeClasses, TypeFamilies, DataKinds, FlexibleContexts, OverloadedStrings, ScopedTypeVariables #-}

module AkkaStream.Exports where

import Java
import AkkaStream.Types
import AkkaStream.Methods

data {-# CLASS "stream.Example" #-} Example = Example (Object# Example)

echoFlow :: Java Example (Flow JString JString NotUsed)
echoFlow = flowFromFunction $ applyFunction (\(js :: JString) -> return (js :: JString))

foreign export java echoFlow :: Java Example (Flow JString JString NotUsed)
