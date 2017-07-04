import Control.Monad.State

-- https://wiki.haskell.org/The_Fibonacci_sequence

fib :: Int -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fibFast :: Int -> Integer
fibFast = go 0 1
  where
    go a _ 0 = a
    go a b n = go b (a + b) (n - 1)

fibState :: Int -> Integer
fibState n =
  flip evalState (0, 1) $ do
    let
      go = do
        (fibn1, fibn) <- get
        put (fibn, fibn1 + fibn)
    replicateM_ n go
    (fibn, _) <- get
    return fibn

fibList :: Int -> Integer
fibList = (fibs !!)
  where
    fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
