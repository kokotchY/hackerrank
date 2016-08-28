module Main where

import Control.Monad
import Data.List
import System.Directory

data State = State
    { direction :: String
    , mode :: String
    }
    deriving Show

type Pos = (Int,Int)
type Grid = [(Char,Pos)]

my_lookup :: Char -> Grid -> [Pos]
my_lookup k [] = []
my_lookup k ((c, p):l)
    | k == c = p:my_lookup k l
    | otherwise = my_lookup k l

my_lookup' :: Eq a => a -> [(a,b)] -> [b]
my_lookup' k = map snd . filter ((==k) . fst)

get_closest_dirt :: Pos -> Grid -> Maybe Pos
get_closest_dirt pos grid = case dirts of
    [] -> Nothing
    _ -> Just $ minimumBy (closest pos) dirts
    where
        dirts = my_lookup 'd' grid
        closest :: Pos -> Pos -> Pos -> Ordering
        closest pos a b = compare (nb_move pos a) (nb_move pos b)

nb_move :: Pos -> Pos -> Int
nb_move (x1, y1) (x2, y2) = dx + dy
    where
        dx = abs $ x1 - x2
        dy = abs $ y1 - y2

next_action :: State -> Pos -> Grid -> State
next_action state pos grid
    | isJust closest_dirt && fromJust closest_dirt == pos = state { direction = "CLEAN" }
    | isJust closest_dirt = state { direction = move_toward pos (fromJust closest_dirt) }
    | otherwise = wander state pos
    where
        closest_dirt = get_closest_dirt pos grid

wander :: State -> Pos -> State
wander state pos = state { direction = direction }

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

fromJust :: Maybe a -> a
fromJust (Just a) = a
fromJust Nothing = error "Impossible"

move_toward :: Pos -> Pos -> String
move_toward (x1,y1) (x2,y2)
    | x1 == x2 && y1 < y2 = "DOWN"
    | x1 == x2 && y1 > y2 = "UP"
    | y1 == y2 && x1 < x2 = "RIGHT"
    | y1 == y2 && x1 > x2 = "LEFT"
    | x1 == x2 && y1 == y2 = ""
    | otherwise =
        if y1 < y2
            then "DOWN"
            else "UP"

getState :: IO State
getState = do
    stateExists <- doesFileExist stateFilename
    if stateExists
        then liftM (State "" . filter ((/=)'\n')) (readFile stateFilename)
        else return $ State "" ""

stateFilename :: String
stateFilename = "currentstate"

reset :: IO ()
reset = removeFile stateFilename

setState :: State -> IO ()
setState state = writeFile stateFilename $ mode state

main :: IO ()
main = do
    [by,bx] <- liftM (map read . words) getLine :: IO [Int]
    grid <- forM [0..4] $ \y -> do
        line <- liftM (zip [0..]) getLine
        return $ map (\(x,c) -> (c, (x,y))) line
    state <- getState

    let grid' = concat grid
        robot = (bx,by)
        state' = next_action state robot grid'

    setState state'

    putStrLn $ direction state'
