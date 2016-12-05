Haskell allows anonymous functions through lambda abstraction.
The notation is \\variable(s) -> body.
"\\" is an ASCII approximation of "λ", so pronounced "lambda".
```haskell
countLowercaseAndDigits :: String -> Int
countLowercaseAndDigits =
    length . filter (\c -> isLower c || isDigit c)
```

Lambda abstractions can deconstruct values with patterns, e.g.:
```haskell
        ... (\\(Right x) -> x) ...
```
But note that guards or multiple bindings are not allowed.
Patterns must have the right constructor or will get run-time error.
