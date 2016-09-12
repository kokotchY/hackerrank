import Control.Monad

count_square :: [Int] -> Int
count_square = length . filter is_square

is_square :: Int -> Bool
is_square n = any (\x -> x ^ 2 == n) [1..limit]
    where
        limit = floor $ sqrt $ fromIntegral n

count_square' :: (Int,Int) -> Int
count_square' (a,b) = floor (sqrt $ fromIntegral b) - ceiling (sqrt $ fromIntegral a) + 1 

main :: IO ()
main = do
    t <- readLn
    tests <- replicateM t $ do
        [a,b] <- liftM (map read . words) getLine
        return (a,b)

    mapM_ (print . count_square') tests
