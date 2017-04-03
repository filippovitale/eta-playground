{-# LANGUAGE MagicHash, MultiParamTypeClasses, TypeFamilies, DataKinds, FlexibleContexts, OverloadedStrings, TypeOperators #-}

module JavaFX.Methods where

import Java
import JavaFX.Types

foreign import java safe "@static javafx.application.Application.launch"
  launch :: JClass a -> JStringArray -> IO ()

foreign import java unsafe "@static java.lang.System.nanoTime" nanoTime  :: Java a Int64

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

-- GraphicsContext methods
foreign import java unsafe "fillOval" fillOval :: Double -> Double -> Double -> Double -> Java GraphicsContext ()

-- AnimationLoop constructor and methods
foreign import java unsafe "@new" newAnimationLoop :: Canvas -> Int64 -> Double -> Double -> Double -> Java a AnimationLoop
foreign import java unsafe "start" startAnimation :: Java AnimationLoop ()
