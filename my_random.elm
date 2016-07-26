import Html exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Random


main =
  App.program
  { init = init
  , view = view
  , update = update 
  , subscriptions = subscriptions
  }


-- init
init : (Model, Cmd Msg)
init =
  (Model 1, Cmd.none)


-- model

type alias Model =
  { dieFace : Int
  }


-- update

type Msg 
  = Roll
  | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFace (Random.int 1 6))

    NewFace newFace ->
      (Model newFace, Cmd.none)

-- subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- view

view : Model -> Html Msg
view model =
  div []
  [ h1 [] [ text (toString model.dieFace) ]
  , button [ onClick Roll ] [ text "Roll" ]
  ]


