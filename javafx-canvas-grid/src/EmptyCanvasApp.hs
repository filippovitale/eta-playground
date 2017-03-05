{-# LANGUAGE MagicHash #-}
module EmptyCanvasApp where

import Prelude hiding (show)
import Control.Applicative
import Control.Monad

import Java
import Java.Array
import JavaFX.Types
import JavaFX.Methods

data {-# CLASS "org.eta.EmptyCanvasApp extends javafx.application.Application" #-}
  EmptyCanvasApp = EmptyCanvasApp (Object# EmptyCanvasApp)

start :: Stage -> Java EmptyCanvasApp ()

start primaryStage = do
  let w = 320
  let h = 320
  c <- newCanvas w h
  gc <- c <.> getGraphicsContext2D

  let n = 32
  let a = 0.9
  let u = (min w h) / n
  forM [0..(n-1)] $ \i -> forM [0..(n-1)] $ \j -> gc <.> fillRect (u*i) (u*j) (u*a) (u*a)

  s <- newGroup [superCast c] >>= newScene
  primaryStage <.> (setTitle "Eta-JavaFX CanvasGrid" >> setScene s >> show)


foreign export java "start" start :: Stage -> Java EmptyCanvasApp ()
