{-# LANGUAGE BangPatterns #-}
import Control.Monad

get_segment :: [Int] -> (Int, Int) -> [Int]
get_segment list (a,b) = map ((!!) list) [a..b]

get_segment_minimum :: [Int] -> (Int, Int) -> Int
get_segment_minimum list (a,b)
    | list !! a == 1 = 1
    | otherwise = get_segment_minimum' (list !! a) sublist
    where
        !sublist = (take b $ drop (a+1) list)
        get_segment_minimum' :: Int -> [Int] -> Int
        get_segment_minimum' m [] = m
        get_segment_minimum' m (x:xs)
            | x < m = get_segment_minimum' x xs
            | otherwise = get_segment_minimum' m xs

myMinimum :: [Int] -> Int
myMinimum (x:xs)
    | x == 1 = 1
    | otherwise = myMinimum' x xs
    where
        myMinimum' :: Int -> [Int] -> Int
        myMinimum' m [] = m
        myMinimum' m (x:xs)
            | x == 1 = 1
            | x < m = myMinimum' x xs
            | otherwise = myMinimum' m xs

main :: IO ()
main = do
    [n,t] <- liftM (map read . words) getLine
    print "Parse spaces"
    spaces <- liftM (map read . words) getLine
    print "Parse tests"
    tests <- replicateM t $ do
        [a,b] <- liftM (map read . words) getLine
        return (a,b)

    print "Start calc"

    mapM_ (print . myMinimum . get_segment spaces) tests

    return ()
