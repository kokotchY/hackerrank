import Control.Monad

try_reduce :: String -> String
try_reduce [] = []
try_reduce (x:[]) = [x]
try_reduce (x:y:xs)
    | x == y = xs
    | otherwise = x : try_reduce (y:xs)

reduce :: String -> String
reduce str
    | str' == str = str
    | otherwise = reduce str'
    where
        str' = try_reduce str

main :: IO ()
main = do
    line <- getLine

    putStrLn $ case reduce line of
        "" -> "Empty String"
        res -> res

