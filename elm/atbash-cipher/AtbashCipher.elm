module AtbashCipher exposing (..)

import Char
import String


encode : String -> String
encode str =
  str
    |> String.toLower
    |> String.filter isAlphaNum
    |> String.map translate
    |> groupBy 5
    |> String.trim


decode str =
  str
    |> String.filter isAlphaNum
    |> String.map translate


isAlphaNum : Char -> Bool
isAlphaNum char =
  Char.isLower char || Char.isDigit char


groupBy : Int -> String -> String
groupBy n xs =
  case xs of
    "" ->
      xs

    _ ->
      (String.left n xs) ++ " " ++ (groupBy n (String.dropLeft n xs))


translate : Char -> Char
translate char =
  if Char.isDigit char then
    char
  else
    Char.fromCode ((Char.toCode 'a') + (Char.toCode 'z') - Char.toCode char)

