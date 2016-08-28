import Control.Monad

is_beautiful :: Int -> (Int,Int,Int) -> Bool
is_beautiful d (i,j,k) = (j-i) == d && (k-j) == d

get_value :: [Int] -> (Int,Int,Int) -> (Int,Int,Int)
get_value l (i,j,k) = (l !! i, l !! j, l !! k)

get_triplets :: Int -> [Int] -> [(Int,Int,Int)]
get_triplets d list = filter (is_beautiful d) list'
    where
        list' = map (get_value list) triplets
        triplets = [(i,j,k) | i <- nb, j <- nb, k <- nb, i < j, j < k]
        nb = [0..length list-1]

get_nb_triplets :: Int -> [Int] -> Int
get_nb_triplets d list = length $ filter (\x -> x+d `elem` list && x+(2*d) `elem` list) list

main :: IO ()
main = do
    [n,d] <- liftM (map read . words) getLine :: IO [Int]
    list <- liftM (map read . words) getLine :: IO [Int]

    print $ length $ get_triplets d list
