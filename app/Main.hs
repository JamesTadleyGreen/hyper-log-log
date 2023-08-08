import Criterion.Main
import Data.Bits (FiniteBits (countTrailingZeros))
import Data.Hashable (Hashable (hash))
import Data.List
import System.Random

randomList :: [Int] -> StdGen -> Int -> [Int]
randomList l g n = take n $ randomRs (0, length l - 1) g

deterministicCount :: [Int] -> Int
deterministicCount = length . nub

probablisticCount :: [Int] -> Int
probablisticCount l = maximum $ map (countTrailingZeros . hash) l

main = do
  seed <- getStdGen
  let test = randomList [1 .. 1000000] seed 10000
  print test
  let probablistic = probablisticCount test
  print probablistic
  let deterministic = deterministicCount test
  print deterministic
  let accuracy = (fromIntegral deterministic) / (fromIntegral probablistic)
  print accuracy
