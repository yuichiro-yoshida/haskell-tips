import Util
import Csv
import Time

main = do
  csvDat <- readCSV "in.csv"
  print csvDat
  let out = workDat (Time 0 0) csvDat
  print out
  writeCSV "out.csv" $ workDatLbl : out

workDatLbl = ["日付","出勤","退勤",
  "純勤務時間(分)(休憩1時間除外)",
  "30分区切り出勤","30分区切り勤務時間","繰越勤務時間"]

workDat :: Time -> CSVData -> [[String]]
workDat _ [] = []
workDat over ([""]:rs) = workDat over rs
workDat over (["","",""]:rs) = workDat over rs
workDat over ([d,"",""]:rs)
  = [d,"","","","","",""] : (workDat over rs)
workDat over (r:rs)
  = [ dy, show st, show ed,
    show $ toMin wk,
    show st30, show wktm, show over2 ] 
    : (workDat over2 rs)
  where
    [dy,r1,r2] = r
    st = str2Time2 r1
    ed = str2Time2 r2
    wk = workTime st ed
    st30 = div30Start st
    toAdd = over `add` wk
    wktm  = div30Time toAdd
    over2 = mod30Time toAdd


-- 今日のみの勤務時間。昼休憩1時間も忘れずに。
workTime :: Time -> Time -> Time
workTime start end = end `sub` start `sub` (Time 1 0)

-- 30分区切りの時間を算出
div30Time :: Time -> Time
div30Time t = min2Time $ (toMin t) `div` 30 * 30

-- 30分区切りにしたときの余り時間
mod30Time :: Time -> Time
mod30Time t = min2Time $ (toMin t) `mod` 30

-- 勤務開始時間を直後の30分区切りへ。
-- ただし10分までの超過分は直前の区切りへ。
div30Start :: Time -> Time
div30Start t = if (mod30Time t) <= (Time 0 10)
               then div30Time t
               else (div30Time t) `add` (Time 0 30)
