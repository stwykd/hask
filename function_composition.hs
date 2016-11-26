import Data.Char    -- brings function isLower into scope

countLowerCase :: String -> Int
countLowerCase str = length (filter isLower str)

-- ... with function composition (constant space)
-- doesn't name the argument, style called point-free
countLowerCase :: String -> Int
countLowerCase = length . filter isLower
