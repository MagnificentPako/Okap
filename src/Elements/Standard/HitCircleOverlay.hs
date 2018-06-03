module Elements.Standard.HitCircleOverlay
    ( hitCircleOverlayImg
    , hitCircleOverlaySize
    , hitCircleOverlayImgHD
    , hitCircleOverlaySizeHD
    )
    where

import           Codec.Picture               (PixelRGBA8 (..))
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

hitCircleOverlayBorderColor = PixelRGBA8 0xFF 0xFF 0xFF 0xFF

strokeWidth            = 15
hitCircleOverlaySize   = 118
hitCircleOverlayRadius = (hitCircleOverlaySize / 2) - (strokeWidth / 2)
hitCircleOverlayCenter = V2 (hitCircleOverlaySize / 2) (hitCircleOverlaySize / 2)
innerRadius            = 15

strokeWidthHD            = strokeWidth * 2
hitCircleOverlaySizeHD   = hitCircleOverlaySize * 2
hitCircleOverlayRadiusHD = (hitCircleOverlaySizeHD / 2) - (strokeWidthHD / 2)
hitCircleOverlayCenterHD = V2 (hitCircleOverlaySizeHD / 2) (hitCircleOverlaySizeHD / 2)
innerRadiusHD            = innerRadius * 2

hitCircleOverlayImg =
    withTexture (uniformTexture hitCircleOverlayBorderColor) $ do
        stroke strokeWidth JoinRound (CapRound, CapRound) $
            circle hitCircleOverlayCenter hitCircleOverlayRadius


hitCircleOverlayImgHD =
    withTexture (uniformTexture hitCircleOverlayBorderColor) $ do
        stroke strokeWidthHD JoinRound (CapRound, CapRound) $
            circle hitCircleOverlayCenterHD hitCircleOverlayRadiusHD
