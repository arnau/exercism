module PhoneNumber exposing (..)

import Char
import String

getNumber : String -> Maybe String
getNumber input =
  let clean = String.filter Char.isDigit input
      length = String.length clean
  in
    if length == 10 then
      Just clean
    else if length == 11 && String.startsWith "1" clean then
      Just (String.dropLeft 1 clean)
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
