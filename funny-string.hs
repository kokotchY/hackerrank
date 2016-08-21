import Control.Monad
import Data.Char

is_funny :: String -> Bool
is_funny s = is_funny' s' (reverse s')
    where
        s' = map ord s
        is_funny' :: [Int] -> [Int] -> Bool
        is_funny' s r = and $ map (\i -> calc_v s i == calc_v r i) [1..length s - 1]


is_funny' :: String -> Bool
is_funny' s = is_funny'' (map ord s) 1
    where
        is_funny'' :: [Int] -> Int -> Bool
        is_funny'' s idx
            | idx < l_s - 1 = v_s == v_r && is_funny'' s (idx+1)
            | otherwise = True
            where
                v_s = abs (s !! idx - s !! (idx - 1))
                v_r = abs (s !! (l_s - 1 - (idx-1)) - s !! (l_s - 1 - (idx-1) - 1))
                l_s = length s

calc_v :: [Int] -> Int -> Int
calc_v nb i = abs $ nb !! i - nb !! (i-1)

main :: IO ()
main = do
    t <- liftM read getLine
    tests <- replicateM t getLine
    mapM_ (\s -> if is_funny' s then putStrLn "Funny" else putStrLn "Not Funny") tests
