import Control.Monad

calc_nb_chocolates :: (Int,Int,Int) -> Int
calc_nb_chocolates (n,c,m) = nb + calc_wrappers nb m
    where
        nb = n `div` c

calc_wrappers :: Int -> Int -> Int
calc_wrappers n m
    | n < m = 0
    | otherwise = a + calc_wrappers (a+b) m
    where
        (a,b) = n `divMod` m

main :: IO ()
main = do
    t <- readLn
    trips <- replicateM t $ do
        [n,c,m] <- liftM (map read . words) getLine
        return (n,c,m)

    mapM_ (print . calc_nb_chocolates) trips
    return ()
