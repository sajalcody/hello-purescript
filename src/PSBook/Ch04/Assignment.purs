module Ch04.Assignment where

import Prelude
import Data.Array.Partial (head, tail)
import Partial.Unsafe (unsafePartial)
import Data.Array (length, filter)
import Ch04.Exercise (getAllFactors)

{-
Write a recursive function which returns true if and only if its input is an even integer.
-}
isEven :: Int -> Boolean
isEven num = (mod num 2) == 0

{-
Write a recursive function which counts the number of even integers in an array
-}
countEven :: Array Int -> Int
countEven [] = 0
countEven arr =
  let count = if isEven (unsafePartial head arr) then 1 else 0
  in count + countEven (unsafePartial tail arr)

countEven' :: Array Int -> Int
countEven' = length <<< filter isEven
-- OR countEven' arr = length $ filter isEven arr

{-
 Use the map or <$> function to write a function which calculates the squares of an array of numbers.
-}

squared :: Array Int -> Array Int
squared arr = (\x -> x*x) <$> arr

{-
Use the filter function to write a function which removes the negative numbers from an array of numbers.
-}

removeNegative :: Array Int -> Array Int
removeNegative arr = filter (\x -> x >= 0) arr

{-
 Define an infix synonym <$?> for filter. Rewrite your answer to the previous question to use your new operator
-}
-- [TODO]

{-
Use the factors function to define a function isPrime which tests if its integer argument is prime or not
-}
isPrime :: Int -> Boolean
isPrime n = length (getAllFactors n) == 2
-- OR isPrime = (==) 2 <<< length <<< getAllFactors

{-
Write a function which uses do notation to find the cartesian product of two arrays,
i.e. the set of all pairs of elements a, b, where a is an element of the first array, and b is an element of the second.
-}
getCartesianProduct :: Array Int -> Array Int -> Array (Array Int)
getCartesianProduct arrA arrB = do
  a <- arrA
  b <- arrB
  [[a,b]]