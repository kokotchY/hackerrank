import Control.Monad

calc_kangaroos :: (Int,Int) -> (Int,Int) -> Bool
calc_kangaroos (x1,v1) (x2,v2)
    | dv == 0 = False
    | (dx `mod` dv == 0) && (dx `div` dv > 0) = True
    | otherwise = False
    where
        dx = x1-x2
        dv = v2-v1

main :: IO ()
main = do
    [x1,v1,x2,v2] <- liftM (map read . words) getLine :: IO [Int]
    if calc_kangaroos (x1,v1) (x2,v2)
        then putStrLn "YES"
        else putStrLn "NO"
