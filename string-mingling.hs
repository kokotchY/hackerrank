{-# LANGUAGE BangPatterns #-}

merge :: String -> String -> String
merge a b = foldl (\res (a,b) -> res ++ [a] ++ [b]) [] $ zip a b

merge' :: String -> String -> String
merge' [] [] = []
merge' (a:as) (b:bs) = a:b:merge as bs

merge'' :: String -> String -> String
merge'' a b = reverse $ merge''' a b []
    where
        merge''' :: String -> String -> String -> String
        merge''' [] [] res = res
        merge''' (a:as) (b:bs) res = merge''' as bs (b:a:res)

main :: IO ()
main = do
    !p <- getLine
    !q <- getLine

    putStrLn $ merge'' p q
