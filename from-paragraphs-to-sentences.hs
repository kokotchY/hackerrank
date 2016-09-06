
data SomeWord = SomeWord
    {
        getWord :: String,
        inQuote :: Bool
    }
    deriving Show

splitByChars :: [Char] -> String -> [String]
splitByChars = splitByChars' defaultWord
    where
        splitByChars' :: SomeWord -> [Char] -> String -> [String]
        splitByChars' w _ [] = case length (getWord w) of
            0 -> []
            _ -> [reverse $ getWord w]
        splitByChars' w chars (x:xs)
            | x `elem` chars && not (inQuote w) = (reverse (x:getWord w)):splitByChars' defaultWord chars xs
            | x == '"' = splitByChars' (flipQuote $ addLetter w x) chars xs
            | otherwise = splitByChars' (addLetter w x) chars xs

flipQuote :: SomeWord -> SomeWord
flipQuote w = w { inQuote = inQuote' }
    where
        inQuote' = not $ inQuote w

addLetter :: SomeWord -> Char -> SomeWord
addLetter w c = w { getWord = w' }
    where
        w' = c:getWord w

defaultWord :: SomeWord
defaultWord = SomeWord "" False

trimStartSpaces :: String -> String
trimStartSpaces = dropWhile (==' ')

main :: IO ()
main = do
    sentence <- getLine
    mapM_ (putStrLn . trimStartSpaces) $ splitByChars ".!?" sentence

test :: String
test = "In the third category he included those Brothers (the majority) who saw nothing in Freemasonry but the external forms and ceremonies, and prized the strict performance of these forms without troubling about their purport or significance. Such were Willarski and even the Grand Master of the principal lodge. Finally, to the fourth category also a great many Brothers belonged, particularly those who had lately joined. These according to Pierre's observations were men who had no belief in anything, nor desire for anything, but joined the Freemasons merely to associate with the wealthy young Brothers who were influential through their connections or rank, and of whom there were very many in the lodge.Pierre began to feel dissatisfied with what he was doing. Freemasonry, at any rate as he saw it here, sometimes seemed to him based merely on externals. He did not think of doubting Freemasonry itself, but suspected that Russian Masonry had taken a wrong path and deviated from its original principles. And so toward the end of the year he went abroad to be initiated into the higher secrets of the order.What is to be done in these circumstances? To favor revolutions, overthrow everything, repel force by force?No! We are very far from that. Every violent reform deserves censure, for it quite fails to remedy evil while men remain what they are, and also because wisdom needs no violence. \"But what is there in running across it like that?\" said Ilagin's groom. \"Once she had missed it and turned it away, any mongrel could take it,\" Ilagin was saying at the same time, breathless from his gallop and his excitement."
