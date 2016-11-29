-- The data keyword declares user-defined data types
-- Note that data types and constructors must start with capital letters
data Point = Point Double Double deriving Show
-- Used like ...
myPoint :: Point
myPoint = Point 1.0 1.0

-- One type can have multiple constructors (like a tagged union):
data Point = Cartesian Double Double
           | Polar Double Double
             deriving Show

data Color = Red | Green | Blue | Violet deriving (Show, Eq, Enum)
-- Used like ...
myColor :: Color
myColor = Red

-- Function bindings & case statements "de-construct" values with patterns
isRed :: Color -> Bool
isRed Red = True        -- Only matches constructor Red
isRed c   = False       -- Lower-case c just a variable

getX, getMaxCoord :: Point -> Double
getX point = case point of
               Point x y -> x
getMaxCoord (Point x y) | x > y     = x
                        | otherwise = y

-- Types can have parameters
-- Type parameters start with lower-case letters
data Maybe a = Just a
             | Nothing

data Either a b = Left a
                | Right b

-- Types and constructors can use the same name, since they are in different namespaces.
-- But, you can have multiple constructors by declaring them with different names.
-- Constructors additionally don't need to take arguments
-- Constructors act like functions producing values of their types.



-- More deconstruction on types ...
-- Compiler warns if a bound variable not used; _ avoids this
isJust :: Maybe a -> Bool    -- note parametric polymorphism
isJust (Just _) = True
isJust Nothing  = False

isRed Red = True
isRed _   = False            -- we don't need the non-red value

-- deconstruct types and bind variables within guards
addMaybes mx my | Just x <- mx, Just y <- my = Just (x + y)
addMaybes _ _                                = Nothing
-- ... though often there s a simpler way
addMaybes (Just x) (Just y) = Just (x + y)
addMaybes _ _               = Nothing



-- Exercise
data Move = Rock | Paper | Scissors deriving (Eq, Read, Show, Enum, Bounded)
data Outcome = Lose | Tie | Win deriving (Show, Eq, Ord)
-- | @outcome our_move their_move@
outcome :: Move -> Move -> Outcome
outcome Rock Scissors        = Win
outcome Paper Rock           = Win
outcome Scissors Paper       = Win
outcome us them | us == them = Tie
                | otherwise  = Lose
