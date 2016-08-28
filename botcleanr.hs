import Control.Monad

type Pos = (Int,Int)
type Grid = [(Char,Pos)]


my_lookup :: Char -> Grid -> Pos
my_lookup k grid = case lookup k grid of
    Just pos -> pos
    Nothing -> error "Impossible"

next_action :: Pos -> Grid -> String
next_action pos grid
    | pos == dirt_position = "CLEAN"
    | otherwise = move_toward pos dirt_position
    where
        dirt_position = my_lookup 'd' grid

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
        return $ map (\(x,c) -> (c,(x,y))) line

    let grid' = concat grid
        bot = (bx,by)
    putStrLn $ next_action bot grid'
