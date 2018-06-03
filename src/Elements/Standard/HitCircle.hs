module Elements.Standard.HitCircle
    ( hitCircleImg
    , hitCircleSize
    , hitCircleImgHD
    , hitCircleSizeHD
    )
    where

import           Codec.Picture               (PixelRGBA8 (..))
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

hitCircleColor = PixelRGBA8 0xFF 0xFF 0xFF 0x99

hitCircleSize   = 118
hitCircleRadius = (hitCircleSize / 2) - 10
hitCircleCenter = V2 (hitCircleSize/2) (hitCircleSize/2)

hitCircleSizeHD   = hitCircleSize * 2
hitCircleRadiusHD = (hitCircleSizeHD / 2) - 20
hitCircleCenterHD = V2 (hitCircleSizeHD/2) (hitCircleSizeHD/2)

hitCircleImg =
    withTexture (uniformTexture hitCircleColor) $ do
        fill $ circle hitCircleCenter hitCircleRadius

hitCircleImgHD =
    withTexture (uniformTexture hitCircleColor) $ do
        fill $ circle hitCircleCenterHD hitCircleRadiusHD
