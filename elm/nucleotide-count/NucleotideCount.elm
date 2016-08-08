module NucleotideCount exposing (..)

import String

type alias Counter =
  { a : Int
  , t : Int
  , c : Int
  , g : Int
  }

version : Int
version =
  2

nucleotideCounts : String -> Counter
nucleotideCounts chain =
  String.foldr count (Counter 0 0 0 0) chain

count : Char -> Counter -> Counter
count nucleotide counter =
  case nucleotide of
    'A' ->
      { counter | a = counter.a + 1 }
    'T' ->
      { counter | t = counter.t + 1 }
    'C' ->
      { counter | c = counter.c + 1 }
    'G' ->
      { counter | g = counter.g + 1 }
    _ ->
      counter
