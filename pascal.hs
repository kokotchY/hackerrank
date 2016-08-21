fac :: Int -> Int
fac 0 = 1
fac 1 = 1
fac n = n * fac (n-1)

calc_val :: Int -> Int -> Int
calc_val n r = fac n `div` (fac r * fac (n-r))

gen_line :: Int -> [Int]
gen_line n = map (calc_val n) [0..n]

pascal :: [[Int]]
pascal = map gen_line [0..]

main :: IO ()
main = do
    k <- readLn :: IO Int

    let head_pascal = take k pascal
    mapM_ (putStrLn . unwords . map show) head_pascal

