module Elements.Standard.Followpoint
    ( followpointImg
    , followpointSize
    , followpointImgHD
    , followpointSizeHD
    )
    where

import           Codec.Picture               (PixelRGBA8 (..))
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

drawColor               = PixelRGBA8 0xFF 0xFF 0xFF 0xFF
strokeWidth             = 4
followpointSize         = 32
imageCenter             = (V2 (followpointSize/2) (followpointSize/2))
circleRadius            = (followpointSize/2) - strokeWidth

strokeWidthHD           = strokeWidth * 2
followpointSizeHD       = followpointSize * 2
imageCenterHD           = (V2 (followpointSizeHD/2) (followpointSizeHD/2))
circleRadiusHD          = (followpointSizeHD/2) - strokeWidthHD

followpointImg =
    withTexture (uniformTexture drawColor) $ do
        stroke strokeWidth JoinRound (CapRound, CapRound) $
            circle imageCenter circleRadius

followpointImgHD =
    withTexture (uniformTexture drawColor) $ do
        stroke strokeWidthHD JoinRound (CapRound, CapRound) $
            circle imageCenterHD circleRadiusHD
