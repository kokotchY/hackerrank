import Control.Monad
import Data.List
import qualified Data.Map.Lazy as Map

type Pos = (Int,Int)
type Grid = Map.Map Pos Char

convert :: [String] -> Grid
convert l = foldl' (\m (pos,c) -> Map.insert pos c m) Map.empty l'
    where
        l' = concatMap (\(y, l2) -> map (\(x,c) -> ((x,y), c)) $ zip [0..] l2) $ zip [0..] l

checked_positions :: Int -> [(Int, Int)]
checked_positions n = [(x,y) | x <- [1..(n-2)], y <- [1..(n-2)]]

sides :: (Int, Int) -> [(Int, Int)]
sides (x,y) = [(x-1,y), (x+1,y), (x,y-1), (x,y+1)]

is_cavity :: Grid -> (Int, Int) -> Bool
is_cavity grid pos = all ((>) v) adjacents
    where
        v = my_lookup grid pos
        adjacents = map (my_lookup grid) $ sides pos

my_lookup :: Grid -> Pos -> Char
my_lookup grid k = case Map.lookup k grid of
    Just v -> v
    Nothing -> error $ "Impossible: " ++ show k

update_cavities :: Grid -> [Pos] -> Grid
update_cavities = foldl' (\g p -> Map.insert p 'X' g)

display_grid :: Grid -> Int -> IO ()
display_grid grid n = mapM_ (display_line grid n) [0..n-1]

display_line :: Grid -> Int -> Int -> IO ()
display_line grid n y = putStrLn $ map (my_lookup grid) [(x,y) | x <- [0..n-1]]

main :: IO ()
main = do
    n <- readLn
    l <- replicateM n getLine
    let grid = convert l
        cavities = filter (is_cavity grid) $ checked_positions n
        grid' = update_cavities grid cavities

    display_grid grid' n

    return ()
