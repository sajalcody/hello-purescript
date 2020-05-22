module Ch05.Exercise where

import Prelude

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