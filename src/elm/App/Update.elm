module App.Update exposing (..)

import App.Model as App exposing (initialModel, Model)

type Msg
  = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
  case action of
    NoOp -> model ! []
