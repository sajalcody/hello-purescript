module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Utils

-- main = showTime


showTimeIntEff :: Effect Unit
showTimeIntEff = getTimeIntEff >>= (show >>> log)

showTimeIntAsStrEff :: Effect Unit
showTimeIntAsStrEff = getTimeIntAsStrEff >>= log

showTimeInt :: Int
showTimeInt = getTimeInt

showTimeIntAsStr :: String
showTimeIntAsStr = getTimeIntAsStr

showTimeStrEff :: Effect Unit
showTimeStrEff = getTimeStrEff >>= log

showTimeStr :: String
showTimeStr = getTimeStr

showCallDummyF :: String
showCallDummyF = getDummyEffV

showVersion :: Int
showVersion = callVersion

showCallfuncWith2Param :: Effect Unit
showCallfuncWith2Param = callfuncWith2Param "first param " >>= log

showId :: Effect String
showId = getId <#> show

{- Doubts
-> Control.Monad.Effect.Console vs Effect.Console
-}
-- =<<