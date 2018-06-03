{-# LANGUAGE OverloadedStrings #-}

module SkinIni (ini) where

import           Data.HashMap.Strict (fromList)
import           Data.Ini

iniContent = fromList
    [ ("GENERAL", fromList
        [ ("Name",                          "Okap")
        , ("Author",                        "Pako")
        , ("Version",                       "2")
        , ("SliderBallFlip",                "0")
        , ("CursorRotate",                  "0")
        , ("CursorTrailRotate",             "0")
        , ("CursorExpand",                  "0")
        , ("CursorCentre",                  "0")
        , ("SliderBallFrames",              "1")
        , ("HitCircleOverlayAboveNumber",   "0")
        , ("ComboBurstRandom",              "0")
        , ("AnimationFramerate",            "0")
        , ("CustomComboBurstSounds",        "50,100,200,300,400,500")
        , ("SpinnerFadePlayfield",          "1")
        , ("SpinnerNoBlink",                "1")
        , ("SliderStyle",                   "2")
        ])
    ]

ini = printIni $ Ini { unIni = iniContent }
