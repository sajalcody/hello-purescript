module Ch05.Exercise where

import Prelude
import Ch03.AddressBook (Entry)
import Ch03.Assignment (entry1,entry2)
import Data.Array.Partial (tail)
import Partial.Unsafe (unsafePartial)

-- GCD using pattern matching
gcd :: Int -> Int -> Int
gcd n 0 = n
gcd 0 m = m
gcd n m = 
  if n > m
    then gcd (n - m) m
  else gcd n $ m - n


-- GCD using Guards
gcd_ :: Int -> Int -> Int
gcd_ n 0 = n
gcd_ 0 m = m
gcd_ m n | n > m = gcd (n - m) m
         | otherwise = gcd n $ m - n

fromString :: String -> Boolean
fromString "true" = true
fromString _ = false

toString :: Boolean -> String
toString true = "true"
toString false = "false"

isEmpty :: forall a. Array a -> Boolean
isEmpty [] = true
isEmpty _ = false

{-Checkout type for showPersom after commenting type signature-}
showPerson :: {first :: String, last :: String} -> String
showPerson {first: x, last: y} = x <> " " <> y
-- OR showPerson p = p.first <> " " <> p.last
{- Test Cases
With type signature: showPerson {first: "Sajal", last: "Agrawal"}
without type sign.: showPerson {first: "Sajal", last: "Agrawal", lang: "PureScript"}
-}

liveInLA :: Entry -> Boolean
liveInLA {address: {state: "LA"}} = true
liveInLA _ = false

isEqual :: forall a. Eq a => a -> a -> Boolean
isEqual a b | a == b = true
            | otherwise = false
-- WRONG: isEqual x x = true

-- Longest Zero Suffix
-- lzs :: Array Int -> Array Int
-- lzs [] = []
-- lzs xs = case sum xs of
--           0 -> xs
--           _ -> 