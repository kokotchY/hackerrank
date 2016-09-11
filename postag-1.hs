import Data.List.Split

convert :: [String] -> (String, String)
convert (x:y:[]) = (x,y)

s :: String
s = "The/DT planet/NN Jupiter/NNP and/CC its/PPS moons/NNS are/VBP in/IN effect/NN a/DT minisolar/JJ system/?? ,/, and/CC Jupiter/NNP itself/PRP is/VBZ often/RB called/VBN a/DT star/?? that/IN never/RB caught/??? fire/NN ./."

doLookup :: (String, String) -> String
doLookup (word, key) = case lookup key pos of
    Just v -> v
    Nothing -> key

pos :: [(String, String)]
pos = [("CC","Coordinating conjunction"),
    ("CD","Cardinal number"),
    ("DT","Determiner"),
    ("EX","Existential there"),
    ("FW","Foreign word"),
    ("IN","Preposition or subordinating conjunction"),
    ("JJ","Adjective"),
    ("JJR","Adjective, comparative"),
    ("JJS","Adjective, superlative"),
    ("LS","List item marker"),
    ("MD","Modal"),
    ("NN","Noun, singular or mass"),
    ("NNS","Noun, plural"),
    ("NNP","Proper noun, singular"),
    ("NNPS","Proper noun, plural"),
    ("PDT","Predeterminer"),
    ("POS","Possessive ending"),
    ("PRP","Personal pronoun"),
    ("PRP$","Possessive pronoun"),
    ("RB","Adverb"),
    ("RBR","Adverb, comparative"),
    ("RBS","Adverb, superlative"),
    ("RP"," Particle"),
    ("SYM","Symbol"),
    ("TO","to"),
    ("UH","Interjection"),
    ("VB","Verb, base form"),
    ("VBD","Verb, past tense"),
    ("VBG","Verb, gerund or present participle"),
    ("VBN","Verb, past participle"),
    ("VBP","Verb, non-3rd person singular present"),
    ("VBZ","Verb, 3rd person singular present"),
    ("WDT","Wh-determiner"),
    ("WP","Wh-pronoun"),
    ("WP$","Possessive wh-pronoun"),
    ("WRB","Wh-adverb ")]
