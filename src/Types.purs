module Types where

import Prelude --((<<<), Unit)
import Effect (Effect)
import Data.Show (class Show, show)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.String (toLower)
import Foreign (readString)
import Foreign.Generic.Class (class Encode, encode, defaultOptions)
import Foreign.Generic (genericEncode)

data DummyType
  = ValueA
  | ValueB
  | ValueC
  | ValueD

{-
Generic instance required for genericShow
-> remove `derive` and check the error [TODO] Resolve the error
-}
derive instance genericDummyType :: Generic DummyType _

{-
Show instance which return a string
-> `genericShow` returns string for the type
-> put derive as in generic and resolve error
-}
instance showDummyType :: Show DummyType where
  -- show _ = "for all values"
  show = genericShow
  -- show = toLower <<< genericShow -- show ValueA -> "valuea"

{-
`Encode` instance
-}
instance encodeDummy :: Encode DummyType where
  encode = genericEncode defaultOptions -- {unwrapSingleConstructors = true}

-- instance decodeDummy :: Decode DummyType where
--   decode 

-- main :: Effect Unit
-- main :: String
-- main = do
--   a <- readString $ encode ValueA
--   -- pure a
--   case a of
--     Right r -> r
--     _ -> "error"
