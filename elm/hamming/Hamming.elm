module Hamming exposing (..)

import String

distance : String -> String -> Maybe Int
distance xs ys =
  if String.length xs /= String.length ys then
    Nothing
  else
    Just
      <| countDifferences
      <| List.map2 (\x y -> x /= y) (String.toList xs) (String.toList ys)


countDifferences : List Bool -> Int
countDifferences =
  List.length << List.filter identity
