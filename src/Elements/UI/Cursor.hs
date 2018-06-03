module Elements.UI.Cursor
    ( cursorImg
    , cursorSize
    , cursorImgHD
    , cursorSizeHD
    )
    where

import           Codec.Picture               (PixelRGBA8 (..))
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

cursorColor = PixelRGBA8 0xFF 0xFF 0xFF 0xFF
dashColor   = PixelRGBA8 186 104 200 0xFF

strokeWidth  = 10
cursorSize   = 54
cursorRadius = cursorSize / 2
innerRadius  = cursorRadius - 15

strokeWidthHD = strokeWidth * 2
cursorSizeHD   = cursorSize * 2
cursorRadiusHD = cursorSizeHD / 2
innerRadiusHD = cursorRadiusHD - 25

cursorImg =
    withTexture (uniformTexture cursorColor) $ do
        stroke strokeWidth JoinRound (CapRound, CapRound) $
            circle (V2 cursorRadius cursorRadius) (cursorRadius-(strokeWidth/2))
        withTexture (uniformTexture dashColor) $ do
            dashedStroke [6] 3 JoinRound (CapRound, CapRound) $
                circle (V2 cursorRadius cursorRadius) innerRadius
        fill $
            circle (V2 cursorRadius cursorRadius) 5

cursorImgHD =
    withTexture (uniformTexture cursorColor) $ do
        stroke strokeWidth JoinRound (CapRound, CapRound) $
            circle (V2 cursorRadiusHD cursorRadiusHD) (cursorRadiusHD-(strokeWidthHD/2))
        withTexture (uniformTexture dashColor) $ do
            dashedStroke [18] 8 JoinRound (CapRound, CapRound) $
                circle (V2 cursorRadiusHD cursorRadiusHD) innerRadiusHD
        fill $
            circle (V2 cursorRadiusHD cursorRadiusHD) 15
