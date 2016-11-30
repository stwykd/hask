-- pack :: (Eq a) => [a] -> [[a]]
-- pack [] = []
-- pack [x] = [[x]]
-- pack (x:xs) = if x `elem` (head (pack xs))
--               then (x:(head (pack xs))):(tail (pack xs))
--               else [x]:(pack xs)

pack :: (Eq a) => [a] -> [[a]]
pack (x:xs) = let (first, rest) = span (==x) xs
              in (x:first) : pack rest
pack [] = []
