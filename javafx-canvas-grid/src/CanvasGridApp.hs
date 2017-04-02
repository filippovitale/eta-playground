{-# LANGUAGE MagicHash #-}
module CanvasGridApp where

import Prelude hiding (show)
import Control.Monad

import Java
import Java.Array
import JavaFX.Types
import JavaFX.Methods

data {-# CLASS "org.eta.CanvasGridApp extends javafx.application.Application" #-}
  CanvasGridApp = CanvasGridApp (Object# CanvasGridApp)

start :: Stage -> Java CanvasGridApp ()

start primaryStage = do
  c <- newCanvas w h
  gc <- c <.> getGraphicsContext2D

  forM_ [(i, j) | i <- [0..(n-1)], j <- [0..(n-1)]]
        $ \(i, j) -> gc <.> fillOval (u*i) (u*j) (u*r) (u*r)

  s <- newGroup [superCast c] >>= newScene
  primaryStage <.> (setTitle "Eta-JavaFX CanvasGrid" >> setScene s >> show)
  where w = 320
        h = 320
        n = 8
        u = (min w h) / n
        r = 0.9


foreign export java "start" start :: Stage -> Java CanvasGridApp ()
