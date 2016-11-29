-- Every expression and binding has a type
x :: Integer
x = (1 :: Integer) + (1 :: Integer) :: Integer
-- :: has lower precedence than any function operators (including +)

-- Function application happens one argument at a time (a.k.a. "currying")
add :: Integer -> (Integer -> Integer)
add arg1 arg2 = arg1 + arg2
-- So add 2 3 is equivalent to (add 2) 3
-- (add 2) takes 3 returns 5, so (add 2) has type Integer -> Integer
-- -> associates to the right, so parens usually omitted in multi-argument function types:
-- fn :: argType1 -> argType2 -> ... -> argTypeN -> resultType

-- Good practice to declare types of top-level bindings anyway (compiler warns if missing)
