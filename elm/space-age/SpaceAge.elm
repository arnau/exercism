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
  case planet of
    Earth ->
      toYears seconds 1

    Jupiter ->
      toYears seconds 11.862615

    Mars ->
      toYears seconds 1.8808158

    Mercury ->
      toYears seconds 0.2408467

    Neptune ->
      toYears seconds 164.79132

    Saturn ->
      toYears seconds 29.447498

    Uranus ->
      toYears seconds 84.016846

    Venus ->
      toYears seconds 0.61519726

toYears seconds factor =
  seconds / (31557600 * factor)
