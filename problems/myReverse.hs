-- myReverse :: [a] -> [a]
-- myReverse [] = []
-- myReverse (x:xs) = (myReverse xs) ++ [x]

-- More efficient
myReverse :: [a] -> [a]
myReverse ls = loop ls []
  where loop [] reversed = reversed
        loop (x:xs) reversed = loop xs (x:reversed)
