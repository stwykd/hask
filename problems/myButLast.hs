-- myButLast :: [a] -> a
-- myButLast (x:y:[]) = x
-- myButLast (x:xs) = myButLast xs

-- myButLast :: [a] -> a
-- myButLast = last . init

myButLast :: [a] -> a
myButLast = head . tail . reverse
