{-# LANGUAGE MagicHash #-}
module EmptyApp where

import Prelude hiding (show)

import Java
-- import javafx.stage.Stage;
import JavaFX.Types
-- import javafx.application.Application;
import JavaFX.Methods

-- public class Empty extends Application {
data {-# CLASS "org.eta.EmptyApp extends javafx.application.Application" #-}
  EmptyApp = EmptyApp (Object# EmptyApp)

--     @Override
--     public void start(Stage primaryStage) throws Exception {
start :: Stage -> Java EmptyApp ()
--         primaryStage.setTitle("Empty Eta-JavaFX Stage");
--         primaryStage.show();
--     }
start = (<.> (setTitle "Empty Eta-JavaFX Stage" >> show))

foreign export java "start" start :: Stage -> Java EmptyApp ()

-- What is <.> ?
-- Execute a Java action in the Java monad of another class
-- with respect to the given object.
-- (<.>) :: (Class c) => c -> Java c a -> Java b a
