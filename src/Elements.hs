module Elements
    (mkSkinElements)
    where

import           Codec.Picture                      (PixelRGBA8 (..))
import           Elements.Numbers
import           Elements.Standard.ApproachCircle
import           Elements.Standard.Followpoint
import           Elements.Standard.HitCircle
import           Elements.Standard.HitCircleOverlay
import           Elements.Standard.ReverseArrow
import           Elements.UI.Cursor
import           Elements.UI.MenuSnow
import           Graphics.Rasterific
import           Graphics.Rasterific.Texture

transparent = PixelRGBA8 255 255 255 0

renderSquare size img = renderDrawing
        size
        size
        transparent
        img

renderSquare' size img = renderSquare (truncate size) img

approachCircle = renderSquare'
    approachCircleSize
    approachCircleImg

approachCircleHD = renderSquare'
    approachCircleSizeHD
    approachCircleImgHD

hitCircle = renderSquare'
    hitCircleSize
    hitCircleImg

hitCircleHD = renderSquare'
    hitCircleSizeHD
    hitCircleImgHD

hitCircleOverlay = renderSquare'
    hitCircleOverlaySize
    hitCircleOverlayImg

hitCircleOverlayHD = renderSquare'
    hitCircleOverlaySizeHD
    hitCircleOverlayImgHD

menuSnow font = renderSquare
    menuSnowSize
    (menuSnowImg font)

menuSnowHD font = renderSquare
    menuSnowSizeHD
    (menuSnowImgHD font)

cursor = renderSquare'
    cursorSize
    cursorImg

cursorHD = renderSquare'
    cursorSizeHD
    cursorImgHD

followpoint = renderSquare'
        followpointSize
        followpointImg

followpointHD = renderSquare'
    followpointSizeHD
    followpointImgHD

reverseArrow = renderSquare'
    reverseArrowSize
    reverseArrowImg

reverseArrowHD = renderSquare'
    reverseArrowSizeHD
    reverseArrowImgHD

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
    , ("followpoint@2x.png",      followpointHD)
    , ("reversearrow.png",        reverseArrow)
    , ("reversearrow@2x.png",      reverseArrowHD)
    ] ++ (numbers font)
      ++ (numbersHD font)
      ++ mkEmpty [ "hit300.png"
                 , "hit300@2x.png"
                 , "hit300g.png"
                 , "hit300g@2x.png"
                 , "hit300k.png"
                 , "hit300k@2x.png"
                 , "sliderendcircle.png"
                 , "sliderendcircleoverlay.png"
                 ]
