-- Guards let you shorten function declarations by declaring conditions in which a function occurs:
--   Pipe ("|") symbol introduces a guard
--   The first True guard wins. otherwise in Prelude evaluates to true
factorial n = let loop acc n' | n' > 1 = (acc * n') (n' - 1)
                              | otherwise acc
              in loop 1 n

-- Bindings can end with where clauses
--   Where clauses can scope over multiple guards
--   Convenient for binding variables to use in guards
factorial n =
 where loop acc n' | n' > 1 = (acc * n') (n' - 1)
                   | otherwise acc
