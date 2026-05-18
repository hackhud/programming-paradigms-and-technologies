-- part 1 (I-a). 26
-- Вилучити зі списку елементи, що мають непарну кількість входжень у список.
import Data.List (intercalate)

count :: Eq a => a -> [a] -> Int
count x = length . filter (== x)

removeOddOccurrences :: Eq a => [a] -> [a]
removeOddOccurrences arr = filter (\x -> even (count x arr)) arr

parseInput :: Read a => String -> [a]
parseInput = map read . words

showArray :: Show a => [a] -> String
showArray arr = "[" ++ intercalate ", " (map show arr) ++ "]"

runTest :: (Eq a, Show a) => Int -> [a] -> [a] -> IO ()
runTest n input expected = do
    let result = removeOddOccurrences input
    putStrLn $ "Test " ++ show n ++ ":"
    putStrLn $ "  Input:    " ++ showArray input
    putStrLn $ "  Expected: " ++ showArray expected
    putStrLn $ "  Result:   " ++ showArray result
    putStrLn $ if result == expected then "  PASS\n" else "  FAIL\n"

main :: IO ()
main = do
    runTest 1 [1,2,3,2,4,5,1] ([1,2,2,1] :: [Int])
    runTest 2 ["a","b","a","c","c","d"] ["a","a","c","c"]
    runTest 3 [1.1,2.2,1.1,3.3,3.3,4.4] ([1.1,1.1,3.3,3.3] :: [Double])
    runTest 4 ([] :: [Int]) []
