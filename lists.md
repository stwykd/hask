We could define homogeneous lists with the data keyword.
```haskell
data List a = Cons a (List a) | Nil
oneTwoThree = (Cons 1 (Cons 2 (Cons 3 Nil))) :: List Integer
```

Haskell has built-in lists with syntactic sugar.
Instead of List Integer, the type is written [Integer].
Instead of Cons, the constructor is called : and is infix.
Instead of Nil, the empty list is called [].
```haskell
oneTwoThree = 1:2:3:[] :: [Integer]

-- more convenient syntaxes
oneTwoThree' = [1, 2, 3]  -- comma-separated elements within brackets
oneTwoThree'' = [1..3]    -- define list by a range

['a', 'b', 'c'] == "abc" -- strings are lists of chars
```

Basic list functions
```haskell
head :: [a] -> a
head (x:_) = x
head []    = error "head: empty list"

tail :: [a] -> [a]           -- all but first element
tail (_:xs) = xs
tail []     = error "tail: empty list"

a ++ b :: [a] -> [a] -> [a]  -- infix operator concatenate lists
[] ++ ys     = ys
(x:xs) ++ ys = x : xs ++ ys

length :: [a] -> Int         -- This code is from language spec
length []    =  0            -- GHC implements differently, why?
length (_:l) =  1 + length l

filter :: (a -> Bool) -> [a] -> [a]
filter pred [] = []
filter pred (x:xs)
  | pred x     = x : filter pred xs
  | otherwise  = filter pred xs
```
