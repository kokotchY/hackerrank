import Control.Monad
import System.IO

main :: IO ()
main = do
    _ <- getLine
    line <- getLine
    let numbers = reverse $ words line
    putStrLn $ unwords numbers

calc_diag_1 :: Int -> [[Int]] -> Int
calc_diag_1 idx nbs
    | idx' == 0 = val
    | otherwise = val + calc_diag_1 idx' nbs
    where
        idx' = idx-1
        val = (nbs!!idx') !! idx'

calc_diag_2 :: Int -> [[Int]] -> Int
calc_diag_2 size nbs = calc_diag_2' (size-1) 0 nbs
    where
        calc_diag_2' :: Int -> Int -> [[Int]] -> Int
        calc_diag_2' idx_x idx_y nbs
            | idx_x == 0 = val
            | otherwise = val + calc_diag_2' idx_x' idx_y' nbs
            where
                idx_x' = idx_x - 1
                idx_y' = idx_y + 1
                val = (nbs !! idx_y) !! idx_x

calc :: Int -> [[Int]] -> Int
calc size nbs = abs $ diag_1 - diag_2
    where
        diag_1 = calc_diag_1 size nbs
        diag_2 = calc_diag_2 size nbs

my_sort :: (Int, Int, Int) -> Int -> (Int, Int, Int)
my_sort (a,b,c) nb
    | nb > 0 = (a+1,b,c)
    | nb < 0 = (a,b+1,c)
    | nb == 0 = (a,b,c+1)

calc_frac :: (Int, Int, Int) -> Int -> (Float, Float, Float)
calc_frac (a,b,c) nb = (a'/nb', b'/nb', c'/nb')
    where
        a' = fromIntegral a
        b' = fromIntegral b
        c' = fromIntegral c
        nb' = fromIntegral nb

gen_line :: Int -> Int -> String
gen_line size line = replicate (size-line) ' ' ++ replicate line '#'

last_2 :: String -> String
last_2 = reverse . take 2 . reverse

drop_last_2 :: String -> String
drop_last_2 = reverse . drop 2 . reverse


rotate :: Int -> [Int] -> [Int]
rotate nb nbs = reverse $ take size $ drop nb $ cycle $ reverse nbs
    where
        size = length nbs

gen_path_kangaroo :: Int -> Int -> [Int]
gen_path_kangaroo x v = x : gen_path_kangaroo (x+v) v

is_possible :: (Int, Int) -> (Int, Int) -> Bool
is_possible (x1, v1) (x2, v2) = undefined

bla x1 v1 x2 v2 = take 10 $ zip (gen_path_kangaroo x1 v1) (gen_path_kangaroo x2 v2)
