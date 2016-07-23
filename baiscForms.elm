-- TODO: learn regex in elm and finish the extra credit in the exercise

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String exposing(..)
import Regex exposing (..)
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { name : String
  , password : String
  , passwordAgain: String
  , age: String
  }

model : Model

model =
  Model "" "" "" ""


-- UPDATE

type Msg
  = Name String
  | Password String
  | PasswordAgain String
  | Age String


update : Msg -> Model -> Model

update msg model =
  case msg of 
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password -> 
      { model | passwordAgain = password }

    Age age ->
      { model | age = age }

-- VIEW

view : Model -> Html Msg

view model =
  div []
  [ input [ type' "text", placeholder "Name", onInput Name ] []
  , input [ type' "password", placeholder "Password", onInput Password ] []
  , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
  , input [ type' "number", placeholder "Age", onInput Age ] []
  , passwordLengthValidation model
  , passwordMatchValidation model
  , passwordContainsNumbersValidation model
  , passwordContainsLowerCaseValidation model
  , passwordContainsUpperCaseValidation model
  , ageIsNumberValidation model
  ]


passwordLengthValidation : Model -> Html Msg
passwordLengthValidation model =

  let
    (color, message) =

      if String.length model.password >= 8 then 
        ("green", "Long Enough")
      else 
        ("red", "Not enough characters")
      
  in 
    div [ style [("color", color)] ] [ text message ] 

passwordMatchValidation : Model -> Html Msg
passwordMatchValidation model =

  let
    (color, message) =
      if model.password == model.passwordAgain then
        ("green", "matches")
      else
        ("red", "passwords don't match")

    in
      div [ style [("color", color)] ] [ text message ]

passwordContainsNumbersValidation: Model -> Html Msg
passwordContainsNumbersValidation model =

  let
    (color, message) =
      if Regex.contains (regex "[0-9]") model.password then
        ("green", "contains numbers")
      else
        ("red", "password must contain numbers")

    in
      div [ style [("color", color)] ] [ text message ]


passwordContainsLowerCaseValidation: Model -> Html Msg
passwordContainsLowerCaseValidation model =

  let
    (color, message) =
      if Regex.contains (regex "[a-z]") model.password then
        ("green", "contains lower case letters")
      else
        ("red", "pasword must contain lower case letters")

    in
      div [ style [("color", color)] ] [ text message ]

passwordContainsUpperCaseValidation: Model -> Html Msg
passwordContainsUpperCaseValidation model =

  let
    (color, message) =
      if Regex.contains (regex "[A-Z]") model.password then
        ("green", "contains upper case letters")
      else
        ("red", "pasword must contain upper case letters")

    in
      div [ style [("color", color)] ] [ text message ]

ageIsNumberValidation: Model -> Html Msg
ageIsNumberValidation model =

  let
    (color, message) =
      if Regex.contains (regex "[0-9]") model.age then
        ("green", "age ain't nothin' but a number")
      else
        ("red", "age must be a number")

    in
      div [ style [("color", color)] ] [ text message ]