{-# LANGUAGE MagicHash, MultiParamTypeClasses, TypeFamilies, DataKinds, FlexibleContexts #-}

module JavaFX.Types where

import Java

data {-# CLASS "javafx.stage.Stage" #-} Stage = Stage (Object# Stage)
  deriving Class

data {-# CLASS "javafx.scene.Scene" #-} Scene = Scene (Object# Scene)
  deriving Class

data {-# CLASS "javafx.scene.Group" #-} Group = Group (Object# Group)
  deriving Class

data {-# CLASS "javafx.scene.canvas.Canvas" #-} Canvas = Canvas (Object# Canvas)
  deriving Class
data {-# CLASS "javafx.scene.canvas.Canvas[]" #-} Canvases = Canvases (Object# Canvases)
  deriving Class
instance JArray Canvas Canvases

data {-# CLASS "javafx.scene.canvas.GraphicsContext" #-} GraphicsContext = GraphicsContext (Object# GraphicsContext)
  deriving Class



data {-# CLASS "javafx.scene.Node" #-} Node = Node (Object# Node)
  deriving Class

data {-# CLASS "javafx.scene.Node[]" #-} Nodes = Nodes (Object# Nodes)
  deriving Class
instance JArray Node Nodes

data {-# CLASS "javafx.scene.Parent" #-} Parent = Parent (Object# Parent)
  deriving Class

type instance Inherits Group            = '[Parent]
type instance Inherits Canvas           = '[Node]
