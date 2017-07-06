module Time where

import Util

type Hour   = Int
type Minute = Int

data Time = Time Hour Minute


instance Show Time where
  show (Time h m) = (show h) ++ ":" ++ (show2 m)
    where
      -- ゼロサプレス2桁表示
      show2 m = if m < 9 then "0" ++ (show m) 
                else show m

instance Eq Time where
  a == b = (toMin a) == (toMin b)

instance Ord Time where
  a <= b = if (toMin a) <= (toMin b) then True
           else False


-- 文字列からTime型へ
str2Time :: String -> Time
str2Time str =  to $ (map toI) $ split ':' str
  where
    to [h,m] = Time h m


-- 文字列からTime型へ another version
-- 1030や900などの文字列からTimeへ変換
str2Time2 :: String -> Time
str2Time2 str =  to $ (map toI) $ divide str
  where
    to [h,m] = Time h m
    divide [h,     m1,m2] = [[h],     [m1,m2]]
    divide [h1,h2, m1,m2] = [[h1,h2], [m1,m2]]

-- 分からTimeへ
min2Time :: Minute -> Time
min2Time m = Time (m `div` 60) (m `mod` 60) 

-- 分に換算する
toMin :: Time -> Minute
toMin (Time h m) = h * 60 + m

-- Timeの加算
add :: Time -> Time -> Time
x `add` y = min2Time $ (toMin x) + (toMin y)

-- Timeの減算
sub :: Time -> Time -> Time
x `sub` y = min2Time $ (toMin x) - (toMin y)

