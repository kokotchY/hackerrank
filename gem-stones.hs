import Control.Monad
import Data.List

main :: IO ()
main = do
    n <- liftM read getLine
    elements <- replicateM n (liftM nub getLine)

    print $ length $ foldl1 intersect elements

