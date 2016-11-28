-- myLength :: (Eq a) => [a] -> Int
-- myLength ls = let loop xs n = if xs == []
--                               then n
--                               else loop (tail xs) (n + 1)
--               in loop ls 0

myLength :: [a] -> Int
myLength = sum . map (\_->1)
