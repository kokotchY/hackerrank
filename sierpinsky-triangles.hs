import Control.Monad

spier :: [String]
spier = map spier_line [0..31]

spier_line :: Int -> String
spier_line n = side ++ elements ++ side
    where
        nb = 31 - n
        side = replicate nb '_'
        elements = replicate  (63 - nb*2) '1'
