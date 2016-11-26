-- Haskell uses the = sign to declare bindings
add arg1 arg2 = arg1 + arg2   -- defines function add
five = add 2 3                -- invokes function add

x = 2
y = 3
main = let z = x + y    -- let introduces local bindings
       in print z       -- program will print 5

bad = print add 2 3     -- error! (print should have only 1 argument)
main = print (add 2 3)  -- ok, calls print with 1 argument, 5
