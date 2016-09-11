import Control.Monad

getPos :: [Int] -> Int -> Int -> Int
getPos list rot pos = list !! pos'
    where
        pos' = if (pos-rot) >= 0
            then pos-rot
            else pos-rot+length list

main :: IO ()
main = do
    [n,k,q] <- liftM (map read . words) getLine :: IO [Int]
    list <- liftM (map read . words) getLine :: IO [Int]
    queries <- replicateM q (liftM read getLine) :: IO [Int]

    mapM_ (print . getPos list (k `mod` n)) queries
