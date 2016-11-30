-- compress :: Eq a => [a] -> [a]
-- compress ls = map head . group

-- compress :: (Eq a) => [a] -> [a]
-- compress ls = compress_acc ls []
--           where compress_acc [] acc = acc
--                 compress_acc [x] acc = (acc ++ [x])
--                 compress_acc (x:xs) acc
--                   | x == (head xs)  = compress_acc xs acc
--                   | otherwise       = compress_acc xs (acc ++ [x])

-- compress :: Eq a => [a] -> [a]
-- compress [] = []
-- compress (x:xs) = x : (compress $ dropWhile(== x) xs)

compress :: Eq a => [a] -> [a]
compress (x:xs@(y:_))
  | x == y = compress xs
  | otherwise = x : compress xs
compress xs = xs
