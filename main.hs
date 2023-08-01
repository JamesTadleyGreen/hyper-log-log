import Data.Bits (FiniteBits (countTrailingZeros))
import Data.Hashable (Hashable (hash))
import Data.List (nub)

test = [1, 1, 1, 2, 2, 1, 3, 4, 5, 6, 4, 3, 2, 4, 5, 6, 4]

deterministicCount :: [Int] -> Int
deterministicCount = length . nub

-- probablisticCount :: [Int] -> Int
probablisticCount l = maximum $ map (countTrailingZeros . hash) l

main = do
  print $ deterministicCount test
  print $ probablisticCount test
