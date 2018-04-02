module Main exposing (..)

-- ugweb.cas.mcmaster.ca/~baassirk1

import Html exposing (..)
import Html.Attributes exposing (..)


divStyle = style [("background-image", "url(https://images4.alphacoders.com/153/thumb-1920-153316.jpg)")
                  ,("border-style","solid")
                  ,("font-family","Arial")]

 


headerStyle = style [("color","white")
                    ,("background-image","url(https://images4.alphacoders.com/153/thumb-1920-153316.jpg")
                    ,("text-align","center")
                    ,("padding","px 35")
                    ,("margin","px 5")
                    ,("height","10em")]

bodyStyle = style [("color","white")]

otherStyle = style [("color","white")
                   ,("padding","0 20% 1em 20%")
                   ]
similarStyle = style [("color","white")
                     ,("padding","0 25% 1em 25%")
                     ]

main = div [divStyle]
        [
        header [headerStyle]
       [
         h1 [] [text "|| Kareem Baassiri's CV ||"]
        , h2 [] [text "baassirk@mcmaster.ca"] 
       ]
       , section [bodyStyle]
        [
          h2 [otherStyle] [text "About me"]
          , p [otherStyle] [text "Hi there. I am a third year student at McMaster university, currently in my first year computer science. Previously being in Psychology Neuroscience and Behaviour, I made the switch to Computer Science with a goal of integrating neuroscience into some form of software. My hobbies include photography, powerlifting, and biking."]
        ]

        ,section [bodyStyle]
                [
                h2 [otherStyle] [text "Experience"]
                , ul [otherStyle] [
                        li [] [text "The Salvation Army Thrift Store Volunteer (June 2014 - August 2014)"]
                        , ul [] [
                                  li [] [text "Accepted and sorted incoming donations"]
                                  , li [] [text "Transported incoming donations from companies"]
                                ]
                        , li [] [text " The Salvation Army Thrift Store Employee (June 2015 - August 2015)"]
                        , ul [] [
                                  li [] [text "Accepted and sorted incoming donations"]
                                  , li [] [text "Customer Service on floor"]
                                  , li [] [text "Transported incoming orders from companies"]
                                  , li [] [text "Price checks"]
                                ]
                        , li [] [text "McMaster Underground: Marmor Photographer (September 2016 - Present)"]
                        , ul [] [
                                  li [] [text "Photographed University and Community related events"]
                                ]
                        , li [] [text "McMaster Pulse Support Staff (September 2017 - Present)"]
                        , ul [] [
                                  li [] [text "Greeting members and answering questions about the Pulse servies and offerings"]
                                  , li [] [text "Checking memberships and ensuring members are adhering to Pulse dress code, rules, and gym etiquette"]
                                  , li [] [text "Distributing equipment and checking tht all pieces are returned/accounted for"]
        ,section [bodyStyle]
              [
                h3 [] [text "Skills & Certifications"] 
                , ul [] [
                        li [] [text "Native in Arabic"]
                        , li [] [text "Competent in Microsoft Word, Excel, Powerpoint"]
                        , li [] [text "Competent in Python, Bash, Elm, Haskell"]
                        , li [] [text "Comprehensive WHMIS"]
                        , li [] [text "Standard First Aid, CPR level HCP"]
                        , li [] [text "Interests include photography, acting, powerlifting, existential philosophy, astronomy, and hiking"]
                , li [] [text "Link to Elm architecture to create"], a [href "ElmApp.elm"] [text "The Memetor"]        
                , li [] [text "Check out my alternative, photography website"], a [href "https://www.kareembphotography.com"] [text "Here"]
                , li [] [text "Link to my personal Github"], a [href "https://github.com/baassirk1"] [text "Here"]
                                      ]

                    ]]
                        ]
                ]
        ]

