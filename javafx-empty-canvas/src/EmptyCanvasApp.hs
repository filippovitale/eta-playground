{-# LANGUAGE MagicHash #-}
module EmptyCanvasApp where

import Prelude hiding (show)

import Java
import Java.Array
import JavaFX.Types
import JavaFX.Methods

data {-# CLASS "org.eta.EmptyCanvasApp extends javafx.application.Application" #-}
  EmptyCanvasApp = EmptyCanvasApp (Object# EmptyCanvasApp)

-- @Override
-- public void start(Stage primaryStage) throws Exception {
start :: Stage -> Java EmptyCanvasApp ()

start primaryStage = do
  -- Canvas c = new Canvas(320, 320);
  c <- newCanvas 320 320
  -- Scene s = new Scene(new Group(c));
  s <- newGroup [superCast c] >>= newScene

  -- primaryStage.setTitle("Eta-JavaFX EmptyCanvas");
  -- primaryStage.setScene(s);
  -- primaryStage.show();
  primaryStage <.> (setTitle "Eta-JavaFX EmptyCanvas" >> setScene s >> show)


foreign export java "start" start :: Stage -> Java EmptyCanvasApp ()
