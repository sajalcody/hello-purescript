module Config where

import Prelude
-- import Control.Monad.Except (runExcept)
-- import Data.Either (Either(..))
-- import Presto.Core.Utils.Encoding (defaultDecodeJSON)
-- import Types.Config (Config(..))
import Effect (Effect)
import Effect.Console (log)
import Unsafe.Coerce


foreign import getConfig :: Effect String

-- defaultConfig :: Config
-- defaultConfig =
--   Config
--     { lifecycle: ["android", "ios"]
--     , action: ["user"]
--     , apicall: ["network", "microapp"]
--     , context: ["device", "user", "payment"]
--     , screen: ["screen"]
--     }

getLogConfig :: String
getLogConfig = show $ unsafeCoerce getConfig