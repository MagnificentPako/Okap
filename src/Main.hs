module Main where

import           Codec.Picture          (PixelRGBA8 (..), writePng)
import           Control.Monad          (forM_)
import qualified Data.Text.IO           (writeFile)
import           Elements
import           Graphics.Text.TrueType (loadFontFile)
import           SkinIni

for = flip map
main :: IO ()
main = do
    Data.Text.IO.writeFile "Okap/skin.ini" ini

    font' <- loadFontFile "font.ttf"
    case font' of
        Left err   -> print err
        Right font ->
            forM_ (mkSkinElements font) $ \(sPath,sElem) ->
                writePng ("Okap/" ++ sPath) sElem
