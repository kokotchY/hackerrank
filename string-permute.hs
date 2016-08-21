permute :: String -> String
permute [] = []
permute (x:y:xs) = y:x:permute xs

permute' :: String -> String
permute' l = reverse $ permute'' l []
    where
        permute'' :: String -> String -> String
        permute'' [] res = res
        permute'' (x:y:xs) res = permute'' xs (x:y:res)

main :: IO ()
main = do
    t <- readLn :: IO Int
    tests <- replicateM t $ do
        str <- getLine
        return $ permute' str

    mapM_ putStrLn tests
