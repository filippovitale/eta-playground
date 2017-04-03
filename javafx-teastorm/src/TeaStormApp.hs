{-# LANGUAGE MagicHash #-}
module TeaStormApp where

import Prelude hiding (show)
import Control.Monad

import Java
import Java.Array
import JavaFX.Types
import JavaFX.Methods

data {-# CLASS "org.eta.TeaStormApp extends javafx.application.Application" #-}
  TeaStormApp = TeaStormApp (Object# TeaStormApp)

start :: Stage -> Java TeaStormApp ()

start primaryStage = do
  t0   <- nanoTime
  c    <- newCanvas w h
  s    <- newGroup [superCast c] >>= newScene

  loop <- newAnimationLoop c t0 n u m
  loop <.> startAnimation

  primaryStage <.> (setTitle "Eta-JavaFX TeaStorm" >> setScene s >> show)
  where n = 96
        m = 10
        w = n * m
        h = n * m
        u = (min w h) / n


foreign export java "start" start :: Stage -> Java TeaStormApp ()
