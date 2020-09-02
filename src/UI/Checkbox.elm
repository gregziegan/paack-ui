module UI.Checkbox exposing
    ( Checkbox, checkbox
    , withLabelVisible
    , renderElement
    )

{-| Accessible and uniform-styled implementation of a checkbox.

    Checkbox.checkbox "I agree with terms of service."
        Msg.ToggleThis
        True
        |> Checkbox.withSize Size.small
        |> Checkbox.withLabelVisible False
        |> Checkbox.renderElement renderConfig


# Building

@docs Checkbox, checkbox


# Label

@docs withLabelVisible


# Size

@docs withSize


# Rendering

@docs renderElement

-}

import Element exposing (Attribute, Element, px)
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import UI.Icon as Icon
import UI.Internal.Palette as Palette
import UI.Internal.RenderConfig exposing (localeTerms)
import UI.Palette as Palette
import UI.RenderConfig exposing (RenderConfig)
import UI.Text as Text
import UI.Utils.ARIA as ARIA
import UI.Utils.Element as Element


{-| The `Checkbox msg` type is used for describing the component for later rendering.
-}
type Checkbox msg
    = Checkbox (Properties msg) Options


type alias Properties msg =
    { message : Bool -> msg
    , label : String
    , state : Bool
    }


type alias Options =
    { labelVisible : Bool
    }


{-| Defines all the required properties for creating a checkbox.

    checkbox "Buy Milk"
        (Msg.ProductListSet Milk)
        True

-}
checkbox : String -> (Bool -> msg) -> Bool -> Checkbox msg
checkbox label message state =
    Checkbox { message = message, label = label, state = state }
        { labelVisible = True }


{-| Show or hide the checkbox's label.

    TextField.setLabelVisible True someTextField

-}
withLabelVisible : Bool -> Checkbox msg -> Checkbox msg
withLabelVisible bool (Checkbox prop opt) =
    Checkbox prop { opt | labelVisible = bool }


{-| End of the builder's life.
The result of this function is a ready-to-insert Elm UI's Element.
-}
renderElement : RenderConfig -> Checkbox msg -> Element msg
renderElement renderConfig (Checkbox { message, label, state } { labelVisible }) =
    let
        boxAttrs =
            [ Element.width (px 20)
            , Element.height (px 20)
            , Border.color Palette.primary.middle
            , Border.width 2
            , Border.rounded 8
            , Events.onClick (message (not state))
            , Element.pointer
            ]
                ++ aria

        aria =
            ARIA.roleCheckbox state
                |> ARIA.withLabel label
                |> ARIA.toElementAttributes

        boxIcon =
            if state then
                Element.el
                    (boxSelected :: boxAttrs)
                    (boxCheck renderConfig)

            else
                Element.el
                    boxAttrs
                    Element.none
    in
    if labelVisible then
        Element.row [ Element.spacing 8 ]
            [ boxIcon
            , Text.caption label
                |> Text.renderElement renderConfig
            ]

    else
        boxIcon


boxSelected : Attribute msg
boxSelected =
    Background.color Palette.primary.middle


boxCheck : RenderConfig -> Element msg
boxCheck renderConfig =
    (renderConfig |> localeTerms >> .checkbox >> .toggle)
        |> Icon.check
        |> Icon.withCustomSize 14
        |> Icon.withColor
            (Palette.color
                Palette.tonePrimary
                Palette.brightnessMiddle
                |> Palette.setContrasting True
            )
        |> Icon.renderElement renderConfig
        |> Element.el
            [ Element.centerY
            , Element.centerX
            ]
