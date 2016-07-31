module Pangram exposing (..)

import String
import List

alphabet : List Char
alphabet =
  String.toList "abcdefghijklmnopqrstuvwxyz"

isPangram : String -> Bool
isPangram sentence =
  List.all (normalise sentence |> isMember) alphabet

normalise : String -> List Char
normalise str =
  str |> String.toLower |> String.toList

isMember : List Char -> Char -> Bool
isMember = 
  flip List.member
