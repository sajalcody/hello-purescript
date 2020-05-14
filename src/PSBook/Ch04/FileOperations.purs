module Ch04.FileOperations where

import Prelude

import Ch04.Path (Path, ls)
import Data.Array (concatMap, (:))

allFiles :: Path -> Array Path
allFiles root = root : concatMap allFiles (ls root)

allFiles' :: Path -> Array Path
allFiles' file = file : do
  child <- ls file
  allFiles' child
