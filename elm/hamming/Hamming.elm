module Hamming exposing (..)

import String

distance : String -> String -> Maybe Int
distance xs ys =
  if String.length xs /= String.length ys then
    Nothing
  else
    Just <| countDifferences <| zip (String.toList xs) (String.toList ys)

zip : List a -> List a -> List (a, a)
zip xs ys =
  List.map2 (\x y -> (x, y)) xs ys


countDifferences : List (a, a) -> Int
countDifferences =
  List.length << List.filter (\(x, y) -> x /= y)
