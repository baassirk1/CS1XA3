module ImagePicker exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List exposing (..)
import Maybe exposing (..)
import Css exposing (..)
import Css.Colors


type alias Model = { imgs : List String }


init : Model
init = { imgs = ["https://qph.fs.quoracdn.net/main-qimg-a888424e28a17ae6ad3c3a8ee78ad7c2.webp","https://qph.fs.quoracdn.net/main-qimg-a30e78d7ebd617d66a187cfc33b059ef.webp","https://qph.fs.quoracdn.net/main-qimg-ea4fd62a52b998cfb2e2ea6e3e3e8cca.webp","https://i.pinimg.com/564x/e0/6a/a7/e06aa7e395d115083861e4f94a2af8ca.jpg","https://img.devrant.com/devrant/rant/r_88083_s8Bio.jpg","https://img.devrant.com/devrant/rant/r_434934_iTeW4.jpg"]  }

{- Helper functions for selecting images -}
getImage : Model -> String
getImage model = case head model.imgs of
                     Just url -> url
                     Nothing -> ""

rotateRight : Model -> Model
rotateRight model = case model.imgs of
                       (x::xs) -> { model | imgs = xs ++ [x] }
                       []      -> { model | imgs = [] }

rotateLeft : Model -> Model
rotateLeft model = let
       n = length model.imgs - 1
    in { model | imgs = (drop n model.imgs) ++ (take n model.imgs) }

type Msg = NextImage | PrevImage

update : Msg -> Model -> Model
update msg model = case msg of
                       NextImage -> rotateRight model
                       PrevImage -> rotateLeft model


view : Model -> Html Msg
view model =
        div [style [("background-image", "url(http://www.htmlcsscolor.com/preview/gallery/E4C09E.png")]]
        [ h1 [style [("margin", "45px")]]
         [text " Welcome to The Memetor. CS1XA3's Personal Meme Page!"]
        , p [style [("margin", "40px")]]
          [text "Here, you will see a compilation of memes that I have found throughout the semester. From bash, to haskell, you name it."]
        , p [style [("margin", "40px")]]
         [text " Created by Kareem Baassiri, 2018."]
        , button [ onClick NextImage ] [ text "Next" ]
        , button [ onClick PrevImage ] [ text "Prev" ]
        , div [] [img [src  <| getImage model] []]
        ]
main : Program Never Model Msg
main = Html.beginnerProgram
          { model = init,
            view = view,
            update = update }
