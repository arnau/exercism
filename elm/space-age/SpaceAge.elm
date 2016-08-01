module SpaceAge exposing (..)

type Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

ageOn : Planet -> Float -> Float
ageOn planet seconds =
  seconds / (31557600 * (factorFor planet))

factorFor : Planet -> Float
factorFor planet =
  case planet of
    Earth ->
      1

    Jupiter ->
      11.862615

    Mars ->
      1.8808158

    Mercury ->
      0.2408467

    Neptune ->
      164.79132

    Saturn ->
      29.447498

    Uranus ->
      84.016846

    Venus ->
      0.61519726
