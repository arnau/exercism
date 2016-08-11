module AtbashCipher exposing (..)

import Char
import String

plain = String.toList "abcdefghijklmnopqrstuvwxyz1234567890"
cipher = String.toList "zyxwvutsrqponmlkjihgfedcba1234567890"


zip : List a -> List b -> List (a, b)
zip xs ys =
  List.map2 (,) xs ys


codex : List (Char, Char)
codex =
  zip plain cipher


encode : String -> String
encode str =
  str
    |> String.toLower
    |> String.filter isAlphaNum
    |> String.map translate
    |> groupBy 5
    |> String.trim


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
  List.filter (\(plain, _) -> char == plain) codex
    |> takeCipher


takeCipher : List (Char, Char) -> Char
takeCipher xs =
  case xs of
    [] ->
      '-'

    x :: xs ->
      snd x


decode str =
  str
    |> String.filter isAlphaNum
    |> String.map translate
