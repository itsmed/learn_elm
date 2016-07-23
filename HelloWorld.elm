import Html exposing (..)
import Html.App as App
import Html.Events exposing (onClick)
import String

main =
  App.beginnerProgram { model = 0, view = view, update = update }

type Msg = Increment | Decrement

-- model hopefully this is a comment

update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

view model =
  div []
  [ button [onClick Decrement ] [ text "-" ] 
  , div [] [text (toString model) ]
  ,button [ onClick Increment ] [ text "+" ]
  ]