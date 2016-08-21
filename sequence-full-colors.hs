import Control.Monad

is_full_colors :: String -> Bool
is_full_colors str = r == g && y == b
    where
        occs = get_occ str
        r = lookup' 'R' occs
        g = lookup' 'G' occs
        y = lookup' 'Y' occs
        b = lookup' 'B' occs

occ :: Eq a => a -> [a] -> Int
occ a = length . filter (==a)

get_occ :: String -> [(Char, Int)]
get_occ str = map (\c -> (c, occ c str)) "RGYB"

lookup' :: Eq a => a -> [(a,b)] -> b
lookup' k l = fromJust $ lookup k l

fromJust :: Maybe a -> a
fromJust (Just a) = a

main :: IO ()
main = do
    t <- readLn :: IO Int
    tests <- replicateM t getLine

    mapM_ (putStrLn . show . is_full_colors) tests
