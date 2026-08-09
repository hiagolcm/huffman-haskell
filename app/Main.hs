module Main where

import qualified Data.Heap as Heap

main :: IO ()
main = do
  -- Criando um MinHeap com números
  let heapExemplo = Heap.fromList [10, 3, 5, 1] :: Heap.MinHeap Int
  
  putStrLn "Menor elemento do Heap:"
  print (Heap.viewHead heapExemplo)