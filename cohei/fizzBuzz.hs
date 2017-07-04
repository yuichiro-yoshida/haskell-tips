toFizzBuzz :: Int -> String
toFizzBuzz n =
  let
    n `divisibleBy` m = n `mod` m == 0
    fizz = if n `divisibleBy` 3 then "Fizz" else ""
    buzz = if n `divisibleBy` 5 then "Buzz" else ""
    fizzBuzz = fizz ++ buzz
  in
    if null fizzBuzz then show n else fizzBuzz

doFizzBuzz :: IO ()
doFizzBuzz = mapM_ (putStrLn . toFizzBuzz) [1..100]
