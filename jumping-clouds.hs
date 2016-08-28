import Control.Monad

calc_jump :: Int -> [Int] -> Int
calc_jump idx clouds
    | idx == l_clouds - 1 = 0
    | otherwise = min one_jump two_jump
    where
        one_jump = if can_one_jump && clouds !! (idx+1) /= 1
                    then 1 + (calc_jump (idx+1) clouds)
                    else (l_clouds + 1)
        two_jump = if can_two_jump && clouds !! (idx+2) /= 1
                    then 1 + (calc_jump (idx+2) clouds)
                    else (l_clouds + 1)
        l_clouds = length clouds
        can_one_jump = (idx+1) < l_clouds
        can_two_jump = (idx+2) < l_clouds

main :: IO ()
main = do
    n <- liftM read getLine :: IO Int
    clouds <- liftM (map read . words) getLine :: IO [Int]

    print $ calc_jump 0 clouds
