import Control.Monad

get_moves :: (Int, Int) -> (Int, Int) -> [String]
get_moves (mx, my) (px, py) = filter (/=[]) $ horiz ++ vert
    where
        dx = abs $ mx - px
        dy = abs $ my - py
        horiz =
            case compare mx px of
                LT -> replicate dx "RIGHT"
                GT -> replicate dx "LEFT"
                EQ -> [""]
        vert =
            case compare my py of
                LT -> replicate dy "DOWN"
                GT -> replicate dy "UP"
                EQ -> [""]

my_lookup :: Eq a => a -> [(a,b)] -> b
my_lookup k list =
    case lookup k list of
        Just v -> v
        Nothing -> error "Impossible"

main :: IO ()
main = do
    n <- readLn
    grid <- forM [0..n-1] $ \y -> do
        line <- liftM (zip [0..]) getLine
        return $ map (\(x,c) -> (c,(x,y))) line
    let grid' = concat grid
        m = my_lookup 'm' grid'
        p = my_lookup 'p' grid'
    mapM_ putStrLn $ get_moves m p
