-- part 5. Variant (7, 8, 9), n = 9
-- Maybe-функції для виразів:
-- f7(x) = 1 / lg(x^2 - n)
-- f8(x) = lg(x - 1/n)
-- f9(x) = sqrt(x - 1/n)
import Text.Printf (printf)

nValue :: Double
nValue = 9.0

eps :: Double
eps = 1e-9

safeLog10 :: Double -> Maybe Double
safeLog10 x
    | x > 0     = Just (logBase 10 x)
    | otherwise = Nothing

safeSqrt :: Double -> Maybe Double
safeSqrt x
    | x >= 0    = Just (sqrt x)
    | otherwise = Nothing

safeDiv :: Double -> Double -> Maybe Double
safeDiv _ y | abs y < eps = Nothing
safeDiv x y = Just (x / y)

-- u1(x) = f7(x) = 1 / lg(x^2 - n), n = 9
u1 :: Double -> Maybe Double
u1 x = do
    logarithm <- safeLog10 (x * x - nValue)
    safeDiv 1 logarithm

-- u2(x) = f8(x) = lg(x - 1/n), n = 9
u2 :: Double -> Maybe Double
u2 x = safeLog10 (x - 1 / nValue)

-- u3(x) = f9(x) = sqrt(x - 1/n), n = 9
u3 :: Double -> Maybe Double
u3 x = safeSqrt (x - 1 / nValue)

-- u1(u2(u3(x))) з do-нотацією
compositionDo :: Double -> Maybe Double
compositionDo x = do
    a <- u3 x
    b <- u2 a
    u1 b

-- u1(u2(u3(x))) без do-нотації
compositionBind :: Double -> Maybe Double
compositionBind x = u3 x >>= u2 >>= u1

-- v(y, z) = sqrt(y - 1/z)
v :: Double -> Double -> Maybe Double
v _ z | abs z < eps = Nothing
v y z = safeSqrt (y - 1 / z)

-- v(u1(x), u2(x)) з do-нотацією
composition2Do :: Double -> Maybe Double
composition2Do x = do
    a <- u1 x
    b <- u2 x
    v a b

-- v(u1(x), u2(x)) без do-нотації
composition2Bind :: Double -> Maybe Double
composition2Bind x = u1 x >>= \a -> u2 x >>= \b -> v a b

formatMaybe :: Maybe Double -> String
formatMaybe Nothing = "Nothing"
formatMaybe (Just x) = "Just " ++ printf "%.6f" x

approxMaybe :: Maybe Double -> Maybe Double -> Bool
approxMaybe Nothing Nothing = True
approxMaybe (Just a) (Just b) = abs (a - b) < 1e-6
approxMaybe _ _ = False

runUnaryTest :: Int -> String -> (Double -> Maybe Double) -> Double -> Maybe Double -> IO ()
runUnaryTest number name fn x expected = do
    let result = fn x
    putStrLn $ "Test " ++ show number ++ " — " ++ name ++ ":"
    putStrLn $ "  Input:    x = " ++ show x
    putStrLn $ "  Expected: " ++ formatMaybe expected
    putStrLn $ "  Result:   " ++ formatMaybe result
    putStrLn $ if approxMaybe result expected then "  PASS\n" else "  FAIL\n"

runBinaryTest :: Int -> String -> (Double -> Double -> Maybe Double) -> Double -> Double -> Maybe Double -> IO ()
runBinaryTest number name fn y z expected = do
    let result = fn y z
    putStrLn $ "Test " ++ show number ++ " — " ++ name ++ ":"
    putStrLn $ "  Input:    y = " ++ show y ++ ", z = " ++ show z
    putStrLn $ "  Expected: " ++ formatMaybe expected
    putStrLn $ "  Result:   " ++ formatMaybe result
    putStrLn $ if approxMaybe result expected then "  PASS\n" else "  FAIL\n"

runPairTest :: Int -> String -> (Double -> Maybe Double) -> (Double -> Maybe Double) -> Double -> Maybe Double -> IO ()
runPairTest number name fnDo fnBind x expected = do
    let resultDo = fnDo x
    let resultBind = fnBind x
    putStrLn $ "Test " ++ show number ++ " — " ++ name ++ ":"
    putStrLn $ "  Input:       x = " ++ show x
    putStrLn $ "  Expected:    " ++ formatMaybe expected
    putStrLn $ "  do-result:   " ++ formatMaybe resultDo
    putStrLn $ "  bind-result: " ++ formatMaybe resultBind
    putStrLn $ if approxMaybe resultDo expected && approxMaybe resultBind expected
        then "  PASS\n" else "  FAIL\n"

main :: IO ()
main = do
    runUnaryTest 1 "u1 = f7" u1 4.0 (Just 1.1832946624549383)
    runUnaryTest 2 "u2 = f8" u2 10.0 (Just 0.9951474972055879)
    runUnaryTest 3 "u3 = f9" u3 25.0 (Just 4.988876515698588)
    runPairTest 4 "u1(u2(u3(x)))" compositionDo compositionBind 3000000.0 (Just 5.792719455650831)
    runBinaryTest 5 "v(y,z)" v 10.0 9.0 (Just 3.1446603773522015)
    runBinaryTest 6 "v(y,z), zero denominator" v 5.0 0.0 Nothing
    runPairTest 7 "v(u1(x), u2(x))" composition2Do composition2Bind 3.3 (Just 1.2773365079353625)
    runUnaryTest 8 "u3, negative radicand" u3 0.0 Nothing
    runUnaryTest 9 "u2, invalid logarithm argument" u2 0.0 Nothing
    runUnaryTest 10 "u1, zero logarithm denominator" u1 (sqrt 10.0) Nothing
    runPairTest 11 "u1(u2(u3(x))), invalid intermediate value" compositionDo compositionBind 1.0 Nothing
