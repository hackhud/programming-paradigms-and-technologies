-- part 4. Variant 2, task 1
-- Виявити породжуючі та непороджуючі нетермінали. Елімінувати непороджуючі нетермінали.
import Data.List (intercalate, nub, sort, (\\))

data Symbol = T String | NT String deriving (Eq, Ord)
type Rule = (String, [Symbol])
type Grammar = [Rule]

instance Show Symbol where
    show (T s) = s
    show (NT s) = s

fixPoint :: Eq a => (a -> a) -> a -> a
fixPoint f x =
    let x' = f x
    in if x == x' then x else fixPoint f x'

rhsNonterminals :: [Symbol] -> [String]
rhsNonterminals rhs = [n | NT n <- rhs]

allNonterminals :: Grammar -> [String]
allNonterminals g = sort . nub $ [lhs | (lhs, _) <- g] ++ concatMap (rhsNonterminals . snd) g

isGeneratingSymbol :: [String] -> Symbol -> Bool
isGeneratingSymbol _ (T _) = True
isGeneratingSymbol generating (NT n) = n `elem` generating

generatingNonterminals :: Grammar -> [String]
generatingNonterminals g = fixPoint step []
  where
    step current = sort . nub $ current ++
        [lhs | (lhs, rhs) <- g, all (isGeneratingSymbol current) rhs]

nonGeneratingNonterminals :: Grammar -> [String]
nonGeneratingNonterminals g = allNonterminals g \\ generatingNonterminals g

eliminateNonGenerating :: Grammar -> Grammar
eliminateNonGenerating g =
    let gen = generatingNonterminals g
    in [(lhs, rhs) | (lhs, rhs) <- g,
        lhs `elem` gen,
        all (isGeneratingSymbol gen) rhs]

showArray :: Show a => [a] -> String
showArray arr = "[" ++ intercalate ", " (map show arr) ++ "]"

showRule :: Rule -> String
showRule (lhs, []) = lhs ++ " -> ε"
showRule (lhs, rhs) = lhs ++ " -> " ++ unwords (map show rhs)

showGrammar :: Grammar -> String
showGrammar g = "[" ++ intercalate "; " (map showRule g) ++ "]"

runTest :: Int -> Grammar -> [String] -> [String] -> Grammar -> IO ()
runTest n grammar expectedGen expectedNonGen expectedClean = do
    let gen = generatingNonterminals grammar
    let nonGen = nonGeneratingNonterminals grammar
    let clean = eliminateNonGenerating grammar
    putStrLn $ "Test " ++ show n ++ ":"
    putStrLn $ "  Generating expected:     " ++ showArray expectedGen
    putStrLn $ "  Generating result:       " ++ showArray gen
    putStrLn $ "  Non-generating expected: " ++ showArray expectedNonGen
    putStrLn $ "  Non-generating result:   " ++ showArray nonGen
    putStrLn $ "  Clean grammar expected:  " ++ showGrammar expectedClean
    putStrLn $ "  Clean grammar result:    " ++ showGrammar clean
    putStrLn $ if gen == expectedGen && nonGen == expectedNonGen && clean == expectedClean then "  PASS\n" else "  FAIL\n"

grammar1 :: Grammar
grammar1 =
    [ ("S", [NT "A", NT "B"])
    , ("A", [T "a"])
    , ("B", [NT "C"])
    , ("C", [T "c"])
    , ("D", [NT "D"])
    ]

grammar2 :: Grammar
grammar2 =
    [ ("S", [NT "A"])
    , ("A", [NT "B"])
    , ("B", [NT "C"])
    , ("C", [T "c"])
    , ("X", [NT "Y"])
    , ("Y", [NT "X"])
    ]

grammar3 :: Grammar
grammar3 =
    [ ("S", [NT "A", NT "B"])
    , ("A", [T "a"])
    , ("B", [NT "C"])
    , ("C", [NT "B"])
    ]

grammar4 :: Grammar
grammar4 =
    [ ("S", [NT "A", NT "B"])
    , ("A", [])
    , ("B", [T "b"])
    , ("C", [NT "D"])
    , ("D", [T "e"])
    ]

main :: IO ()
main = do
    runTest 1 grammar1
        ["A", "B", "C", "S"] ["D"]
        [("S", [NT "A", NT "B"]), ("A", [T "a"]), ("B", [NT "C"]), ("C", [T "c"])]

    runTest 2 grammar2
        ["A", "B", "C", "S"] ["X", "Y"]
        [("S", [NT "A"]), ("A", [NT "B"]), ("B", [NT "C"]), ("C", [T "c"])]

    runTest 3 grammar3
        ["A"] ["B", "C", "S"]
        [("A", [T "a"])]

    runTest 4 grammar4
        ["A", "B", "C", "D", "S"] []
        grammar4
