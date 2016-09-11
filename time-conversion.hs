convert :: String -> String
convert time
    | format == "AM" && hour == "12" = display ("00", minutes, seconds)
    | format == "AM" && hour < "12" = display (hour, minutes, seconds)
    | format == "PM" && hour == "12" = display ("12", minutes, seconds)
    | format == "PM" && hour < "12" = display (hour', minutes, seconds)
    where
        hour = take 2 time
        hour' = show $ (read hour) + 12
        minutes = take 2 $ drop 3 time
        seconds = take 2 $ drop 6 time
        format = take 2 $ drop 8 time

display :: (String, String, String) -> String
display (h,m,s) = h ++ ":" ++ m ++ ":" ++ s

main :: IO ()
main = do
    time <- getLine
    let time' = convert time
    putStrLn time'
