module Types where

import Prelude --((<<<), Unit)
import Effect (Effect)
import Data.Show (class Show, show)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.String (toLower)
import Foreign (readString)
-- import Foreign.Class (class Decode)
import Foreign.Generic.Class (class Encode, encode, defaultOptions, class Decode, decode, Options)
import Foreign.Generic (genericEncode, genericDecode)
-- import Foreign.Generic.Types (Options)
data ValueD = V_A | V_B
data DummyType
  = ValueA
  | ValueB
  | ValueC
  -- | V ValueD

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

options :: Options
options = defaultOptions { unwrapSingleConstructors = true }

instance decodeDummy :: Decode DummyType where
  decode = genericDecode options
  -- decode (Foreign "ValueA") = ValueA
  -- decode x = genericDecode defaultOptions x-- {unwrapSingleConstructors =}

-- instance decodeDummy :: Decode DummyType where
--   decode 

instance encodeValueD :: Encode ValueD where
  encode = genericEncode defaultOptions

derive instance genericValueD :: Generic ValueD _
instance showValueD :: Show ValueD where
  show = genericShow
-- main :: Effect Unit
-- main :: String
-- main = do
--   a <- readString $ encode ValueA
--   -- pure a
--   case a of
--     Right r -> r
--     _ -> "error"

data Lifecycle = Android | Ios | Web | Hypersdk | Microapp
data Action = User | System
data ApiCall = Network | Sdk | AC_Microapp | Management
data Screen = Screen
data Context = Device | Merchant | C_Hypersdk | C_Network | Payment | C_User


data Subcategory
  = LC Lifecycle
  | A Action
  | AC ApiCall
  | S Screen
  | C Context

instance encodeSubcategory :: Encode Subcategory where
  encode = encode <<< show

derive instance subcategory :: Generic Subcategory _
instance showSubcategory :: Show Subcategory where
  show (LC lc) = toLower $ show lc
  show (A a) = toLower $ show a
  show (AC ac) = toLower $ show ac
  show (S s) = toLower $ show s
  show (C c) = toLower $ show c

instance encodeLifecycle :: Encode Lifecycle where
  encode = encode <<< show

derive instance lifecycle :: Generic Lifecycle _
instance showLifecycle :: Show Lifecycle where
  show = toLower <<< genericShow

instance encodeAction :: Encode Action where
  encode = encode <<< show

derive instance action :: Generic Action _
instance showAction :: Show Action where
  show = toLower <<< genericShow

instance encodeApiCall :: Encode ApiCall where
  encode = encode <<< show

derive instance apiCall :: Generic ApiCall _
instance showApi_Call :: Show ApiCall where
  show AC_Microapp = "microapp"
  show x = toLower $ genericShow x

instance encodeScreen :: Encode Screen where
  encode = encode <<< show

derive instance screen :: Generic Screen _
instance showScreen :: Show Screen where
  show = toLower <<< genericShow

instance encodeContext :: Encode Context where
  encode = encode <<< show

derive instance context :: Generic Context _
instance showContext :: Show Context where
  show C_Hypersdk = "hypersdk"
  show C_Network = "network"
  show C_User = "user"
  show x = toLower $ genericShow x
