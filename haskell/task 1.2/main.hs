-- part 1 (I-b). 64
-- Розбити список на чотири списки відповідно з числами, що мають вигляд 4k, 4k+1, 4k+2 та 4k+3.
import Data.List (intercalate)

splitByRemainder4 :: Integral a => [a] -> [[a]]
splitByRemainder4 xs = [filter (\x -> x `mod` 4 == r) xs | r <- [0..3]]

parseInput :: String -> [Int]
parseInput = map read . words

showArray :: Show a => [a] -> String
showArray arr = "[" ++ intercalate ", " (map show arr) ++ "]"

show2DArray :: Show a => [[a]] -> String
show2DArray arr = "[" ++ intercalate ", " (map showArray arr) ++ "]"

runTest :: Int -> [Int] -> [[Int]] -> IO ()
runTest n input expected = do
    let result = splitByRemainder4 input
    putStrLn $ "Test " ++ show n ++ ":"
    putStrLn $ "  Input:    " ++ showArray input
    putStrLn $ "  Expected: " ++ show2DArray expected
    putStrLn $ "  Result:   " ++ show2DArray result
    putStrLn $ if result == expected then "  PASS\n" else "  FAIL\n"

main :: IO ()
main = do
    runTest 1 [0,1,2,3,4,5,6,7]
        [[0,4], [1,5], [2,6], [3,7]]

    runTest 2 [10,11,12,13,14,15]
        [[12], [13], [10,14], [11,15]]

    runTest 3 [-4,-3,-2,-1,0,1,2,3]
        [[-4,0], [-3,1], [-2,2], [-1,3]]

    runTest 4 []
        [[], [], [], []]
