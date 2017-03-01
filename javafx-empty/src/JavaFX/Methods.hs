{-# LANGUAGE FlexibleContexts #-}
module JavaFX.Methods where

import Java
import JavaFX.Types

foreign import java safe "@static javafx.application.Application.launch"
  launch :: JClass a -> JStringArray -> IO ()

foreign import java unsafe "show" show :: Java Stage ()

foreign import java unsafe "setTitle" setTitle :: String -> Java Stage ()
