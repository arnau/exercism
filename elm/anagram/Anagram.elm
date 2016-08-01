module Anagram exposing (..)

import List
import String


detect : String -> List String -> List String
detect word list =
  List.filter (\x -> isDifferent word x && isAnagram word x) list

isDifferent : String -> String -> Bool
isDifferent a b =
  String.toLower a /= String.toLower b

isAnagram : String -> String -> Bool
isAnagram a b =
  asOrdered a == asOrdered b

asOrdered : String -> List Char
asOrdered str =
  str
    |> String.toLower
    |> String.toList
    |> List.sort
