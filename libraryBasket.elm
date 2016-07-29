import Html exposing (..)
import Html.App as App
import Html.Events exposing (onClick, onInput)


main =
  App.program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }

type alias Model =
  { currentlyHolding : String
  }

init : String -> (Cmd Msg)
init currentlyHolding =
  ( Model "Twilight Series One" )


type Msg
  = AddToCart
  | CheckOut

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of 
    AddToCart ->