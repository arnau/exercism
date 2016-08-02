module WordCount exposing (..)

import String
import Dict exposing (Dict)
import Char


wordCount : String -> Dict String Int
wordCount input =
  input
    |> String.toLower
    |> String.words
    |> List.filterMap isAlphanumeric
    |> List.filter (not << String.isEmpty)
    |> List.foldl count Dict.empty


count : String -> Dict String Int -> Dict String Int
count word hash =
  Dict.insert word
              ((Maybe.withDefault 0 (Dict.get word hash)) + 1)
              hash


isAlphanumeric : String -> Maybe String
isAlphanumeric word =
  if word == word then
    Just (String.filter (\c -> Char.isLower c || Char.isDigit c) word)
  else
    Nothing
