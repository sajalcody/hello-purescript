module Ch05.Assignment where

import Prelude

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