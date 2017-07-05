fizz = "fizz"
buzz = "buzz"
fizzBuzz = fizz ++ buzz

-- 15という公倍数を知っている状態
fizzBuzzOnetime :: Int -> String
fizzBuzzOnetime x =
  let
    mod3 x = x `mod` 3
    mod5 x = x `mod` 5
    mod15 x = x `mod` 15
  in
    if mod15 x == 0 then fizzBuzz
     else if mod3 x == 0 then fizz
     else if mod5 x == 0 then buzz else show x

fizzBuzzPlay x = [ fizzBuzzOnetime z | z <- [1..x] ]

-- 15という公倍数を知らない状態

fizzBuzzOnetime2 :: Int -> String
fizzBuzzOnetime2 x =
  let
    arrayMultiple3 x = [ y*3 | y <- [1..x] ]
    arrayMultiple5 x = [ y*5 | y <- [1..x] ]
    isFizz x = elem x (arrayMultiple3 x)
    isBuzz x = elem x (arrayMultiple5 x)
    getFizz x = if isFizz x then fizz else ""
    getBuzz x = if isBuzz x then buzz else ""
    fizzBuzzUnion x = getFizz x ++ getBuzz x
    result = fizzBuzzUnion x
  in
    if null result then show x else result

fizzBuzzPlay2 x = [ fizzBuzzOnetime2 z | z <- [1..x] ]
