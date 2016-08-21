import Control.Monad

split_array :: [Int] -> [([Int], [Int])]
split_array arr = map ((\(a,b) -> (init a, b)) . flip splitAt arr) [1..length arr]

calc :: ([Int],[Int]) -> (Int,Int)
calc (a,b) = (sum a, sum b)

is_valid :: [Int] -> Bool
is_valid = any (\(a,b) -> a==b) . map calc . split_array

display :: Bool -> IO ()
display True = putStrLn "YES"
display False = putStrLn "NO"

main :: IO ()
main = do
    t <- liftM read getLine
    tests <- replicateM t (getLine >> liftM (map read . words) getLine) :: IO [[Int]]

    mapM_ (display . is_valid) tests
