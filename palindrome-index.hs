import Control.Monad

is_palindrome :: String -> Bool
is_palindrome s = is_palindrome' s 0
    where
        is_palindrome' :: String -> Int -> Bool
        is_palindrome' s n

main :: IO ()
main = do
    t <- liftM read getLine
    tests <- replicateM t getLine
