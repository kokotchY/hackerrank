import Control.Monad

solve :: Integer -> Integer -> Integer
solve n k = super_digit $ k * (map (read . flip (:) [] ) $ show n)

super_digit :: Integer -> Integer
super_digit n
    | n <= 9 = n
    | otherwise = super_digit $ sum digits
    where
        digits = map (read . flip (:) []) $ show n

main :: IO ()
main = do
    [n,k] <- liftM (map read . words) getLine :: IO [Integer]
    {-let nb = read $ concat $ replicate k $ show n-}
    print $ solve n k
