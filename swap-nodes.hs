import Control.Monad

data Tree = Empty | Node Int Tree Tree | Unknown Int
    deriving Show

swap :: Tree -> Tree
swap (Node v l r) = Node v r l
swap Empty = Empty

create_empty :: Int -> Tree
create_empty (-1) = Empty
create_empty v = Unknown v

swap_tree :: Tree -> Int -> Tree
swap_tree = swap_tree' 1
    where
        swap_tree' :: Int -> Tree -> Int -> Tree
        swap_tree' _ Empty _ = Empty
        swap_tree' d (Node v l r) k
            | d `mod` k == 0 = Node v r' l'
            | otherwise = Node v l' r'
            where
                l' = swap_tree' (d+1) l k
                r' = swap_tree' (d+1) r k

insert_node :: Tree -> Int -> Int -> Int -> Tree
insert_node t i_v i_l i_r =
    case t of
        Unknown v -> if v == i_v
            then Node v (create_empty i_l) (create_empty i_r)
            else Unknown v
        Empty -> Empty
        Node v l r ->
            let l' = insert_node l i_v i_l i_r
                r' = insert_node r i_v i_l i_r
            in Node v l' r'

get_tree :: Tree -> [Int]
get_tree (Node v l r) = get_tree l ++ [v] ++ get_tree r
get_tree Empty = []

apply_swap :: Tree -> [Int] -> [Tree]
apply_swap t [] = [t]
apply_swap t (x:xs) = t':apply_swap t' xs
    where
        t' = swap_tree t x

main :: IO ()
main = do
    n <- readLn :: IO Int
    node_list <- replicateM n $ do
        line <- getLine
        let [a,b] = map read $ words line
        return (a,b)
    let empty_tree = Unknown 1
        tree = foldl (\t (v, (a,b)) -> insert_node t v a b) empty_tree $ zip [1..] node_list

    t <- readLn :: IO Int
    tests <- replicateM t (liftM read getLine) :: IO [Int]

    mapM_ (putStrLn . unwords . map show . get_tree) $ init $ apply_swap tree tests

    return ()
