module App.Update exposing (init, update, Msg(..))

import App.Model as App exposing (emptyModel, Model, Page)
import Pages.Login.Update exposing (Msg)


type Msg
    = Logout
    | NoOp
    | PageLogin Pages.Login.Update.Msg
    | SetActivePage App.Page


init : ( Model, Cmd Msg )
init =
    emptyModel ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Logout ->
            init

        NoOp ->
            model ! []

        PageLogin msg ->
            let
                ( val, cmds ) =
                    Pages.Login.Update.update msg model.pageLogin
            in
                ( { model | pageLogin = val }
                , Cmd.map PageLogin cmds
                )

        SetActivePage page ->
            { model | activePage = page } ! []