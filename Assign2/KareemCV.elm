module Main exposing (..)

import Css exposing (..)
import Css.Colors
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)

main = view
  |> toUnstyled

header_ =
  styled header
    [
      display block
    , margin (px 5)
    , padding (px 35)
    , textAlign center
    , fontFamilies ["tahoma"]
    , color Css.Colors.white
    ]

h1_ =
  styled h1
  [
    margin (px 10)
  ]

h2_ =
  styled h2
    [
      margin (px 0)
    , padding (px 35)
    , paddingLeft (px 250)
    ]

h3_ =
  styled h3
    [
      margin (px 35)
    , padding (px 35)
    , paddingRight (px 85)
    ]

h4_ =
  styled h4
    [
      margin (px 35)
    , padding (px 35)
    , paddingRight (px 85)
    ]


section_ =
  styled section
    [
      margin (px 0)
    , fontFamilies ["tahoma"]
    , color Css.Colors.white
    ]

div_ =
  styled div
    [
      margin (px 0)
    ]

aside_ =
  styled aside
    [
      float right
    ]

pre_ =
  styled Html.Styled.pre []

p_ =
  styled p
    [
      fontWeight bold
    ]

view =
  div_ [style [("background-image", "url(https://images4.alphacoders.com/153/thumb-1920-153316.jpg")]]
  [
    header_ [style [("background-image", "url(https://en.wikipedia.org/wiki/Milky_Way#/media/File:ESO_-_The_Milky_Way_panorama_(by).jpg)")]]
    [
      h1_ [] [text "|| Kareem Baassiri's CV || "]
    ]
  , section_ []
    [
      div_ [style[("width","725px"),("marginLeft","auto"),("marginRight","auto")]]
        [
          aside_ []
            [
              h3 [] [text "Legend"]
            , ol []
                [
                  li [] [text "Education and Qualifications"]
                , li [] [text "Experience"]
                , li [] [text "Skills & Certifications"]
                ]
            ]
        , h2_ [] [text "About me"]
        , p [style [("margin","0px")]]
          [text "Hi there. I am a third year student at McMaster university, currently in my first year computer science. Previously being in Psychology Neuroscience and Behaviour, I made the switch to Computer Science with a goal of integrating neuroscience into some form of software. My hobbies include photography, powerlifting, and biking."
          ]

        ]

    ]
  , section_ []
    [
      div_ [style[("width","725px"),("marginLeft","auto"),("marginRight","auto")]]
        [
          h2_ [] [text "Experience"]
          , ul [] [
                  li [] [text "The Salvation Army Thrift Store Volunteer (June 2014 - August 2014)"]
                  , li [] [text "The Salvation Army Thrift Store Employee (June 2015 - August 2015)"]
                  , li [] [text "McMaster Underground: Marmor Photographer (September 2016 – Present)"]
                  , li [] [text "McMaster Pulse Support Staff (September 2017 - Present)"]
          , h3_ [] [text "Skills & Certifications "] ]
          , ul [] [
                  li [] [text "Native in Arabic"]
                  ,li [] [text "Competent in Microsoft Word, Excel, Powerpoint"]
                  ,li [] [text "Competent in Python, Bash, Elm, Haskell"]
                  ,li [] [text "Comprehensive WHMIS"]
                  ,li [] [text "Standard First Aid, CPR level HCP"]
                  ,li [] [text "Interests include photography, acting, powerlifting, existential philosophy, astronomy, and hiking"] 
        , li [] [text "Link to Elm architecture to create "], a [href "ElmApp.elm"] [text "The Memetor"]
        , li [] [text "Check out my alternative, photography website"], a [href "https://www.kareembphotography.com"] [text "Here"]
        , li [] [text "Link to my personal Github"], a [href "https://github.com/baassirk1"] [text "Here"]
        ]]

        , div_ [style [("textAlign","left"),("width","150px")]]

            [
              pre_ [] [text "All Rights Reserved."]
            ]
        ]
    , div_ [style[("width","100%"),("textAlign","center")]]
      [
        p_ [] [text "Kareem Baassiri CV, 2018."]
      ]
    ]


text =
  Html.Styled.text
