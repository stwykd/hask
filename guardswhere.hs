-- "|" symbol introduces a guard
-- Guards are evaluated top to bottom; the first True guard wins
-- The system Prelude (standard library) defines otherwise = True
factorial n = let loop acc n' | n' > 1 = (acc * n') (n' - 1)
                              | otherwise acc
              in loop 1 n

-- Unlike let, a where clause scopes over multiple guarded definitions
-- This is convenient for binding variables to use in guards
factorial n =
 where loop acc n' | n' > 1 = (acc * n') (n' - 1)
                   | otherwise acc
