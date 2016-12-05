```haskell
import Data.Char    -- brings function isLower into scope

countLowerCase :: String -> Int
countLowerCase str = length (filter isLower str)
```
... with function composition, f (g x) becomes (f . g) x, runs in constant space.
Doesn't name the argument, style called point-free.
```haskell
countLowerCase :: String -> Int
countLowerCase = length . filter isLower
```
