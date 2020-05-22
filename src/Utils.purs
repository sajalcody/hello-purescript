module Utils where

import Prelude
import Effect (Effect)

foreign import getTimeIntEff :: Effect Int
foreign import getTimeIntAsStrEff :: Effect String
foreign import getTimeInt :: Int
foreign import getTimeIntAsStr :: String
foreign import getTimeStrEff :: Effect String
foreign import getTimeStr :: String
foreign import getId :: Effect Int
foreign import getDummyEffV :: String
foreign import callVersion :: Int