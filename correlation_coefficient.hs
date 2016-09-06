
avg :: [Int] -> Float
avg list = (fromIntegral $ sum list) / fromIntegral (length list)

avg' :: Fractional a => [a] -> a
avg' list = (sum list) / (fromIntegral (length list))

p_scores, h_scores :: [Int]
p_scores = [15,12,8,8,7,7,7,6,5,3]
h_scores = [10,25,17,11,13,17,20,13,9,15]

calc :: [Int] -> [Int] -> Float
calc list1 list2 = top / bottom
    where
        top = sum $ map (\(x,y) -> (x-avg_list1)*(y-avg_list2)) $ zip list1' list2'
        avg_list1 = avg list1
        avg_list2 = avg list2
        list1' = map fromIntegral list1
        list2' = map fromIntegral list2
        bottom = (calc2 list1' avg_list1)*(calc2 list2' avg_list2)

calc2 :: Floating a => [a] -> a -> a
calc2 list avg = sqrt $ sum $ map (\x -> (x - avg)^2) list
