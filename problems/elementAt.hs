-- elementAt :: [a] -> Int -> a
-- elementAt ls i = ls !! (i-1)

-- elementAt :: [a] -> Int -> a
-- elementAt ls i
--     | i == 1 = head ls
--     | otherwise = elementAt (tail ls) (i-1)

-- elementAt :: [a] -> Int -> a
-- elementAt (x:_) 1 = x
-- elementAt (x:xs) k
--   | k < 1 = error "Index out of bounds"
--   | otherwise = elementAt xs (k - 1)

-- elementAt :: [a] -> Int -> a
-- elementAt ls i
--   | length ls < i = error "Index out of bounds"
--   | otherwise = last(take i ls)

elementAt :: [a] -> Int -> a
elementAt ls i
  | length ls < i = error "Index out of bounds"
  | otherwise = fst(last(zip ls [1..i]))
