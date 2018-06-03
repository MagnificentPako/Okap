module Elements.Standard.ReverseArrow
    ( reverseArrowImg
    , reverseArrowSize
    , reverseArrowImgHD
    , reverseArrowSizeHD
    )
    where

import           Codec.Picture               (PixelRGBA8 (..))
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

drawColor               = PixelRGBA8 255 87 34 0xFF
reverseArrowSize         = 118
imageCenter             = (V2 (reverseArrowSize/2) (reverseArrowSize/2))
circleRadius            = (reverseArrowSize/2)

reverseArrowSizeHD      = reverseArrowSize * 2
imageCenterHD           = (V2 (reverseArrowSizeHD/2) (reverseArrowSizeHD/2))
circleRadiusHD          = (reverseArrowSizeHD/2)

reverseArrowImg =
    withTexture (uniformTexture drawColor) $ do
        fill $
            circle imageCenter circleRadius

reverseArrowImgHD =
    withTexture (uniformTexture drawColor) $ do
        fill $
            circle imageCenterHD circleRadiusHD
