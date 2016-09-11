import Control.Monad
import Data.List

calc_min_distance :: [Int] -> Int -> Int
calc_min_distance stations x = minimum distance
    where
        distance = map (\s -> abs $ s-x) stations

create_chains :: [Int] -> [Int] -> [[Int]]
create_chains _ [] = []
create_chains stations list = c:create_chains stations r'
    where
        (c, r) = span (not . (`elem` stations)) list
        r' = case r of
            [] -> []
            list -> tail list

compare_length :: [Int] -> [Int] -> Ordering
compare_length l1 l2 = compare (length l1) (length l2)

main :: IO ()
main = do
    [n,m] <- liftM (map read . words) getLine :: IO [Int]
    stations <- liftM (sort . map read . words) getLine :: IO [Int]

    let chains = filter (not . null) $ create_chains stations [0..n-1]
        max_chains = maximumBy compare_length chains
        res = case chains of
            [] -> 0
            list -> (length max_chains + 1) `div` 2

    print res

    return ()
