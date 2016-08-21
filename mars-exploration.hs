import Control.Monad

main :: IO ()
main = do
    str <- getLine
    let different_letters = filter (\(a,b) -> a /= b) $ zip (cycle "SOS") str
    print $ length different_letters
