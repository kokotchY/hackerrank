avg :: Fractional a => [a] -> a
avg list = sum list / (fromIntegral (length list))

calc :: [Float] -> [Float] -> Float
calc list1 list2 = top / bottom
    where
        top = sum $ map (\(x,y) -> (x-avg_list1)*(y-avg_list2)) $ zip list1 list2
        avg_list1 = avg list1
        avg_list2 = avg list2
        bottom = (calc2 list1 avg_list1)*(calc2 list2 avg_list2)

calc2 :: Floating a => [a] -> a -> a
calc2 list avg = sqrt $ sum $ map (\x -> (x - avg)^2) list

standard_deviation :: Floating a => [a] -> a
standard_deviation list = sqrt (variance list)

variance :: Floating a => [a] -> a
variance list = (sum (map (\x -> (x - average)^2) list)) / fromIntegral (length list)
    where
        average = avg list


test_x, test_y, test_z :: [Float]
test_x = [1.0, 2.0, 3.0, 4.0, 5.0]
test_y = [1.0, 2.0, 1.30, 3.75, 2.25]
test_z = [9,9,9,8,8,8,8,7,7,7,7,7,6,6,6,6,6,6,5,5]

p_scores, h_scores :: [Int]
p_scores = [15,12,8,8,7,7,7,6,5,3]
h_scores = [10,25,17,11,13,17,20,13,9,15]

calc_slope :: [Float] -> [Float] -> Float
calc_slope x y = r * sy / sx
    where
        r = calc x y
        sy = standard_deviation y
        sx = standard_deviation x

eval_history :: Float -> Float
eval_history x = b * x + a
    where
        b = calc_slope p_scores' h_scores'
        a = avg h_scores' - b*avg p_scores'
        h_scores' = map fromIntegral h_scores
        p_scores' = map fromIntegral p_scores
