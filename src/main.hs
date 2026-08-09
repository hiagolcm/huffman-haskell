module Main where

import qualified Data.ByteString as BS
import Data.Word (Word8)
import qualified Data.Map.Strict as Map

fileAsByteList :: FilePath -> IO [Word8]
fileAsByteList path = do
  content <- BS.readFile path
  return (BS.unpack content)



getFrequencyTable :: [Word8] -> Map.Map Word8 Integer
getFrequencyTable = foldl' (\acc w -> Map.insertWith (+) w 1 acc) Map.empty

main :: IO ()
main = do
  -- Exemplo: lendo um arquivo qualquer
  bytes <- fileAsByteList "arquivo.txt"
  
  putStrLn "Primeiros 10 bytes em decimal (0-255):"
  print (take 10 bytes)