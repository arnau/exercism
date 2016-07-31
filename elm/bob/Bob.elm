module Bob exposing (..)

import String exposing (..)
import Char exposing (isDigit)

type Interaction
  = Question
  | Yell
  | Nonsense
  | Anything


hey : String -> String
hey text =
  case toInteraction text of
    Question ->
      "Sure."

    Yell ->
      "Whoa, chill out!"

    Nonsense ->
      "Fine. Be that way!"

    Anything ->
      "Whatever."


toInteraction : String -> Interaction
toInteraction text =
  if isNonsense text then
    Nonsense
  else if isYelling text then
    Yell
  else if isQuestion text then
    Question
  else
    Anything

isNonsense : String -> Bool
isNonsense text =
  trim text |> isEmpty

isYelling : String -> Bool
isYelling text =
  toUpper text == text && toLower text /= text

isQuestion : String -> Bool
isQuestion text =
  endsWith "?" text
