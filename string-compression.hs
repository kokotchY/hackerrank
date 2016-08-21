compress :: String -> String
compress [] = []
compress l
    | length c > 1 = x : show (length c) ++ compress cs
    | otherwise = x : compress cs
    where
        x = head l
        (c, cs) = span (==x) l

main :: IO ()
main = do
    line <- getLine
    putStrLn $ compress line
