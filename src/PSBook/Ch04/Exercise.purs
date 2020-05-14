module Ch04.Exercise where

-- import Prelude
import Data.Array (null, tail, (..), concatMap, filter, concat, nubBy)
import Data.Array.Partial as P
import Data.Maybe (Maybe(..))
import Control.Bind ((>>=), bind)
import Control.Semigroupoid ((<<<)) -- inside Prelude
import Data.Ord (compare) -- inside Prelude
import Data.Show (show) -- inside Prelude
import Data.Functor ((<$>), map) -- inside Prelude
import Data.Eq ((==)) -- inside Prelude
import Data.Function (($)) -- inside Prelude
import Data.Ring ((-)) -- inside Prelude
import Data.Semiring ((+), (*)) -- inside Prelude
import Data.Semigroup ((<>)) -- inside Prelude
import Partial.Unsafe (unsafePartial)
import Data.Foldable (product, foldl, foldr)

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1) -- Parentheses are mandatory

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- Using if-else
-- length :: Array Int -> Int
-- length arr =
--   if null arr then 0
--   else 1 + length
--     (case tail arr of
--       Just a -> a
--       Nothing -> [])

-- Using Pattern Match
length' :: Array Int -> Int
length' [] = 0
length' arr = 1 + length'
    (case tail arr of
      Just a -> a
      Nothing -> [])

length'' :: Array Int -> Int
length'' [] = 0
length'' arr = 1 + length'' (unsafePartial P.tail arr)

intArrayToStringArr :: Array Int -> Array String
intArrayToStringArr arr = show <$> arr

incByN :: Array Int -> Int -> Array Int
incByN arr n = (\x -> x + n) <$> arr

getRange :: Int -> Int -> Array Int
getRange m n = m .. n

appendSquares :: Array Int -> Array Int
appendSquares = concatMap (\n -> [n, n*n])

getAllPairs :: Int -> Array (Array Int)
getAllPairs n = concatMap (\i ->
                  (\j -> [i,j]) <$> (i .. n)) (1 .. n)

getAllValidPairs :: Int -> Array (Array Int)
getAllValidPairs n = filter (\pair -> product pair == n) $ getAllPairs n

-- Find all factors of a number
getAllFactors :: Int -> Array Int
getAllFactors = nubBy compare <<< concat <<< getAllValidPairs
-- OR getAllFactors = compose (nubBy compare) $ compose concat getAllValidPairs

factors :: Int -> Array Int
factors n = nubBy compare $ concat $ filter (\pair -> product pair == n) $ do
  i <- 1 .. n
  j <- 1 .. n
  [[i,j]]
-- factors n = [[1 .. n, 1 .. n]] >>= filter (\pair -> product pair == n) TODO: Wrong result??

showInt :: Int -> Array String
showInt n = map show $ 1 .. n
{- OR showInt n = map show $ do
  i <- 1 .. n
  [i] -}
-- OR showInt n = [1 .. n] >>= map show
-- OR showInt n = bind [1 .. n] $ map show

showInorder :: Int -> String
showInorder n = foldl (\acc x -> acc <> show x) "" $ 1 .. n

showReverseorder :: Int -> String
showReverseorder n = foldr (\x acc-> acc <> show x) "" $ 1 .. n