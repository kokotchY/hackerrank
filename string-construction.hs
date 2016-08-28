import Control.Monad
import Data.List

calc_cost :: String -> String -> Int
calc_cost [] _ = 0
calc_cost word@(s:ss) p =
    case substring of
        Just (v,_) -> calc_cost (drop (length v) word) (p ++ v)
        Nothing -> 1 + calc_cost ss (p ++ [s])
    where
        substrings = drop 1 $ subsequences p
        substrings' = reverse $ sort $ filter (\sub -> sub `isPrefixOf` word) substrings
        substring = uncons' substrings'

uncons' :: [a] -> Maybe (a, [a])
uncons' [] = Nothing
uncons' (a:as) = Just (a, as)


calc_cost' :: String -> Int
calc_cost' = calc_cost'' []
    where
        calc_cost'' :: String -> String -> Int
        calc_cost'' str [] = length str
        calc_cost'' str (x:xs)
            | x `elem` str = calc_cost'' str xs
            | otherwise = calc_cost'' (x:str) xs


main :: IO ()
main = do
    n <- readLn
    words <- replicateM n getLine
    mapM_ (putStrLn . show . calc_cost') words
