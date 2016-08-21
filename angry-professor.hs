import Control.Monad
import System.IO

main :: IO ()
main = do
    t <- liftM read getLine
    tests <- replicateM t $ do
        [n, k] <- liftM (map read . words) getLine :: IO [Int]
        time <- liftM (map read . words) getLine :: IO [Int]
        let arrival = filter (<= 0) time
        return $ if length arrival >= k
            then "NO"
            else "YES"

    mapM_ putStrLn tests

