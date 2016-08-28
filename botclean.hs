module Main where

import Control.Monad
import Data.List

type Pos = (Int,Int)
type Grid = [(Char,Pos)]

my_lookup :: Char -> Grid -> [Pos]
my_lookup k [] = []
my_lookup k ((c, p):l)
    | k == c = p:my_lookup k l
    | otherwise = my_lookup k l

my_lookup' :: Eq a => a -> [(a,b)] -> [b]
my_lookup' k = map snd . filter ((==k) . fst)

get_closest_dirt :: Pos -> Grid -> Pos
get_closest_dirt pos grid = minimumBy (closest pos) dirts
    where
        dirts = my_lookup 'd' grid
        closest :: Pos -> Pos -> Pos -> Ordering
        closest pos a b = compare (nb_move pos a) (nb_move pos b)

nb_move :: Pos -> Pos -> Int
nb_move (x1, y1) (x2, y2) = dx + dy
    where
        dx = abs $ x1 - x2
        dy = abs $ y1 - y2

next_action :: Pos -> Grid -> String
next_action pos grid
    | closest_dirt == pos = "CLEAN"
    | otherwise = move_toward pos closest_dirt
    where
        closest_dirt = get_closest_dirt pos grid

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

main :: IO ()
main = do
    [by,bx] <- liftM (map read . words) getLine :: IO [Int]
    grid <- forM [0..4] $ \y -> do
        line <- liftM (zip [0..]) getLine
        return $ map (\(x,c) -> (c, (x,y))) line

    let grid' = concat grid
        robot = (bx,by)

    putStrLn $ next_action robot grid'
