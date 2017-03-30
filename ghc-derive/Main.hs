{-# LANGUAGE DeriveFunctor, DeriveFoldable, DeriveTraversable #-}
module Main where

data Liste a = Tømme | Kons a (Liste a)
              deriving (Eq, Show,
                        Functor,
                        Foldable,
                        Traversable)

-- instance Foldable Liste where
--   foldr _ z Tømme = z
--   foldr f z (Kons x xs) = f x $ foldr f z xs
--
-- instance Traversable Liste where
--   traverse _ Tømme = pure Tømme
--   traverse f (Kons x xs) = Kons <$> f x <*> traverse f xs

main :: IO ()
main = print $ concat l
  where l = Kons "a" $ Kons "b" $ Kons "c" Tømme
