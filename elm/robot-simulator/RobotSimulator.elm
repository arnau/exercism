module RobotSimulator exposing (..)

import String


type Bearing
  = North
  | East
  | West
  | South

type alias Coord =
  { x : Int
  , y : Int
  }

type alias Robot =
  { bearing : Bearing
  , coordinates : Coord
  }


defaultRobot : Robot
defaultRobot =
  Robot North (Coord 0 0)

turn : (Bearing -> Bearing) -> Robot -> Robot
turn fn robot =
  { robot | bearing = fn robot.bearing }

turnRight : Robot -> Robot
turnRight robot =
  turn rightOf robot


turnLeft : Robot -> Robot
turnLeft robot =
  turn leftOf robot


rightOf : Bearing -> Bearing
rightOf bearing =
  case bearing of
    North -> East
    East -> South
    South -> West
    West -> North


leftOf : Bearing -> Bearing
leftOf bearing =
  case bearing of
    North -> West
    West -> South
    South -> East
    East -> North

advance : Robot -> Robot
advance robot =
  case robot.bearing of
    North ->
      advanceTo robot 0 1
    East ->
      advanceTo robot 1 0
    South ->
      advanceTo robot 0 -1
    West ->
      advanceTo robot -1 0

advanceTo : Robot -> Int -> Int -> Robot
advanceTo robot x y =
  { robot | coordinates = updateCoords robot.coordinates x y }


updateCoords : Coord -> Int -> Int -> Coord
updateCoords original x y =
  { original
  | x = original.x + x
  , y = original.y + y
  }


simulate : String -> Robot -> Robot
simulate sequence robot =
  case String.uncons sequence of
    Nothing ->
      robot

    Just (instruction, rest) ->
      simulate rest (update instruction robot)


update : Char -> Robot -> Robot
update instruction robot =
  case instruction of
    'R' ->
      turnRight robot

    'L' ->
      turnLeft robot

    'A' ->
      advance robot

    _ ->
      robot
