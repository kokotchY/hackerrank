import Control.Monad

convert :: Int -> [Int]
convert = reverse . convert'
    where
        convert' n
            | n <= 9 = [n]
            | otherwise = b:convert' a
            where
                (a,b) = n `divMod` 10

nb_div :: Int -> Int
nb_div n = length divisors
    where
        divisors = filter ((==0) . (n `mod`)) $ filter (/= 0) $ convert n

main :: IO ()
main = do
    t <- readLn
    tests <- replicateM t (liftM read getLine) :: IO [Int]

    mapM_ (print . nb_div) tests
