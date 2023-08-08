import Data.Bits (FiniteBits (countTrailingZeros))
import Data.Hashable (Hashable (hash))
import Data.List (nub)
import Date.Random.Extras (sample)

integers = [1 ..]

test = sample 100 integers

deterministicCount :: [Int] -> Int
deterministicCount = length . nub

probablisticCount :: [Int] -> Int
probablisticCount l = maximum $ map (countTrailingZeros . hash) l

main = do
  print $ deterministicCount test
  print $ probablisticCount test
