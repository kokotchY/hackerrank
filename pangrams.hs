import Control.Monad
import Data.Char

is_pangram :: String -> Bool
is_pangram str = is_letters_in ['a'..'z'] str


is_letters_in :: [Char] -> String -> Bool
is_letters_in [] _ = True
is_letters_in (c:cs) str = c `elem` str && is_letters_in cs str

main :: IO ()
main = do
    line <- getLine
    let sentence = filter (/= ' ') $ map toLower line

    if is_pangram sentence
        then putStrLn "pangram"
        else putStrLn "not pangram"
