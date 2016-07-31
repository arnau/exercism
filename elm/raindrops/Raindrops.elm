module Raindrops exposing (..)

import List exposing (filterMap)
import String exposing (concat)

droplets : List (Int, String)
droplets =
  [ (3, "Pling")
  , (5, "Plang")
  , (7, "Plong")
  ]

raindrops : Int -> String
raindrops n =
  case filterMap (isFactorOf n) droplets of
    [] ->
      toString n

    drops ->
      concat drops


isFactorOf : Int -> (Int, String) -> Maybe String
isFactorOf n (x, s) =
  if n % x == 0 then
    Just s
  else
    Nothing
