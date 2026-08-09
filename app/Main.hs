module Main where

import qualified Data.ByteString as BS
import Data.Word (Word8)
import qualified Data.Map.Strict as Map
import qualified Data.Heap as Heap

data HuffmanTree 
  = Leaf Word8 Int
  | HuffmanNode Int HuffmanTree HuffmanTree
  deriving (Show, Eq)

weight :: HuffmanTree -> Int
weight (Leaf _ w)          = w
weight (HuffmanNode w _ _) = w

instance Ord HuffmanTree where
  compare t1 t2 = compare (weight t1) (weight t2)

fileAsByteList :: FilePath -> IO [Word8]
fileAsByteList path = do
  content <- BS.readFile path
  return (BS.unpack content)


getFrequencyTable :: [Word8] -> Map.Map Word8 Integer
getFrequencyTable = foldl' (\acc w -> Map.insertWith (+) w 1 acc) Map.empty


frequencyTableToHeap :: Map.Map Word8 Int -> Heap.MinHeap HuffmanTree
frequencyTableToHeap freqMap = Heap.fromList [Leaf byte count | (byte, count) <- Map.toList freqMap]


main :: IO ()
main = do
  -- Exemplo: lendo um arquivo qualquer
  bytes <- fileAsByteList "arquivo.txt"
  
  putStrLn "Primeiros 10 bytes em decimal (0-255):"
  print (take 10 bytes)