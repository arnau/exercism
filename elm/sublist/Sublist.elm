module Sublist exposing (..)

version = 2

type ListComparison
  = Equal
  | Unequal
  | Superlist
  | Sublist

sublist : List a -> List a -> ListComparison
sublist xs ys =
  if xs == ys then
    Equal
  else if isSublist xs ys then
    Sublist
  else if isSublist ys xs then
    Superlist
  else
    Unequal

isSublist : List a -> List a -> Bool
isSublist xs ys =
  if (List.length xs) > (List.length ys) then
    False
  else
    scan xs ys

scan xs ys =
  if (List.take (List.length xs) ys) == xs then
    True
  else
    isSublist xs (List.drop 1 ys)
