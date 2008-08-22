module Arrangement.Arranger where

import Common.CommonTypes hiding (defaultFont)
import Common.CommonUtils
import qualified Common.CommonTypes as CommonTypes
import Arrangement.ArrLayerTypes
import Arrangement.ArrLayerUtils

import Arrangement.ArrangerAG
import Arrangement.FontLib
{-import Arrangement.ArrLayerTypes
import Arrangement.ArrLayerUtils

import Arrangement.ArrangerAG
import Arrangement.FontLib-}
import Data.IORef
import System.IO

import qualified Data.Map as Map
import Data.Map (Map)

defaultBackColor = transparent
defaultFillColor = white
defaultLineColor = black
defaultTextColor = black
defaultFont = CommonTypes.defaultFont

arrangePresentation :: (Show node, Show token) => Settings ->
                       LocalStateArr -> FontMetricsRef -> FocusPres -> Arrangement node ->
                       DiffTree -> Layout doc node clip token -> IO (Arrangement node, LocalStateArr)
arrangePresentation settings state fontMetricsRef focus oldArrangement dt pres =

 do { viewedArea <- readIORef $ getViewedAreaRef state
    ; let oldViewedArea = getLastViewedArea state
          state' = state { getLastViewedArea = viewedArea }
--          prunedPres = prunePres viewedArea lastViewedArea (0,0) dt oldArrangement pres -- old prune

          prunedPres = if arrangerIncrementality settings 
                       then prunePresentation viewedArea oldViewedArea dt pres  -- uncomment this line for incremental arrangement
                       else prunePresentation viewedArea oldViewedArea (DiffLeaf False) pres -- and this one for non-incremental
          
--    ; debugLnIO Err $ "Viewed area: "++show viewedArea ++ " last viewed area: "++show oldViewedArea
--    ; debugLnIO Err ("Diff tree"++show dt)
--    ; debugLnIO Err ("Presentation"++show pres)
--    ; debugLnIO Err ("Pruned Presentation"++show prunedPres)
--    ; debugLnIO Arr ("Old arrangement "++ show oldArrangement)
    
    ; (attrTree, idCounter', maxFDepth) <- fixed settings fontMetricsRef (getIDACounter state') focus prunedPres pres viewedArea oldViewedArea oldArrangement
    ; let state'' = state' { getIDACounter = idCounter' }
    ; when (maxFDepth > 1) $
        debugLnIO Err "Nested formatters may be arranged incorrectly"
    ; return (attrTree, state'')
    }

fixed :: (Show node, Show token) => Settings -> FontMetricsRef -> Int -> FocusPres -> Layout doc node clip token -> Layout doc node clip token -> Rectangle -> Rectangle -> 
         Arrangement node -> IO (Arrangement node, Int, Int)
fixed settings fontMetricsRef idACounter focus (pres :: Layout doc node clip token) (unprunedPres :: Layout doc node clip token) viewedArea oldViewedArea oldArrangement = 
 mdo { (fontMetrics,arrangement, idACounter', maxFDepth) <- f (fontMetrics,arrangement, idACounter, maxFDepth)
    ; return (arrangement, idACounter', maxFDepth)
    }
 where f :: (FontMetrics, Arrangement node, Int, Int) ->
            IO (FontMetrics, Arrangement node, Int, Int) -- doc and node are scoped type variables
       f (fontMetrics,_, _, _) = 
         do { let (allFonts, arrangement, idACounter', maxFDepth,_) = -- _ is the self attribute
                    sem_Root (Root pres) [defaultFont]
                                               defaultBackColor defaultFillColor
                                               focus
                                               defaultFont 
                                               fontMetrics
                                               idACounter
                                               defaultLineColor
                                               Nothing  -- mouseDown : Maybe (UpdateDoc doc clip)
                                               (Just oldArrangement)
                                               oldViewedArea
                                               defaultTextColor
                                               unprunedPres
                                               viewedArea
               
            ; let usedFonts = nub allFonts
-- When implementing cleanup of unused fonts (might not be necessary), note that pruned presentations
-- may yield incomplete list of fonts

--            ; debugLnIO Arr ("The fonts are:"++show usedFonts)
            ; queriedMetrics <- readIORef fontMetricsRef
            
            ; let queriedFonts = Map.keys queriedMetrics
            ; let newFonts =  deleteFirstsBy (==) usedFonts queriedFonts -- usedFonts was nubbed
{-
            ; debugLnIO Arr $ "used: "           ++ show usedFonts
            ; debugLnIO Arr $ "already queried: "++ show queriedFonts
            ; debugLnIO Arr $ "new:             "++ show newFonts
-}
            ; newMetrics <- mkFontMetrics settings newFonts
            ; let updatedMetrics = newMetrics `Map.union` queriedMetrics
            ; writeIORef fontMetricsRef updatedMetrics            
            ; return (updatedMetrics, arrangement, idACounter', maxFDepth)
            }
            
