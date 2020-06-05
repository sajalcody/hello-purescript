module Ch05.Assignment where

import Prelude
import Ch03.AddressBook (Entry)

{-
Write the factorial function using pattern matching
-}
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

{-
write a function which computes binomial coefficients using Pascal's rule
-}
binomialCoeff :: Int -> Int -> Int
binomialCoeff n 0 = 1
binomialCoeff 0 k = 0
binomialCoeff n k = binomialCoeff (n-1) k + binomialCoeff (n-1) (k-1)

{-
Write a function sameCity which uses record patterns to test whether two Person records belong to the same city
-}
sameCity :: Entry -> Entry -> Boolean
sameCity {address: {city: x}} {address: {city:y}}
  | x == y = true
  | otherwise = false

{-
What is the most general type of the sameCity function, taking into account row polymorphism?
What about the livesInLA function defined above
-}
-- sameCity :: {address: {city: x | r1} | r3} -> {address: {city:y | r2} | r4} -> Boolean

{-
Write a function fromSingleton which uses an array literal pattern to extract the sole member of a singleton array. 
If the array is not a singleton, your function should return a provided default value
-}
fromSingleton :: forall a. a -> Array a -> a
fromSingleton default [singleEle] = singleEle
fromSingleton default _ = default