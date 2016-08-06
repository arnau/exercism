module RunLengthEncoding exposing (..)

import String exposing (cons, uncons, toInt, fromChar)
import Char

version = 2

encode : String -> String
encode chain =
  encode' (String.foldr collect ("", 1) chain)

encode' : (String, Int) -> String
encode' (result, counter) =
  (countToString counter) ++ result

collect : Char -> (String, Int) -> (String, Int)
collect char (result, counter) =
  case uncons result of
    Nothing ->
      ((countToString counter) ++ (cons char result), counter)

    Just (head, tail) ->
      if char == head then
        (result, counter + 1)
      else
        (cons char ((countToString counter) ++ result), 1)


countToString : Int -> String
countToString counter =
  if counter == 1 then
    ""
  else
    toString counter


decode : String -> String
decode chain =
  decode' (String.foldr expand ("", "") chain)

decode' : (String, String) -> String
decode' (result, amount) =
  mul amount result

expand: Char -> (String, String) -> (String, String)
expand char (result, amount) =
  if Char.isDigit char then
    (result, cons char amount)
  else
    (cons char (mul amount result), "")

mul : String -> String -> String
mul amount result =
  case toInt amount of
    Ok n ->
      case uncons result of
        Nothing ->
          result

        Just (head, tail) ->
          (List.foldr cons "" (List.repeat n head)) ++ tail

    Err _ ->
      result
