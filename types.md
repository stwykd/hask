Every expression and binding has a type.
```haskell
x :: Integer
x = (1 :: Integer) + (1 :: Integer) :: Integer
```
:: has lower precedence than any function operators (including +).

Function application happens one argument at a time (a.k.a. "currying").
```haskell
add :: Integer -> (Integer -> Integer)
add arg1 arg2 = arg1 + arg2
```
So add 2 3 is equivalent to (add 2) 3.
(add 2) takes 3 returns 5, so (add 2) has type Integer -> Integer.
-> associates to the right, so parens usually omitted in multi-argument function types:
```haskell
fn :: argType1 -> argType2 -> ... -> argTypeN -> resultType
```

Good practice to declare types of top-level bindings anyway (compiler warns if missing).

Type declarations can contain restrictions on type variables.
Restrictions expressed with "(class type-var, ...) =>" at start of type.
```haskell
replicate :: (Num i, Ord i) => i -> a -> [a]
  ...
elem :: (Eq a) => a -> [a] -> Bool
  ...
```
When you call Eq, you explicitly give it a value of type a.
But also implicitly give it a function pointer for type a's Eq instance.
