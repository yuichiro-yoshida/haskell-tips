module Baby where

doubleMe x = x + x

doubleUs x y = x * 2 + y * 2

doubleUs2 x y = doubleMe x + doubleMe y

doubleSmallNumber x =
    if x > 100
    then x
    else x * 2

doubleSmallNumber' x =
    (if x > 100 then x else x * 2) + 1

me = "Yoshida"

numbers = [1, 2, 3, 5, 8]

boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

length' xs = sum [1 | _ <- xs]

removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

triples = [ (a,b,c) | c <- [1..10], a <- [1..10], b <- [1..10] ]
rightTriples = [ (a,b,c) |
    c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2 ]

rightTriples' = [ (a, b, c) |
    c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a + b + c == 24 ]

