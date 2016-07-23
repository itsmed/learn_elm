--import Html exposing (..)
--import Html.App as Html
--import Html.Attributes exposing (..)
--import Html.Events exposing (onInput)
--import String exposing (..)

--main =
--  Html.beginnerProgram { model = model, view = view, update = update }


---- MODEL

--type alias Model = 
--  { name : String
--  , age : Int
--  , password : String
--  , passwordAgain: String
--  }

--model : Model 

--model =
--  Model "" 0 "" ""


---- UPDATE

--type Msg
--  = Name String
--  | Age Int
--  | Password String
--  | PasswordAgain String

--update : Msg -> Model -> Model

--update msg model =
--  case msg of
--    Name name ->
--      { model | name = name }

--    Age age ->
--      { model | age = age }

--    Password password ->
--      { model | password = password }

--    PasswordAgain passwordAgain ->
--      { model | passwordAgain = passwordAgain }


---- VIEW

--view : Model -> Html Msg

--view model =
--  div []
--  [ input [ type' "text", placeholder "name", onInput Name ] []
--  , input [ type' "number", placeholder "age", onInput Age] []
--  , input [ type' "password", placeholder "password", onInput Password ] []
--  , input [ type' "password", placeholder "re-enter pasword", onInput PasswordAgain ] [],
--  , viewValidation model
--  ]

--viewValidation : Model -> Html Msg
--viewValidation model =
--  let
--    (color, message) =
--      case age of 
--        