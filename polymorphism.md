Some more handy ones from Prelude:
```haskell
id :: a -> a
id x = x
const :: a -> b -> a
const a _ = a
fst :: (a, b) -> a
fst (a, _) = a
snd :: (a, b) -> b
snd (_, b) = b
print a = putStrLn (show a)   -- what's the type?  a -> IO ()?
show a = ???                  -- how to implement?
```

There are actually two kinds of polymorphism at work here.
Parametric polymorphism -- does the same thing for every type.
```haskell
id :: a -> a -- works for every possible type
```

-- Ad hoc polymorphism -- does different things on different types.
```haskell
1 + 1; 1.0 + 1.0 -- compute very different functions
show True -- converts  value to String, only if the input type derives Show
```

Classes and Instances.
Ad hoc polymorphic functions are called methods and declared with classes.
```haskell
class MyShow a where
  myShow :: a -> String
-- The actual method for each type is defined in an instance declcaration
data Point = Point Double Double
instance MyShow Point where
  myShow (Point x y) = "(" ++ show x ++ ", " ++ show y ++ ")"
-- A class declaration can also include default definitions for methods

-- What's the type of a function that calls myShow?
myPrint :: MyShow a => a -> IO ()
myPrint x = putStrLn $ myShow x
```

The Dreaded Monomorphism Restriction ...
  Heuristic: If it looks like a function, can infer ad hoc polymorphic types.
  If it looks like anything else, no ad hoc polymorphism unless explicitly declared.
  parametric polymorphic types can always be inferred (no hidden arguments).

What looks like a function?
  Has to bind a single symbol (f), rather than a pattern ((x, y) = ..., (Just x) = ...).
  Has to have at least one explicit argument (f x = ... ok, f = ... not).

How are monomorphic types inferred?
  If bound symbol used elsewhere in module, infer type from use.
  If still ambiguous and type is of class Num, try Integer then Double.
  If still ambiguous, compilation fails.

Think of type restrictions as implicit dictionary arguments.
  Compiler won't saddle non-function with implicit arguments.

Relatively easy to work around DMR
  Add type signatures to functions--a good idea anyway for top-level bindings,
  ... and sometimes necessary for let bindings.
