module PhoneNumber exposing (..)

import Char
import String

getNumber : String -> Maybe String
getNumber number =
  number
    |> String.filter Char.isDigit number
    |> withLength
    |> validate


withLength : String -> (String, Int)
withLength number =
  (number, String.length number)


validate (number, length) =
  if length == 10 then
    Just number
  else if length == 11 && String.startsWith "1" number then
    Just (String.dropLeft 1 number)
  else
    Nothing


prettyPrint : String -> Maybe String
prettyPrint input =
  if String.length input == 11 then
    format (String.dropLeft 1 input)
  else
    format input

format : String -> Maybe String
format input =
  Just <| "(" ++ (String.slice 0 3 input) ++ ") "
              ++ (String.slice 3 6 input) ++ "-"
              ++ (String.slice 6 (String.length input) input)
