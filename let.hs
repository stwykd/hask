cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea

-- let are expressions
[let square x = x * x in (square 5, square 3, square 2)]

-- multiple let in one line
(let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
-- prints (6000000,"Hey there!")

-- ... or pattern match it
(let (a,b,c) = (1,2,3) in a+b+c) * 100
