module Ch02.Assignment where

import Prelude
import Math (pi)

{-
Use the pi constant, which is defined in the Math module,
to write a function circleArea which computes the area of a circle with a given radius.
-}

circleArea :: Number -> Number
circleArea r = pi * r * r