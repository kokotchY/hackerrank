import Control.Monad

calc_energy :: Int -> Int -> [Int] -> Int
calc_energy n k clouds = 100 - sum [1 + 2 * (clouds !! i) | i <- range 0 k n]

range :: Int -> Int -> Int -> [Int]
range start step end
    | start >= end = []
    | otherwise = start:range (start+step) step end

main :: IO ()
main = do
    [n,k] <- liftM (map read . words) getLine :: IO [Int]
    clouds <- liftM (map read . words) getLine :: IO [Int]

    let energy = calc_energy n k clouds
    print energy
