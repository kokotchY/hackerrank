import Control.Monad
import Data.Char

nb_words :: String -> Int
nb_words str = 1 + length (filter isUpper str)

main :: IO ()
main = liftM nb_words getLine >>= print
