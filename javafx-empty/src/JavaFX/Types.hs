{-# LANGUAGE MagicHash, MultiParamTypeClasses, TypeFamilies, DataKinds #-}
module JavaFX.Types where

import Java

data {-# CLASS "javafx.stage.Stage" #-} Stage
  = Stage (Object# Stage)
  deriving Class
