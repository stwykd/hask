For functions and constructors composed of letters, digits, \_, and '
  Prefix is the default: add 1 2
  Putting function in backticks makes it infix: 1 \`add\` 2
For functions starting with one of !#$%&\*+./<=>?@\\^|-~ or constructors starting ":"
  Infix is default, Putting functions in parens makes them prefix, e.g., (+) 1 2

Define precedence of infix operators with fixity declarations
  Keywords: infixl/infixr/infix for left/right/no associativity
  Syntax: infix-keyword [0-9] function [, function ...]
  Allowed wherever a type declaration is allowed
  0 is lowest allowed fixity precedence, 9 is highest
  Prefix function application has fixity 10--higher than any infix call

Fixity for standard operators
```haskell
infixl 9  !!             -- This is the default when fixity unspecified
infixr 9  .
infixr 8  ^, ^^, ⋆⋆
infixl 7  ⋆, /, `quot`, `rem`, `div`, `mod`
infixl 6  +, -           -- Unary negation "-" has this fixity, too
infixr 5  ++             -- built-in ":" constructor has this fixity, too
infix  4  ==, /=, <, <=, >=, >, `elem`, `notElem`
infixr 3  &&
infixr 2  ||
infixl 1  >>, >>=
infixr 1  =<<
infixr 0  $, $!, `seq`
```

The "infixr 0" operators
$ is function application, but with lowest precedence
```haskell
($) :: (a -> b) -> a -> b
f $ x = f x
```

Turns out to be quite useful for avoiding parentheses, E.g.:
```haskell
putStrLn $ "the value of " ++ key ++ " is " ++ show value
```

seq :: a -> b -> b just returns value of second argument...
but forces evaluation of the first argument before evaluating the second
So when you are done, the first argument is a value, not a thunk
```haskell
main = let q = 1 `div` 0
       in seq q $ putStrLn "Hello world!\n"  -- exception

-- $! combines $ and seq
f $! x  = x `seq` f x
```

Accumulators revisited
Unfortunately, acc can contain a chain of thunks n long
(((1 * n) * (n - 1)) * (n - 2) ...) Laziness means only evaluated when needed
Can fix such problems using $! or seq
```haskell
factorial n0 = loop 1 n0
    where loop acc n | n > 1     = (loop $! acc * n) (n - 1)
                     | otherwise = acc
factorial n0 = loop 1 n0
    where loop acc n | n > 1     = acc `seq` loop (acc * n) (n - 1)
                     | otherwise = acc
```
