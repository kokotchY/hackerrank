import Control.Monad
import Data.List
import qualified Data.Map.Strict as Map

type Pos = (Int, Int)
data Cell = Plus | Unknown | Letter Char
    deriving Show
data Direction = Horiz | Vert
    deriving Show
data WordPos = WordPos
    { getStart :: Pos
    , getLength :: Int
    , getDirection :: Direction
    , getPositions :: [Pos]
    }
    deriving Show
type Grid = Map.Map Pos Cell

data Result = Result
    { getGrid :: Grid
    , getWords :: [String]
    , solved :: Bool
    }

is_unknown :: Cell -> Bool
is_unknown Unknown = True
is_unknown _ = False

try_solve :: Result -> Result
try_solve res
    | length words == 0 = res { solved = True }
    | otherwise = undefined
    where
        words = getWords res
        (w:ws) = words

my_split :: String -> [String]
my_split = my_split' []
    where
        my_split' :: String -> String -> [String]
        my_split' [] [] = []
        my_split' w [] = [w]
        my_split' w (x:xs)
            | x == ';' = w:my_split' [] xs
            | otherwise = my_split' (w ++ [x]) xs

test_grid :: Grid
test_grid = convert_grid [((0,0),'+'),((1,0),'-'),((2,0),'+'),((3,0),'+'),((4,0),'+'),((5,0),'+'),((6,0),'+'),((7,0),'+'),((8,0),'+'),((9,0),'+'),((0,1),'+'),((1,1),'-'),((2,1),'+'),((3,1),'+'),((4,1),'+'),((5,1),'+'),((6,1),'+'),((7,1),'+'),((8,1),'+'),((9,1),'+'),((0,2),'+'),((1,2),'-'),((2,2),'+'),((3,2),'+'),((4,2),'+'),((5,2),'+'),((6,2),'+'),((7,2),'+'),((8,2),'+'),((9,2),'+'),((0,3),'+'),((1,3),'-'),((2,3),'-'),((3,3),'-'),((4,3),'-'),((5,3),'-'),((6,3),'+'),((7,3),'+'),((8,3),'+'),((9,3),'+'),((0,4),'+'),((1,4),'-'),((2,4),'+'),((3,4),'+'),((4,4),'+'),((5,4),'-'),((6,4),'+'),((7,4),'+'),((8,4),'+'),((9,4),'+'),((0,5),'+'),((1,5),'-'),((2,5),'+'),((3,5),'+'),((4,5),'+'),((5,5),'-'),((6,5),'+'),((7,5),'+'),((8,5),'+'),((9,5),'+'),((0,6),'+'),((1,6),'+'),((2,6),'+'),((3,6),'+'),((4,6),'+'),((5,6),'-'),((6,6),'+'),((7,6),'+'),((8,6),'+'),((9,6),'+'),((0,7),'+'),((1,7),'+'),((2,7),'-'),((3,7),'-'),((4,7),'-'),((5,7),'-'),((6,7),'-'),((7,7),'-'),((8,7),'+'),((9,7),'+'),((0,8),'+'),((1,8),'+'),((2,8),'+'),((3,8),'+'),((4,8),'+'),((5,8),'-'),((6,8),'+'),((7,8),'+'),((8,8),'+'),((9,8),'+'),((0,9),'+'),((1,9),'+'),((2,9),'+'),((3,9),'+'),((4,9),'+'),((5,9),'-'),((6,9),'+'),((7,9),'+'),((8,9),'+'),((9,9),'+')]

read_grid :: IO [((Int,Int),Char)]
read_grid = liftM concat $ forM [0..9] $ \y -> do
    str <- getLine
    let line = zip [0..] str
        line' = map (\(x,c) -> ((x,y),c)) line
    return line'

convert_grid :: [((Int,Int),Char)] -> Grid
convert_grid = foldl (\g (p,c) -> Map.insert p (parse_char c) g) Map.empty

parse_char :: Char -> Cell
parse_char '+' = Plus
parse_char '-' = Unknown

display_grid :: Grid -> IO ()
display_grid grid = forM_ [0..9] $ \y ->
    display_line grid y

display_line :: Grid -> Int -> IO ()
display_line grid y = putStrLn $ map (display_cell . my_lookup grid) [(x,y) | x <- [0..9]]

display_cell :: Cell -> Char
display_cell Plus = '+'
display_cell Unknown = '-'
display_cell (Letter c) = c

get_post_words :: Grid -> [Pos]
get_post_words grid = 

get_pos_unknown :: Grid -> [Pos]
get_pos_unknown grid = filter (is_unknown . my_lookup grid) [(x,y) | y <- [0..9], x <- [0..9]]

find_words :: Grid -> [Pos] -> [WordPos]
find_words grid [] = []
find_words grid (x:xs) = words ++ find_words grid xs'
    where
        xs' = filter (\p -> not (p `elem` wordsPos)) xs
        wordsPos = concatMap getPositions words
        words = find_word grid x

find_word :: Grid -> Pos -> [WordPos]
find_word grid pos = res
    where
        vertical = takeWhile (\p -> is_unknown (my_lookup grid p)) $ iterate (\(a,b) -> (a, b+1)) pos
        horizontal = takeWhile (\p -> is_unknown (my_lookup grid p)) $ iterate (\(a,b) -> (a+1, b)) pos
        vertical' = if length vertical > 1
            then [WordPos (head vertical) (length vertical) Vert vertical]
            else []
        horizontal' = if length horizontal > 1
            then [WordPos (head horizontal) (length horizontal) Horiz horizontal]
            else []
        res = vertical' ++ horizontal'

can_place :: String -> WordPos -> Grid -> Bool
can_place w p g
    | length w == getLength p = all (uncurry can_place_char) $ zip w (get_word_in_grid p g)
    | otherwise = False

can_place_char :: Char -> Cell -> Bool
can_place_char c Plus = False
can_place_char c Unknown = True
can_place_char c (Letter l) = c == l

get_word_in_grid :: WordPos -> Grid -> [Cell]
get_word_in_grid word grid = map (my_lookup grid) (getPositions word)


my_lookup :: Grid -> Pos -> Cell
my_lookup grid k = case Map.lookup k grid of
    Just c -> c
    Nothing -> Unknown

create_result :: [((Int,Int),Char)] -> [String] -> Result
create_result grid words = Result (convert_grid grid) words False

main :: IO ()
main = do
    grid <- read_grid
    words <- liftM my_split getLine

    let res = try_solve (create_result grid words)
    if solved res
        then display_grid (getGrid res)
        else putStrLn "Grid impossible"
