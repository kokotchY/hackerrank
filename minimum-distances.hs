import Control.Monad
import Data.List

get_min :: [Int] -> Maybe Int
get_min list = get_min' [] 0 Nothing list
    where
        get_min' :: [(Int, Int)] -> Int -> Maybe Int -> [Int] -> Maybe Int
        get_min' _ _ current_min [] = current_min
        get_min' couples idx current_min (x:xs) =
            case lookup x couples of
                Just v -> if isJust current_min
                            then
                                if abs (idx-v) < current_min_value
                                    then get_min' couples (idx+1) (Just (idx-v)) xs
                                    else get_min' couples (idx+1) current_min xs
                            else get_min' couples (idx+1) (Just (idx-v)) xs
                Nothing -> get_min' ((x,idx):couples) (idx+1) current_min xs
            where
                current_min_value = fromJust current_min

fromJust :: Maybe a -> a
fromJust (Just a) = a

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

main :: IO ()
main = do
    n <- readLn :: IO Int
    list <- liftM (map read . words) getLine :: IO [Int]

    let calc_min = get_min list

    case calc_min of
        Just v -> print v
        Nothing -> putStrLn "-1"
