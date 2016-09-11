import Control.Monad

get_poisened_sweet :: (Int,Int,Int) -> Int
get_poisened_sweet (n,m,s) = res'
    where
        res = (m `mod` n + s `mod` n - 1) `mod` n
        res' = if res == 0
            then n
            else res

main :: IO ()
main = do
    t <- readLn
    tests <- replicateM t $ do
        [n,m,s] <- liftM (map read . words) getLine
        return (n,m,s)

    mapM_ (print . get_poisened_sweet) tests
