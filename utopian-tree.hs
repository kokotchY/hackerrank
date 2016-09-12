import Control.Monad
import Data.List

gen_cycle :: Num a => [a -> a]
gen_cycle = cycle [(*)2, (+)1]

get_size :: Int -> Int
get_size n = foldl' (\h f -> f h) 1 $ take n gen_cycle

main :: IO ()
main = do
    t <- readLn
    tests <- replicateM t readLn

    mapM_ (print . get_size) tests
