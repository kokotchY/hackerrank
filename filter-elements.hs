import Control.Monad
import Data.List

solve :: Integer -> [Integer] -> [Integer]
solve k list = case res of
    [] -> [-1]
    l -> l
    where
        res = map fst . filter ((>= k) . snd) $ calc_freq list

calc_freq :: [Integer] -> [(Integer,Integer)]
calc_freq = reverse . foldl' inc_occ []

inc_occ :: [(Integer, Integer)] -> Integer -> [(Integer, Integer)]
inc_occ occ k = case lookup k occ of
    Just v -> update_key (k,v+1) occ
    Nothing -> (k,1):occ

update_key :: (Integer,Integer) -> [(Integer, Integer)] -> [(Integer, Integer)]
update_key _ [] = []
update_key (k,v) (x@(xk,xv):xs)
    | k == xk = (k,v):update_key (k,v) xs
    | otherwise = x:update_key (k,v) xs


main :: IO ()
main = do
    t <- readLn
    tests <- replicateM t $ do
        [n,k] <- liftM (map read . words) getLine :: IO [Integer]
        nbs <- liftM (map read . words) getLine :: IO [Integer]
        return (k, nbs)

    let res = map (uncurry solve) tests
    mapM_ (putStrLn . unwords . map show) res

    return ()
