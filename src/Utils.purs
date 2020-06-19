module Utils where

import Prelude
import Effect (Effect)
import Data.Int53
import Data.Maybe (fromMaybe)
import Data.String (length, split, take, Pattern(..))
import Data.Array (last, length) as A
import Data.Foldable (foldl)
import Foreign (Foreign)

foreign import getTimeIntEff :: Effect Int
foreign import getTimeIntAsStrEff :: Effect String
foreign import getTimeInt :: Int
foreign import getTimeIntAsStr :: String
foreign import getTimeStrEff :: Effect String
foreign import getTimeStr :: String
foreign import getId :: Effect Int
foreign import getDummyEffV :: String
foreign import callVersion :: Int
foreign import callfuncWith2Param :: String -> Effect String
foreign import unixToRFC :: Int -> String
-- foreign import addKeyValue :: forall a b. {|a} -> String -> String -> {|a}
foreign import addKeyValue :: Foreign -> String -> String -> Foreign
foreign import logMe :: forall a. a -> String
foreign import logger :: String -> Unit

-- Masking Functions

maskCardNumber :: String -> String
maskCardNumber cn = take 6 cn_ <> getMask (length cn_ - 6)
    where cn_ = foldl (<>) "" $ split (Pattern " ") cn

maskCvv :: String -> String
maskCvv = getMask <<< length

maskVpa :: String -> String
maskVpa vpa = let splitArr = split (Pattern "@") vpa 
    in if (A.length splitArr) == 1
        then getMask $ length vpa 
    else ("@" <> (fromMaybe "" $ A.last splitArr))

getMask :: Int -> String
getMask 0 = ""
getMask n = "X" <> getMask (n - 1)