import Data.Char
import qualified Data.Map.Strict as Map
import Data.List

type Trigram = (String, String, String)
type Dico = Map.Map Trigram Integer

sanitize :: String -> [String]
sanitize = words . sanitize' '\n' ' '
    where
        sanitize' :: Char -> Char -> String -> String
        sanitize' _ _ [] = []
        sanitize' c1 c2 (x:xs)
            | c1 == x = c2:sanitize' c1 c2 xs
            | otherwise = x':sanitize' c1 c2 xs
            where
                x' = toLower x

create_trigram :: [String] -> [Trigram]
create_trigram s = sort $ zip3 s (drop 1 s) (drop 2 s)

get_max_occ_trigram :: [Trigram] -> Integer
get_max_occ_trigram (t:ts) = get_max_occ_trigram' 1 1 t ts
    where
        get_max_occ_trigram' :: Integer -> Integer -> Trigram -> [Trigram] -> Integer
        get_max_occ_trigram' max_occ current _ [] = max max_occ current
        get_max_occ_trigram' max current trigram (t:ts)
            | t == trigram = get_max_occ_trigram' max (current+1) trigram ts
            | t /= trigram && current > max = get_max_occ_trigram' current 1 t ts
            | t /= trigram && current <= max = get_max_occ_trigram' max 1 t ts

main :: IO ()
main = do
    content <- getContents
    print $ sanitize content
