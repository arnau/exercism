module Allergies exposing (..)

import Bitwise

allergens : List String
allergens =
  [ "eggs"
  , "peanuts"
  , "shellfish"
  , "strawberries"
  , "tomatoes"
  , "chocolate"
  , "pollen"
  , "cats"
  ]


isAllergicTo : String -> Int -> Bool
isAllergicTo allergen score =
  List.member allergen (toList score)


toList : Int -> List String
toList score =
  List.filterMap (byScore score) (List.indexedMap (,) allergens)


byScore : Int -> (Int, String) -> Maybe String
byScore n (index, allergen) =
  if (Bitwise.and n (2 ^ index)) /= 0 then
    Just allergen
  else
    Nothing
