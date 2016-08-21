module Main where


gcd' :: Integral a => a -> a -> a
gcd' n m
    | n < m = gcd' m n
    | n == m = n
    | n > m && r == 0 = m
    | n > m && r /= 0 = gcd' m r
    where
        (q,r) = n `divMod` m


-- This part is related to the Input/Output and can be used as it is
-- Do not modify it
main = do
  input <- getLine
  print . uncurry gcd' . listToTuple . convertToInt . words $ input
 where
  listToTuple (x:xs:_) = (x,xs)
  convertToInt = map (read :: String -> Int)
