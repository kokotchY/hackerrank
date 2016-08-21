import Control.Monad

notDiv :: [Int] -> Int -> Int -> Bool
notDiv nbs k n = and $ map (\x -> (x+n) `mod` k /= 0) nbs'
    where
        nbs' = filter (/= n) nbs

main :: IO ()
main = do
    [n,k] <- liftM (map read . words) getLine :: IO [Int]
    nbs <- liftM (map read . words) getLine :: IO [Int]

    let nbs' = filter (notDiv nbs k) nbs
    print nbs'
    print $ length nbs'

