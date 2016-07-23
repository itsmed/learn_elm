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
  }

model : Model

model =
  Model "" "" ""


-- UPDATE

type Msg
  = Name String
  | Password String
  | PasswordAgain String


update : Msg -> Model -> Model

update msg model =
  case msg of 
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password -> 
      { model | passwordAgain = password }

-- VIEW

view : Model -> Html Msg

view model =
  div []
  [ input [ type' "text", placeholder "Name", onInput Name ] []
  , input [ type' "password", placeholder "Password", onInput Password ] []
  , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
  , viewValidation model
  ]

viewValidation : Model -> Html Msg
viewValidation model =

  let
    (color, message) =
--"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}"
      if String.length model.password >= 8 then 
        ("green", "Contains j")
      else if model.password == model.passwordAgain then
        ("green", "matches")
      else 
        ("red", "something is wrong")
      
  in 
    div [ style [("color", color)] ] [ text message ] 
