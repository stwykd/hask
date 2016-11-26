 -- common factorial
factorial n = if n > 1
              then n * factorial n
              else n

 -- tail recursive factorial, wh accumulator
factorial n = let loop acc n' = if n' > 1 acc
                                then loop (acc * n') (n' - 1)
                                else acc
              in loop 1 n

 -- factorial wh guards
factorial n = let loop acc n' | n' > 1 = (acc * n') (n' - 1)
                              | otherwise acc
              in loop 1 n

 -- factorial where clause (where scopes over multiple guards)
factorial n =
  where loop acc n' | n' > 1 = (acc * n') (n' - 1)
                    | otherwise acc
