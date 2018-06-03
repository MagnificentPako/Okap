module Elements
    (mkSkinElements)
    where

import           Codec.Picture                      (PixelRGBA8 (..))
import           Elements.Numbers
import           Elements.Standard.ApproachCircle
import           Elements.Standard.Followpoint
import           Elements.Standard.HitCircle
import           Elements.Standard.HitCircleOverlay
import           Elements.UI.Cursor
import           Elements.UI.MenuSnow
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

transparent = PixelRGBA8 255 255 255 0

approachCircle = renderDrawing
    (truncate approachCircleSize)
    (truncate approachCircleSize)
    transparent
    approachCircleImg

approachCircleHD = renderDrawing
    (truncate approachCircleSizeHD)
    (truncate approachCircleSizeHD)
    transparent
    approachCircleImgHD

hitCircle = renderDrawing
    (truncate hitCircleSize)
    (truncate hitCircleSize)
    transparent
    hitCircleImg

hitCircleHD = renderDrawing
    (truncate hitCircleSizeHD)
    (truncate hitCircleSizeHD)
    transparent
    hitCircleImgHD

hitCircleOverlay = renderDrawing
    (truncate hitCircleOverlaySize)
    (truncate hitCircleOverlaySize)
    transparent
    hitCircleOverlayImg

hitCircleOverlayHD = renderDrawing
    (truncate hitCircleOverlaySizeHD)
    (truncate hitCircleOverlaySizeHD)
    transparent
    hitCircleOverlayImgHD

menuSnow font = renderDrawing
    menuSnowSize
    menuSnowSize
    transparent
    (menuSnowImg font)

menuSnowHD font = renderDrawing
    menuSnowSizeHD
    menuSnowSizeHD
    transparent
    (menuSnowImgHD font)

cursor = renderDrawing
    (truncate cursorSize)
    (truncate cursorSize)
    transparent
    cursorImg

cursorHD = renderDrawing
    (truncate cursorSizeHD)
    (truncate cursorSizeHD)
    transparent
    cursorImgHD

followpoint = renderDrawing
        (truncate followpointSize)
        (truncate followpointSize)
        transparent
        followpointImg

followpointHD = renderDrawing
    (truncate followpointSizeHD)
    (truncate followpointSizeHD)
    transparent
    followpointImgHD

empty = renderDrawing
        1
        1
        transparent
        (withTexture (uniformTexture transparent) $ do
            fill $ circle (V2 1 1) 1)

mkEmpty e = map (\x -> (x, empty)) e

mkSkinElements font =
    [ ("approachcircle.png",      approachCircle)
    , ("approachcircle@2x.png",   approachCircleHD)
    , ("hitcircle.png",           hitCircle)
    , ("hitcircle@2x.png",        hitCircleHD)
    , ("hitcircleoverlay.png",    hitCircleOverlay)
    , ("hitcircleoverlay@2x.png", hitCircleOverlayHD)
    , ("menu-snow.png",           menuSnow font)
    , ("menu-snow@2x.png",        menuSnowHD font)
    , ("cursor.png",              cursor)
    , ("cursor@2x.png",           cursorHD)
    , ("followpoint.png",         followpoint)
    , ("followpoint@2x.png",         followpointHD)
    ] ++ (numbers font)
      ++ (numbersHD font)
      ++ mkEmpty [ "hit300.png"
                 , "hit300@2x.png"
                 , "hit300g.png"
                 , "hit300g@2x.png"
                 , "hit300k.png"
                 , "hit300k@2x.png"
                 , "sliderendcircle.png"
                 ]
