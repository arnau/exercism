module Allergies exposing (..)

import Bitwise

allergens : List (String, Int)
allergens =
  [ ("eggs", 1)
  , ("peanuts", 2)
  , ("shellfish", 4)
  , ("strawberries", 8)
  , ("tomatoes", 16)
  , ("chocolate", 32)
  , ("pollen", 64)
  , ("cats", 128)
  ]


isAllergicTo : String -> Int -> Bool
isAllergicTo allergen score =
  List.member allergen (toList score)


toList : Int -> List String
toList score =
  List.filterMap (byScore score) allergens


byScore : Int -> (String, Int) -> Maybe String
byScore n (allergen, score) =
  if (Bitwise.and n score) /= 0 then
    Just allergen
  else
    Nothing
