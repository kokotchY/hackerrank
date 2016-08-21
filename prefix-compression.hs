find_longest_prefix :: String -> String -> (String, String, String)
find_longest_prefix x y = find_longest_prefix' ([], x ,y)
    where
        find_longest_prefix' :: (String, String, String) -> (String, String, String)
        find_longest_prefix' (res, [], []) = (reverse res, [], [])
        find_longest_prefix' (res, (x:xs), []) = (reverse res, (x:xs), [])
        find_longest_prefix' (res, [], (y:ys)) = (reverse res, [], (y:ys))
        find_longest_prefix' (res, (x:xs), (y:ys))
            | x == y = find_longest_prefix' (x:res, xs, ys)
            | otherwise = (reverse res, (x:xs), (y:ys))

display_result :: (String, String, String) -> IO ()
display_result (res, x, y) = do
    putStrLn $ get_val res
    putStrLn $ get_val x
    putStrLn $ get_val y

get_val :: String -> String
get_val [] = "0"
get_val l = show (length l) ++ " " ++ l

main :: IO ()
main = do
    x <- getLine
    y <- getLine

    display_result $ find_longest_prefix x y 
