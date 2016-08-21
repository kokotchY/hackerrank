reduce :: String -> String
reduce = reduce' []
    where
        reduce' :: String -> String -> String
        reduce' _ [] = []
        reduce' letters (x:xs)
            | x `elem` letters = reduce' letters xs
            | otherwise = x:reduce' (x:letters) xs

main :: IO ()
main = do
    str <- getLine
    putStrLn $ reduce str
