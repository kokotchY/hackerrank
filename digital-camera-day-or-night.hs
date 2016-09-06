
is_day :: [(Int,Int,Int)] -> Bool
is_day pixels = (nb_brights / nb) >= 0.45
    where
        brights = filter (>= 255) $ map adds pixels
        nb_brights = fromIntegral $ length brights
        nb = fromIntegral $ length pixels

adds :: (Int,Int,Int) -> Int
adds (a,b,c) = a+b+c

splitOn :: Char -> String -> [String]
splitOn = splitOn' []
    where
        splitOn' :: String -> Char -> String -> [String]
        splitOn' [] _ [] = []
        splitOn' w _ [] = [w]
        splitOn' w c (x:xs)
            | c == x = w : splitOn' [] c xs
            | otherwise = splitOn' (w ++ [x]) c xs


main :: IO ()
main = do
    content <- getContents
    let pixels = map ((\[r,g,b] -> (read r, read g, read b)) . splitOn ',') $ concatMap (splitOn ' ') $ lines content :: [(Int, Int, Int)]
    if is_day pixels
        then putStrLn "day"
        else putStrLn "night"
    return ()
