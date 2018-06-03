module Elements.Standard.ApproachCircle
    ( approachCircleImg
    , approachCircleSize
    , approachCircleImgHD
    , approachCircleSizeHD
    )
    where

import           Codec.Picture               (PixelRGBA8 (..))
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

drawColor               = PixelRGBA8 0xFF 0xFF 0xFF 0xFF
strokeWidth             = 4
approachCircleSize      = 126
imageCenter             = (V2 (approachCircleSize/2) (approachCircleSize/2))
circleRadius            = (approachCircleSize/2) - strokeWidth

strokeWidthHD           = strokeWidth * 2
approachCircleSizeHD    = approachCircleSize*2
imageCenterHD           = (V2 (approachCircleSizeHD/2) (approachCircleSizeHD/2))
circleRadiusHD          = (approachCircleSizeHD/2) - strokeWidthHD

approachCircleImg =
    withTexture (uniformTexture drawColor) $ do
        stroke strokeWidth JoinRound (CapRound, CapRound) $
            circle imageCenter circleRadius

approachCircleImgHD =
    withTexture (uniformTexture drawColor) $ do
        stroke strokeWidthHD JoinRound (CapRound, CapRound) $
            circle imageCenterHD circleRadiusHD
