module Ch02.Exercise where

import Math (sqrt)
import Prelude
import Effect (Effect)
import Effect.Console (log)

diagonal :: Number -> Number -> Number
diagonal w h = sqrt $ w*w + h*h

add :: Int -> Int -> Int
add = \x y -> x + y
-- OR add x y = x + y

main :: Effect Unit
main = do
  log "Hello sailor!"
  log $ show  $ diagonal 3.0 4.0 -- log $ show => logShow
