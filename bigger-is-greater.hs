import Control.Monad
import Data.List

nextPermutation :: String -> Maybe String
nextPermutation w
    | suffixLen == len = Nothing
    | otherwise = Just $ prefixMinusPivot ++ (newPivot : newSuffix)
    where
        len = length w
        revSuffix = findSuffix w'
        pivot = head $ drop len w'
        suffixLen = length revSuffix
        prefixMinusPivot = take (len - suffixLen - 1) w
        suffixHead = takeWhile (<= pivot) revSuffix
        newPivot : suffixTail = drop (length suffixHead) revSuffix
        newSuffix = suffixHead ++ (pivot : suffixTail)
        w' = reverse w

findSuffix :: String -> String
findSuffix [] = []
findSuffix (x:xs)
    | xs /= [] && x <= head xs = x:findSuffix xs
    | otherwise = x:[]

getNextPermutation :: String -> String
getNextPermutation w = case nextPermutation w of
    Just w' -> w'
    Nothing -> "no answer"

main :: IO ()
main = do
    t <- readLn
    list <- replicateM t getLine

    mapM_ (putStrLn . getNextPermutation) list
