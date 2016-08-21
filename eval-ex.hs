fact :: Integer -> Integer
fact 0 = 1
fact 1 = 1
fact n = n * fact (n-1)

solve :: Double -> Double
solve x = sum $ map (calc_val x) [0..9]

calc_val :: Double -> Integer -> Double
calc_val x p = (x^p) / fromInteger (fact p)

main :: IO ()
main = getContents >>= mapM_ print. map solve. map (read::String->Double). tail. words

