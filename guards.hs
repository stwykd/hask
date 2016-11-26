bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | weight / height ^ 2 <= 18.5 = "a"
  | weight / height ^ 2 <= 25.0 = "b"
  | weight / height ^ 2 <= 30.0 = "c"
  | otherwise = "d"

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b
