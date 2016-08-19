import Control.Monad
import qualified Data.Map.Strict as Map

type Pos = (Int, Int)
type Grid = Map.Map Pos Char

init_grid :: Grid
init_grid = foldl (\m p -> Map.insert p '_' m) Map.empty [(x,y) | x <- [0..99], y <- [0..62]]

display_grid :: Grid -> IO ()
display_grid grid = mapM_ (display_line grid) [0..62]

display_line :: Grid -> Int -> IO ()
display_line grid y = putStrLn $ map (my_lookup grid) [(x,y) | x <- [0..99]]

my_lookup :: Grid -> Pos -> Char
my_lookup grid k = case Map.lookup k grid of
    Just c -> c
    Nothing -> 'E'


draw_y :: (Pos, Int) -> Grid -> Grid
draw_y (start,size) grid = grid''
    where
        grid' = draw_vertical grid start size
        top_y = (fst start, snd start - size)
        grid'' = draw_slant grid' top_y size

draw_vertical :: Grid -> Pos -> Int -> Grid
draw_vertical grid (x,y) size = foldl (\g p -> Map.insert p '1' g) grid [(x, y') | y' <- [y-size..y]]

draw_slant :: Grid -> Pos -> Int -> Grid
draw_slant grid pos size = grid''
    where
        grid' = draw_slant_left grid pos size
        grid'' = draw_slant_right grid' pos size

draw_slant_left :: Grid -> Pos -> Int -> Grid
draw_slant_left grid (x,y) size = foldl (\g p -> Map.insert p '1' g) grid [(x-d,y-d) | d <- [1..size]]

draw_slant_right :: Grid -> Pos -> Int -> Grid
draw_slant_right grid (x,y) size = foldl (\g p -> Map.insert p '1' g) grid [(x+d,y-d) | d <- [1..size]]

{-display_grid $ draw_y (99 `div` 2 + 16, 63-32) 8 $ draw_y (33, 63-32) 8 $  draw_y (99 `div` 2, 63) 16 $ init_grid-}

init_tree :: (Pos, Int)
init_tree = ((49, 63), 16)

bla :: [(Pos, Int)] -> [(Pos, Int)]
bla = concatMap (\((x,y), size) -> [((x+size, y-(size*2)), size `div` 2), ((x-size, y-(size*2)), size `div` 2)])

generate :: Int -> Grid
generate n = foldl (\g p -> draw_y p g) init_grid pos
    where
        pos = concat $ take n $ iterate bla [init_tree]

main :: IO ()
main = do
    nb <- readLn
    display_grid $ generate nb
