-- data Maybe a = Just a | Nothing deriving (Show, Read)
-- data Move = Rock | Paper | Scissor deriving (Show, Read)
-- parseMove :: String -> Maybe Move
-- parseMove str = case reads str of [(m, "")] -> Just m
--                                   _         -> Nothing
-- -- tolerate trailing whitespace
-- -- parseMove :: String -> Maybe Move
-- -- parseMove str = case reads str of
-- --   [(m, rest)] | ok rest -> Just m
-- --   _                     -> Nothing
-- --   where ok = all (`elem` " \r\n")

data Point = Point Double Double

getX, getMaxCoord :: Point -> Double
getX point = case point of
               Point x y -> x
getMaxCoord (Point x y) | x > y     = x
                        | otherwise = y
