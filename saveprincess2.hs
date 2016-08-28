import Control.Monad

next_move :: (Int,Int) -> (Int,Int) -> String
next_move (mx,my) (px,py)
    | mx == px && my < py = "DOWN"
    | mx == px && my > py = "UP"
    | my == py && mx < px = "RIGHT"
    | my == py && mx > px = "LEFT"
    | my == py && mx == px = ""
    | otherwise =
        if my < py
            then "DOWN"
            else "UP"

my_lookup :: Eq a => a -> [(a,b)] -> b
my_lookup k list =
    case lookup k list of
        Just v -> v
        Nothing -> error "Impossible"

display :: (Int, Int) -> IO ()
display p = putStrLn $ "From " ++ show p ++ ", move " ++ next_move (1,1) p

main :: IO ()
main = do
    n <- readLn
    [my,mx] <- liftM (map read . words) getLine

    grid <- forM [0..n-1] $ \y -> do
        line <- liftM (zip [0..]) getLine
        return $ map (\(x,c) -> (c,(x,y))) line

    let grid' = concat grid
        p = my_lookup 'p' grid'
        m = (mx,my)

    putStrLn $ next_move m p

