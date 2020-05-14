module Ch04.Test where

import Prelude

import Effect (Effect)
import Effect.Console (logShow)
import Ch04.Path (root)
import Data.Foldable (for_)
import Ch04.FileOperations (allFiles)

main :: Effect Unit
main = for_ (allFiles root) logShow
