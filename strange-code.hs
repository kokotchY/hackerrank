import Control.Monad

gen_counter :: Int -> [(Int, Int)]
gen_counter init = zip [((init-3)+1)..] (map (\x -> init - x) [0..init - 1]) ++ gen_counter (init * 2)

gen_cycle :: Int -> [(Int, Int)]
gen_cycle init = zip [(init-2)..] (map (\x -> init - x) [0..(init-1)])

gen_cycle_init :: Integer -> [Integer]
gen_cycle_init n = n:gen_cycle_init (n*2)

get_cycle_init :: Integer -> Integer
get_cycle_init nb = head $ dropWhile (\x -> (x*2 - 3 ) < nb) $ gen_cycle_init 3

get_value_from_cycle :: Integer -> Integer -> Integer
get_value_from_cycle cycle time = cycle - (time - (cycle - 2))

get_value :: Integer -> Integer
get_value nb = get_value_from_cycle cycle nb
    where
        cycle = get_cycle_init nb

main :: IO ()
main = do
    t <- liftM read getLine
    print $ get_value t
