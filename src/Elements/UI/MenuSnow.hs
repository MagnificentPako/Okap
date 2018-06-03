module Elements.UI.MenuSnow
    ( menuSnowImg
    , menuSnowSize
    , menuSnowImgHD
    , menuSnowSizeHD
    )
    where

import           Codec.Picture               (PixelRGBA8 (..))
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

menuSnowColor = PixelRGBA8 0xFF 0xFF 0xFF 0xFF

menuSnowSize   = 32 :: Int
menuSnowSizeHD   = menuSnowSize * 2

menuSnowImg font =
    withTexture (uniformTexture menuSnowColor) $ do
        printTextAt font (PointSize 32) (V2 3 32) "λ"

menuSnowImgHD font =
    withTexture (uniformTexture menuSnowColor) $ do
        printTextAt font (PointSize 62) (V2 8 64) "λ"
