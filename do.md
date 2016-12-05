```haskell
greet h = do
  hPutStrLn h "What is your name?"
  name <- hGetLine h
  hPutStrLn h $ "Hi, " ++ name
  ```
Greeting task requires some impure (non-functional) actions.
  Reading and writing a file handle.
A do block lets you sequence IO actions. In a do block:
  <- notation assigns a variable name to stand for the returned value.
  <- can be used with any action except the last.
  action - executes action and discards the result, or returns it if at end of block.

GHCI input is like do block (i.e., can use <-, need let for bindings).

Running greet
No * before Main means no access to internal symbols (because compiled), need to say:
  Prelude Main> :load \*greet.hs


Types of IO actions
```haskell
main :: IO ()
greet :: Handle -> IO ()
hPutStrLn :: Handle -> String -> IO ()
hGetLine :: Handle -> IO String
```
"IO String" means IO action that produces a String if executed.
Unlike Maybe, we won't use a constructor for IO, which is somewhat magic.

How to de-construct an IO [String] to get a [String].
  We can't use case, because we don't have a constructor for IO...
  That's the point of the <- operator in do blocks!


The function return gives trivial IO action returning a particular value.
```haskell
greet :: Handle -> IO String
greet h = do
  hPutStrLn h "What is your name?"
  name <- hGetLine h
  hPutStrLn h $ "Hi, " ++ name
  return name
```
Note: return is not control flow statement, just a function.
```haskell
  return :: a -> IO a
```

Point-free IO composition.
Function >>= (pronounced "bind") allows point-free IO composition.
```haskell
(>>=) :: IO a -> (a -> IO b) -> IO b
infixl 1 >>=
-- Let's re-write greet with point-free style to avoid variable name
greet h = do
  hPutStrLn h "What is your name?"
  hGetLine h >>= hPutStrLn h . ("Hi, " ++)
```
Note >== composes left-to-right while . goes right-to-left.

The do blocks are just syntactic sugar for calling >>=.
```haskell
greet h = hPutStrLn h "What is your name?" >>= \_ ->
          hGetLine h >>= \name ->
          hPutStrLn h ("Hi, " ++ name)
```

Exercise
```haskell
getMove :: Handle -> IO Move
getMove h = do
  hPutStrLn h $ "Please enter one of " ++ show ([minBound..] :: [Move])
  -- Here is the added code:
  input <- hGetLine h
  case parseMove input of Just move -> return move
                          Nothing -> getMove h

computerVsUser :: Move -> Handle -> IO ()
computerVsUser computerMove h = do
  userMove <- getMove h
  let o = outcome userMove computerMove
  hPutStrLn h $ "You " ++ show o
```
