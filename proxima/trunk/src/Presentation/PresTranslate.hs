module Presentation.PresTranslate where

import Common.CommonTypes
import Presentation.PresLayerTypes

import Presentation.PresLayerUtils

import Presentation.PresentationParsing hiding (parse, parseIO)

--translateIO :: LayerStatePres -> low -> high -> editLow -> IO (editHigh, state, low)
translateIO :: (DocNode node, Ord token, Show token, Show enr) =>
               ParseSheet doc enr node clip token -> LayerStatePres ->PresentationLevel doc node clip token ->
               EnrichedDocLevel enr doc -> EditPresentation documentLevel doc node clip token ->
               IO (EditEnrichedDoc documentLevel enr doc, LayerStatePres, PresentationLevel doc node clip token)
translateIO parseSheet state low high editLow =
  do { (editHigh, state', low') <- parseIO parseSheet state low high editLow
--     ; debugLnIO Prs $ "Edit Enr:"++show editHigh
     ; return (editHigh, state', low')
     }


-- split in monadic and non-monadic part
parseIO :: (DocNode node, Ord token, Show token, Show enr) =>
           ParseSheet doc enr node clip token -> LayerStatePres -> PresentationLevel doc node clip token ->
           EnrichedDocLevel enr doc -> EditPresentation documentLevel doc node clip token ->
           IO (EditEnrichedDoc documentLevel enr doc, LayerStatePres, PresentationLevel doc node clip token)

-- these need not be monadic anymore:
parseIO _ state presLvl enrLvl                  (OpenFilePres fpth) = return (OpenFileEnr fpth, state, presLvl)
parseIO _ state presLvl enrLvl                  (SaveFilePres fpth) = return (SaveFileEnr fpth, state, presLvl)
parseIO _ state presLvl enrLvl                  InitPres            = return (InitEnr,          state, presLvl)
parseIO parseSheet state presLvl enrLvl                  event               = return $ parse parseSheet state presLvl enrLvl event


parse :: (DocNode node, Ord token, Show token, Show enr) =>
         ParseSheet doc enr node clip token -> LayerStatePres -> PresentationLevel doc node clip token ->
         EnrichedDocLevel enr doc -> EditPresentation documentLevel doc node clip token ->
         (EditEnrichedDoc documentLevel enr doc, LayerStatePres, PresentationLevel doc node clip token)

parse parseSheet state _       enrLvl (SetPres presLvl@(PresentationLevel pres layout))  = 
  editParse parseSheet state presLvl enrLvl
--  ( SkipDoc 0, state
--  , PresentationLevel (markUnparsed pres) layout)  -- this goes wrong, presentation focus is not used

parse _ state presLvl enrLvl (SkipPres i) = (SkipEnr (i+1), state, presLvl)
--can't normalize here because there is no focus. Maybe normalize without focus. 
--parse state presLvl enrLvl NormalizePres = setUpd AllUpdated $ editNormalize state presLvl enr 
parse parseSheet state presLvl enrLvl TestPres      = editParse parseSheet state presLvl enrLvl
{-parse state presLvl enrLvl Test2Pres   = setUpd AllUpdated $editReadFile state presLvl enr focus 
--parse state presLvl enrLvl (MouseDownPres path ms i) = setUpd AllUpdated $ editMouseDown state presLvl enr path -- Helium
parse state presLvl enr (DocumentLoadedPres str) =  setUpd AllUpdated $ setDocument state presLvl enr str
-- to allow presenter mouse handle: change GestureInterpreter, so the event is handled there
-}

parse _ state presLvl enrLvl (NavPathDocPres path) = (NavPathDocEnr path, state, presLvl)
parse _ state presLvl enrLvl NavUpDocPres = (NavUpDocEnr, state, presLvl)
parse _ state presLvl enrLvl NavDownDocPres = (NavDownDocEnr, state, presLvl)
parse _ state presLvl enrLvl NavLeftDocPres = (NavLeftDocEnr, state, presLvl)
parse _ state presLvl enrLvl NavRightDocPres = (NavRightDocEnr, state, presLvl)
parse _ state presLvl enrLvl CutDocPres    = (CutDocEnr, state, presLvl)
parse _ state presLvl enrLvl CopyDocPres   = (CopyDocEnr, state, presLvl)
parse _ state presLvl enrLvl PasteDocPres  = (PasteDocEnr, state, presLvl)
parse _ state presLvl enrLvl DeleteDocPres = (DeleteDocEnr, state, presLvl)
parse _ state presLvl enrLvl (UpdateDocPres upd) = (UpdateDocEnr upd, state, presLvl)
parse _ state presLvl enrLvl Test2Pres     = (EvaluateDocEnr, state, presLvl)
parse _ state presLvl enrLvl _            = (SkipEnr 0, state, presLvl)


{-
-- edit ops need to be consistent, when navigating with non-empty focus, collapse focus
-- when inserting with non-empty focus, first delete

-- edit ops that actually change the presentation tree should be a separate type because now we have multiple 
-- functions or lose type safety  (?)


-- enr and/or presentation need some way to say whether document parts are parsed. Now With nodes pile up on the 
-- unparsed presentation.




-- if focus is valid, apply editF to the presentation, and try to reparse the presentation 
--editPres :: 
--            Presentation -> Presentation -> Document -> FocusPres -> (EditDocument, Presentation, Presentation)


-}
    -- parse and type check  (reuse old enrdocument focus)
editParse :: (DocNode node, Ord token, Show token, Show enr) =>
             ParseSheet doc enr node clip token -> LayerStatePres -> PresentationLevel doc node clip token ->
             EnrichedDocLevel enr doc ->
             (EditEnrichedDoc documentLevel enr doc, LayerStatePres, PresentationLevel doc node clip token)
editParse parseSheet state presLvl@(PresentationLevel pres layout) (EnrichedDocLevel _ oldFocus doc) = 
  case parsePres parseSheet pres of
     Nothing   -> (SkipEnr 0, state, PresentationLevel (markUnparsed pres) layout)
     Just enr' -> (SetEnr (EnrichedDocLevel enr' oldFocus doc), state, presLvl)


