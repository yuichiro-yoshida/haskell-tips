module Util where

-- 文字列をIntに変換
toI :: String -> Int
toI s = read s :: Int


-- 任意の文字で分割する
split :: Char -> String -> [String]
split _  ""     = [""]
split sp (x:xs) =
  if x /= sp
  then (x : prh) : prt
  else "" : pre
    where
      pre = split sp xs
      (prh:prt) = pre


-- 任意の文字列で結合する
conc :: String -> [String] -> String
conc _   []    = ""
conc _   [x]   = x
conc bnd (x:xs) = x ++ bnd ++ pre
  where
    pre = conc bnd xs

