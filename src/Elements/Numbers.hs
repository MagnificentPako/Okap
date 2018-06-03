{-# LANGUAGE OverloadedStrings #-}

module Elements.Numbers (numbers, numbersHD) where

import           Codec.Picture               (PixelRGBA8 (..))
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

fontColor = PixelRGBA8 0xFF 0xFF 0xFF 0xFF

mkChar font c =
    withTexture (uniformTexture fontColor) $ do
        printTextAt font (PointSize 48) (V2 (-6) 48) c

mkNumber font n =
    let n' = show n in
        mkChar font n'

mkCharHD font c =
    withTexture (uniformTexture fontColor) $ do
        printTextAt font (PointSize 96) (V2 (-12) 95) c

mkNumberHD font n =
    let n' = show n in
        mkCharHD font n'

drawNumber n =
    renderDrawing 35 50 (PixelRGBA8 255 255 255 0) n

drawNumberHD n =
    renderDrawing 70 98 (PixelRGBA8 255 255 255 0) n

numbers font = map (\x -> ("default-" ++ show x ++ ".png", drawNumber $ mkNumber font x)) [0..9] ++
               map (\x -> ("score-"   ++ show x ++ ".png", drawNumber $ mkNumber font x)) [0..9] ++
               [ ("score-percent.png", drawNumber $ mkChar font "%" )
               , ("score-x.png",       drawNumber $ mkChar font "×" ) ]

numbersHD font = map (\x -> ("default-" ++ show x ++ "@2x.png", drawNumberHD $ mkNumberHD font x)) [0..9] ++
                 map (\x -> ("score-"   ++ show x ++ "@2x.png", drawNumberHD $ mkNumberHD font x)) [0..9] ++
                 [ ("score-percent@2x.png", drawNumberHD $ mkCharHD font "%" )
                 , ("score-x@2x.png",       drawNumberHD $ mkCharHD font "×" ) ]
