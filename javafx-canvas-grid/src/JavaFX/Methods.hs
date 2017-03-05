{-# LANGUAGE MagicHash, MultiParamTypeClasses, TypeFamilies, DataKinds, FlexibleContexts, OverloadedStrings, TypeOperators #-}

module JavaFX.Methods where

import Java
import JavaFX.Types

foreign import java safe "@static javafx.application.Application.launch"
  launch :: JClass a -> JStringArray -> IO ()

-- Stage methods
foreign import java unsafe "show" show :: Java Stage ()
foreign import java unsafe "setTitle" setTitle :: String -> Java Stage ()
foreign import java unsafe "setScene" setScene :: Scene -> Java Stage ()

-- Scene constructor and methods
foreign import java unsafe "@new" newScene :: (b <: Parent) => b -> Java a Scene

-- Group constructor and methods (trick to get `Canvas[]` as `Node[]`)
foreign import java unsafe "@new" newGroup' :: Nodes -> Java a Group
newGroup :: [Node] -> Java a Group
newGroup nodes = newGroup' (toJava nodes)

-- Canvas constructor and methods
foreign import java unsafe "@new" newCanvas :: Double -> Double -> Java a Canvas
foreign import java unsafe "getGraphicsContext2D" getGraphicsContext2D :: Java Canvas GraphicsContext

-- GraphicsContext methods
foreign import java unsafe "fillRect" fillRect :: Double -> Double -> Double -> Double -> Java GraphicsContext ()
