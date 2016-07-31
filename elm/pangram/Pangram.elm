module Pangram exposing (..)

import String
import Set exposing (Set)

alphabet : Set Char
alphabet =
  toSet "abcdefghijklmnopqrstuvwxyz"

isPangram : String -> Bool
isPangram sentence =
  sentence
    |> String.toLower
    |> toSet
    |> Set.diff alphabet
    |> Set.isEmpty


toSet : String -> Set Char
toSet str =
  str |> String.toList |> Set.fromList
