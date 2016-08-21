import Control.Monad

nb_win :: [Int] -> Int -> Int -> Int
nb_win [] _ _ = 0

main :: IO ()
main = do
    n <- liftM read getLine :: IO Int
    clouds <- liftM (map read . words) getLine :: IO [Int]

    return ()
