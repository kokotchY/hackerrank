import Control.Monad


cut_line :: [Int] -> [Int]
cut_line nbs = cut_sticks
    where
        min_size = minimum nbs
        nbs' = map (\x -> x - min_size) nbs
        cut_sticks = filter (> 0) nbs'

repeat_cut_line :: [Int] -> [[Int]]
repeat_cut_line [] = []
repeat_cut_line nb = nb : repeat_cut_line nb'
    where
        nb' = cut_line nb

main :: IO ()
main = do
    _ <- getLine
    nbs <- liftM (map read . words) getLine :: IO [Int]
    mapM_ (print . length) $ repeat_cut_line nbs
