module Csv where

import Control.Monad (liftM)
import Util

-- CSVから読み出した2次元配列なデータ
type CSVData = [[String]]


readCSV :: FilePath -> IO CSVData
readCSV pth = toCells $ toLines $ readFile pth
  where
    toLines = liftM lines
    toCells = liftM (map $ split ',')


writeCSV :: FilePath -> CSVData -> IO ()
writeCSV pth dt = writeFile pth $ toStr dt
  where
    toStr dt = conc "\n" $ map (conc ",") dt