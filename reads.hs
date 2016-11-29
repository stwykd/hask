-- Function reads parses and returns [(value, string_with_rest_of_input)]
data Point = Point Double Double deriving (Show, Read)

reads "Point 1 2" :: [(Point, String)]
--[(Point 1.0 2.0,"")]

reads "Point 1 2 and some extra stuff" :: [(Point, String)]
--[(Point 1.0 2.0," and some extra stuff")]

reads "(Point 1 2)" :: [(Point, String)] -- note parens OK
--[(Point 1.0 2.0,"")]

-- Exercise
data Maybe a = Just a | Nothing deriving (Show, Read)
data Move = Rock | Paper | Scissor deriving (Show, Read)
parseMove :: String -> Maybe Move
parseMove str = case reads str of [(m, "")] -> Just m
                                  _         -> Nothing
-- tolerate trailing whitespace
parseMove :: String -> Maybe Move
parseMove str = case reads str of
  [(m, rest)] | ok rest -> Just m
  _                     -> Nothing
  where ok = all (`elem` " \r\n")
