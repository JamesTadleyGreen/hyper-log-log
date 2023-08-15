import Criterion.Main
import Data.Bits (FiniteBits (countTrailingZeros))
import Data.Hashable (Hashable (hash))
import Data.List
import System.Random

phi :: Float
phi = 0.77351

randomList :: (Int, Int) -> StdGen -> Int -> [Int]
randomList i g n = take n $ randomRs i g

deterministicCount :: [Int] -> Int
deterministicCount = length . nub

probablisticCount :: [Int] -> Float
probablisticCount l = 2 ^ maximum (map (countTrailingZeros . hash) l) / phi

main = do
  seed <- getStdGen
  let test = randomList (1, 100000) seed 50000
  let probablistic = probablisticCount test
  print probablistic
  let deterministic = deterministicCount test
  print deterministic
  let accuracy = fromIntegral deterministic / probablistic
  print accuracy
