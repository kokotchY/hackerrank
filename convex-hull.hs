import Control.Monad
import Data.List

type Point = (Int,Int)
type Points = [Point]

convex_hull :: Points -> Points
convex_hull p = if length p <= 1
    then p
    else l' ++ u'
    where
        u = get_hull_part p []
        l = get_hull_part (reverse p) []
        l' = init l
        u' = init u

calc_distance :: Point -> Point -> Float
calc_distance (x1, y1) (x2, y2) = sqrt $ fromIntegral $ (x2 - x1)^2 + (y2 - y1)^2

calc_perimeter :: Points -> Float
calc_perimeter [] = 0
calc_perimeter (x:[]) = 0
calc_perimeter (x:y:xs) = calc_distance x y + calc_perimeter (y:xs)

get_hull_part :: Points -> Points -> Points
get_hull_part [] r = r
get_hull_part (x:xs) r = get_hull_part xs r'
    where
        r' = remove_some_point x r

cross :: Point -> Point -> Point -> Int
cross (o_x, o_y) (a_x, a_y) (b_x, b_y) = cross
    where
        cross = (a_x - o_x) * (b_y - o_y) - (a_y - o_y) * (b_x - o_x)

remove_some_point :: Point -> Points -> Points
remove_some_point p r
    | length r >= 2 && (cross a b p <= 0) = remove_some_point p (drop 1 r)
    | otherwise = p : r
    where
        [b,a] = take 2 r

read_points :: Int -> IO Points
read_points n = replicateM n $ do
    line <- getLine
    let [a,b] = map read $ words line
    return (a,b)

main :: IO ()
main = do
    n <- readLn :: IO Int
    list <- read_points n

    let list' = convex_hull $ sort $ nub list
        list'' = list' ++ [head list']

    print $ calc_perimeter list''

    return ()
