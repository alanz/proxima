module ProxParser_Generated where

import Common.CommonTypes hiding (Dirty (..))
import Presentation.PresLayerTypes hiding (Edge)
import Presentation.PresLayerUtils
import Presentation.PresentationParsing
import Evaluation.DocumentEdit
import DocumentEdit_Generated
import Evaluation.DocTypes
import DocTypes_Generated
import DocUtils_Generated

----- GENERATED PART STARTS HERE. DO NOT EDIT ON OR BEYOND THIS LINE -----

--------------------------------------------------------------------------
-- Construct instance                                                   --
--------------------------------------------------------------------------

instance Construct Document Node ClipDoc UserToken where
  construct NoNode = error $ "ProxParser_Generated.construct not defined on NoNode"
  construct (Node_RootEnr _ _) = construct_RootEnr
  construct (Node_HoleEnrichedDoc _ _) = construct_HoleEnrichedDoc
  construct (Node_ParseErrEnrichedDoc _ _) = construct_ParseErrEnrichedDoc
  construct (Node_RootDoc _ _) = construct_RootDoc
  construct (Node_HoleDocument _ _) = construct_HoleDocument
  construct (Node_ParseErrDocument _ _) = construct_ParseErrDocument
  construct (Node_Root _ _) = construct_Root
  construct (Node_HoleRoot _ _) = construct_HoleRoot
  construct (Node_ParseErrRoot _ _) = construct_ParseErrRoot
  construct (Node_Section _ _) = construct_Section
  construct (Node_HoleSection _ _) = construct_HoleSection
  construct (Node_ParseErrSection _ _) = construct_ParseErrSection
  construct (Node_Subsection _ _) = construct_Subsection
  construct (Node_HoleSubsection _ _) = construct_HoleSubsection
  construct (Node_ParseErrSubsection _ _) = construct_ParseErrSubsection
  construct (Node_Subsubsection _ _) = construct_Subsubsection
  construct (Node_HoleSubsubsection _ _) = construct_HoleSubsubsection
  construct (Node_ParseErrSubsubsection _ _) = construct_ParseErrSubsubsection
  construct (Node_Paragraph _ _) = construct_Paragraph
  construct (Node_SubgraphPara _ _) = construct_SubgraphPara
  construct (Node_HoleParagraph _ _) = construct_HoleParagraph
  construct (Node_ParseErrParagraph _ _) = construct_ParseErrParagraph
  construct (Node_Word _ _) = construct_Word
  construct (Node_NodeRef _ _) = construct_NodeRef
  construct (Node_Label _ _) = construct_Label
  construct (Node_LabelRef _ _) = construct_LabelRef
  construct (Node_HoleWord _ _) = construct_HoleWord
  construct (Node_ParseErrWord _ _) = construct_ParseErrWord
  construct (Node_Graph _ _) = construct_Graph
  construct (Node_HoleGraph _ _) = construct_HoleGraph
  construct (Node_ParseErrGraph _ _) = construct_ParseErrGraph
  construct (Node_Vertex _ _) = construct_Vertex
  construct (Node_HoleVertex _ _) = construct_HoleVertex
  construct (Node_ParseErrVertex _ _) = construct_ParseErrVertex
  construct (Node_Circle _ _) = construct_Circle
  construct (Node_Square _ _) = construct_Square
  construct (Node_HoleShape _ _) = construct_HoleShape
  construct (Node_ParseErrShape _ _) = construct_ParseErrShape
  construct (Node_Edge _ _) = construct_Edge
  construct (Node_HoleEdge _ _) = construct_HoleEdge
  construct (Node_ParseErrEdge _ _) = construct_ParseErrEdge
  construct (Node_Subgraph _ _) = construct_Subgraph
  construct (Node_HoleSubgraph _ _) = construct_HoleSubgraph
  construct (Node_ParseErrSubgraph _ _) = construct_ParseErrSubgraph
  construct (Node_Dirty _ _) = construct_Dirty
  construct (Node_Clean _ _) = construct_Clean
  construct (Node_HoleDirty _ _) = construct_HoleDirty
  construct (Node_ParseErrDirty _ _) = construct_ParseErrDirty
  construct (Node_List_Section _ _) = construct_List_Section
  construct (Node_HoleList_Section _ _) = construct_HoleList_Section
  construct (Node_ParseErrList_Section _ _) = construct_ParseErrList_Section
  construct (Node_List_Paragraph _ _) = construct_List_Paragraph
  construct (Node_HoleList_Paragraph _ _) = construct_HoleList_Paragraph
  construct (Node_ParseErrList_Paragraph _ _) = construct_ParseErrList_Paragraph
  construct (Node_List_Subsection _ _) = construct_List_Subsection
  construct (Node_HoleList_Subsection _ _) = construct_HoleList_Subsection
  construct (Node_ParseErrList_Subsection _ _) = construct_ParseErrList_Subsection
  construct (Node_List_Subsubsection _ _) = construct_List_Subsubsection
  construct (Node_HoleList_Subsubsection _ _) = construct_HoleList_Subsubsection
  construct (Node_ParseErrList_Subsubsection _ _) = construct_ParseErrList_Subsubsection
  construct (Node_List_Word _ _) = construct_List_Word
  construct (Node_HoleList_Word _ _) = construct_HoleList_Word
  construct (Node_ParseErrList_Word _ _) = construct_ParseErrList_Word
  construct (Node_List_Vertex _ _) = construct_List_Vertex
  construct (Node_HoleList_Vertex _ _) = construct_HoleList_Vertex
  construct (Node_ParseErrList_Vertex _ _) = construct_ParseErrList_Vertex
  construct (Node_List_Edge _ _) = construct_List_Edge
  construct (Node_HoleList_Edge _ _) = construct_HoleList_Edge
  construct (Node_ParseErrList_Edge _ _) = construct_ParseErrList_Edge
construct_RootEnr tk ~[mClip0] = Clip_EnrichedDoc $ reuseRootEnr [tk]  (retrieveArg "RootEnr" "root::Root" mClip0)
construct_HoleEnrichedDoc tk ~[] = Clip_EnrichedDoc $ hole
construct_ParseErrEnrichedDoc (StructuralTk _ _ pres _ _) ~[] = Clip_EnrichedDoc $ parseErr (StructuralParseErr pres)
construct_RootDoc tk ~[mClip0] = Clip_Document $ reuseRootDoc [tk]  (retrieveArg "RootDoc" "root::Root" mClip0)
construct_HoleDocument tk ~[] = Clip_Document $ hole
construct_ParseErrDocument (StructuralTk _ _ pres _ _) ~[] = Clip_Document $ parseErr (StructuralParseErr pres)
construct_Root tk ~[mClip0,mClip1,mClip2] = Clip_Root $ reuseRoot [tk]  (retrieveArg "Root" "graph::Graph" mClip0) (retrieveArg "Root" "title::String" mClip1) (retrieveArg "Root" "sections::List_Section" mClip2)
construct_HoleRoot tk ~[] = Clip_Root $ hole
construct_ParseErrRoot (StructuralTk _ _ pres _ _) ~[] = Clip_Root $ parseErr (StructuralParseErr pres)
construct_Section tk ~[mClip0,mClip1,mClip2] = Clip_Section $ reuseSection [tk]  (retrieveArg "Section" "title::String" mClip0) (retrieveArg "Section" "paragraphs::List_Paragraph" mClip1) (retrieveArg "Section" "subsections::List_Subsection" mClip2)
construct_HoleSection tk ~[] = Clip_Section $ hole
construct_ParseErrSection (StructuralTk _ _ pres _ _) ~[] = Clip_Section $ parseErr (StructuralParseErr pres)
construct_Subsection tk ~[mClip0,mClip1,mClip2] = Clip_Subsection $ reuseSubsection [tk]  (retrieveArg "Subsection" "title::String" mClip0) (retrieveArg "Subsection" "paragraphs::List_Paragraph" mClip1) (retrieveArg "Subsection" "subsubsections::List_Subsubsection" mClip2)
construct_HoleSubsection tk ~[] = Clip_Subsection $ hole
construct_ParseErrSubsection (StructuralTk _ _ pres _ _) ~[] = Clip_Subsection $ parseErr (StructuralParseErr pres)
construct_Subsubsection tk ~[mClip0,mClip1] = Clip_Subsubsection $ reuseSubsubsection [tk]  (retrieveArg "Subsubsection" "title::String" mClip0) (retrieveArg "Subsubsection" "paragraphs::List_Paragraph" mClip1)
construct_HoleSubsubsection tk ~[] = Clip_Subsubsection $ hole
construct_ParseErrSubsubsection (StructuralTk _ _ pres _ _) ~[] = Clip_Subsubsection $ parseErr (StructuralParseErr pres)
construct_Paragraph tk ~[mClip0] = Clip_Paragraph $ reuseParagraph [tk]  (retrieveArg "Paragraph" "words::List_Word" mClip0)
construct_SubgraphPara tk ~[mClip0] = Clip_Paragraph $ reuseSubgraphPara [tk]  (retrieveArg "SubgraphPara" "subgraph::Subgraph" mClip0)
construct_HoleParagraph tk ~[] = Clip_Paragraph $ hole
construct_ParseErrParagraph (StructuralTk _ _ pres _ _) ~[] = Clip_Paragraph $ parseErr (StructuralParseErr pres)
construct_Word tk ~[mClip0] = Clip_Word $ reuseWord [tk]  (retrieveArg "Word" "word::String" mClip0)
construct_NodeRef tk ~[mClip0] = Clip_Word $ reuseNodeRef [tk]  (retrieveArg "NodeRef" "nodeName::String" mClip0)
construct_Label tk ~[mClip0] = Clip_Word $ reuseLabel [tk]  (retrieveArg "Label" "label::String" mClip0)
construct_LabelRef tk ~[mClip0] = Clip_Word $ reuseLabelRef [tk]  (retrieveArg "LabelRef" "label::String" mClip0)
construct_HoleWord tk ~[] = Clip_Word $ hole
construct_ParseErrWord (StructuralTk _ _ pres _ _) ~[] = Clip_Word $ parseErr (StructuralParseErr pres)
construct_Graph tk ~[mClip0,mClip1,mClip2] = Clip_Graph $ reuseGraph [tk]  (retrieveArg "Graph" "dirty::Dirty" mClip0) (retrieveArg "Graph" "vertices::List_Vertex" mClip1) (retrieveArg "Graph" "edges::List_Edge" mClip2)
construct_HoleGraph tk ~[] = Clip_Graph $ hole
construct_ParseErrGraph (StructuralTk _ _ pres _ _) ~[] = Clip_Graph $ parseErr (StructuralParseErr pres)
construct_Vertex tk ~[mClip0,mClip1,mClip2,mClip3,mClip4] = Clip_Vertex $ reuseVertex [tk]  (retrieveArg "Vertex" "name::String" mClip0) (retrieveArg "Vertex" "shape::Shape" mClip1) (retrieveArg "Vertex" "id::Int" mClip2) (retrieveArg "Vertex" "x::Int" mClip3) (retrieveArg "Vertex" "y::Int" mClip4)
construct_HoleVertex tk ~[] = Clip_Vertex $ hole
construct_ParseErrVertex (StructuralTk _ _ pres _ _) ~[] = Clip_Vertex $ parseErr (StructuralParseErr pres)
construct_Circle tk ~[] = Clip_Shape $ reuseCircle [tk] 
construct_Square tk ~[] = Clip_Shape $ reuseSquare [tk] 
construct_HoleShape tk ~[] = Clip_Shape $ hole
construct_ParseErrShape (StructuralTk _ _ pres _ _) ~[] = Clip_Shape $ parseErr (StructuralParseErr pres)
construct_Edge tk ~[mClip0,mClip1] = Clip_Edge $ reuseEdge [tk]  (retrieveArg "Edge" "from::Int" mClip0) (retrieveArg "Edge" "to::Int" mClip1)
construct_HoleEdge tk ~[] = Clip_Edge $ hole
construct_ParseErrEdge (StructuralTk _ _ pres _ _) ~[] = Clip_Edge $ parseErr (StructuralParseErr pres)
construct_Subgraph tk ~[mClip0,mClip1,mClip2] = Clip_Subgraph $ reuseSubgraph [tk]  (retrieveArg "Subgraph" "dirty::Dirty" mClip0) (retrieveArg "Subgraph" "vertices::List_Vertex" mClip1) (retrieveArg "Subgraph" "edges::List_Edge" mClip2)
construct_HoleSubgraph tk ~[] = Clip_Subgraph $ hole
construct_ParseErrSubgraph (StructuralTk _ _ pres _ _) ~[] = Clip_Subgraph $ parseErr (StructuralParseErr pres)
construct_Dirty tk ~[] = Clip_Dirty $ reuseDirty [tk] 
construct_Clean tk ~[] = Clip_Dirty $ reuseClean [tk] 
construct_HoleDirty tk ~[] = Clip_Dirty $ hole
construct_ParseErrDirty (StructuralTk _ _ pres _ _) ~[] = Clip_Dirty $ parseErr (StructuralParseErr pres)
construct_List_Section tk mClips = genericConstruct_List "Section" toList_Section mClips
construct_HoleList_Section tk ~[] = Clip_List_Section $ hole
construct_ParseErrList_Section (StructuralTk _ _ pres _ _) ~[] = Clip_List_Section $ parseErr (StructuralParseErr pres)
construct_List_Paragraph tk mClips = genericConstruct_List "Paragraph" toList_Paragraph mClips
construct_HoleList_Paragraph tk ~[] = Clip_List_Paragraph $ hole
construct_ParseErrList_Paragraph (StructuralTk _ _ pres _ _) ~[] = Clip_List_Paragraph $ parseErr (StructuralParseErr pres)
construct_List_Subsection tk mClips = genericConstruct_List "Subsection" toList_Subsection mClips
construct_HoleList_Subsection tk ~[] = Clip_List_Subsection $ hole
construct_ParseErrList_Subsection (StructuralTk _ _ pres _ _) ~[] = Clip_List_Subsection $ parseErr (StructuralParseErr pres)
construct_List_Subsubsection tk mClips = genericConstruct_List "Subsubsection" toList_Subsubsection mClips
construct_HoleList_Subsubsection tk ~[] = Clip_List_Subsubsection $ hole
construct_ParseErrList_Subsubsection (StructuralTk _ _ pres _ _) ~[] = Clip_List_Subsubsection $ parseErr (StructuralParseErr pres)
construct_List_Word tk mClips = genericConstruct_List "Word" toList_Word mClips
construct_HoleList_Word tk ~[] = Clip_List_Word $ hole
construct_ParseErrList_Word (StructuralTk _ _ pres _ _) ~[] = Clip_List_Word $ parseErr (StructuralParseErr pres)
construct_List_Vertex tk mClips = genericConstruct_List "Vertex" toList_Vertex mClips
construct_HoleList_Vertex tk ~[] = Clip_List_Vertex $ hole
construct_ParseErrList_Vertex (StructuralTk _ _ pres _ _) ~[] = Clip_List_Vertex $ parseErr (StructuralParseErr pres)
construct_List_Edge tk mClips = genericConstruct_List "Edge" toList_Edge mClips
construct_HoleList_Edge tk ~[] = Clip_List_Edge $ hole
construct_ParseErrList_Edge (StructuralTk _ _ pres _ _) ~[] = Clip_List_Edge $ parseErr (StructuralParseErr pres)



--------------------------------------------------------------------------
-- reuse functions                                                      --
--------------------------------------------------------------------------

reuseRootEnr :: [Token doc Node clip token] -> Maybe Root -> EnrichedDoc
reuseRootEnr nodes ma0
  = case extractFromTokens extractRootEnr defaultRootEnr nodes of
           (RootEnr a0) -> genericReuse1 RootEnr a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseRootEnr"

reuseRootDoc :: [Token doc Node clip token] -> Maybe Root -> Document
reuseRootDoc nodes ma0
  = case extractFromTokens extractRootDoc defaultRootDoc nodes of
           (RootDoc a0) -> genericReuse1 RootDoc a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseRootDoc"

reuseRoot :: [Token doc Node clip token] -> Maybe Graph -> Maybe String -> Maybe List_Section -> Root
reuseRoot nodes ma0 ma1 ma2
  = case extractFromTokens extractRoot defaultRoot nodes of
           (Root a0 a1 a2) -> genericReuse3 Root a0 a1 a2 ma0 ma1 ma2
           _ -> error "Internal error:ProxParser_Generated.reuseRoot"

reuseSection :: [Token doc Node clip token] -> Maybe String -> Maybe List_Paragraph -> Maybe List_Subsection -> Section
reuseSection nodes ma0 ma1 ma2
  = case extractFromTokens extractSection defaultSection nodes of
           (Section a0 a1 a2) -> genericReuse3 Section a0 a1 a2 ma0 ma1 ma2
           _ -> error "Internal error:ProxParser_Generated.reuseSection"

reuseSubsection :: [Token doc Node clip token] -> Maybe String -> Maybe List_Paragraph -> Maybe List_Subsubsection -> Subsection
reuseSubsection nodes ma0 ma1 ma2
  = case extractFromTokens extractSubsection defaultSubsection nodes of
           (Subsection a0 a1 a2) -> genericReuse3 Subsection a0 a1 a2 ma0 ma1 ma2
           _ -> error "Internal error:ProxParser_Generated.reuseSubsection"

reuseSubsubsection :: [Token doc Node clip token] -> Maybe String -> Maybe List_Paragraph -> Subsubsection
reuseSubsubsection nodes ma0 ma1
  = case extractFromTokens extractSubsubsection defaultSubsubsection nodes of
           (Subsubsection a0 a1) -> genericReuse2 Subsubsection a0 a1 ma0 ma1
           _ -> error "Internal error:ProxParser_Generated.reuseSubsubsection"

reuseParagraph :: [Token doc Node clip token] -> Maybe List_Word -> Paragraph
reuseParagraph nodes ma0
  = case extractFromTokens extractParagraph defaultParagraph nodes of
           (Paragraph a0) -> genericReuse1 Paragraph a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseParagraph"

reuseSubgraphPara :: [Token doc Node clip token] -> Maybe Subgraph -> Paragraph
reuseSubgraphPara nodes ma0
  = case extractFromTokens extractSubgraphPara defaultSubgraphPara nodes of
           (SubgraphPara a0) -> genericReuse1 SubgraphPara a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseSubgraphPara"

reuseWord :: [Token doc Node clip token] -> Maybe String -> Word
reuseWord nodes ma0
  = case extractFromTokens extractWord defaultWord nodes of
           (Word a0) -> genericReuse1 Word a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseWord"

reuseNodeRef :: [Token doc Node clip token] -> Maybe String -> Word
reuseNodeRef nodes ma0
  = case extractFromTokens extractNodeRef defaultNodeRef nodes of
           (NodeRef a0) -> genericReuse1 NodeRef a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseNodeRef"

reuseLabel :: [Token doc Node clip token] -> Maybe String -> Word
reuseLabel nodes ma0
  = case extractFromTokens extractLabel defaultLabel nodes of
           (Label a0) -> genericReuse1 Label a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseLabel"

reuseLabelRef :: [Token doc Node clip token] -> Maybe String -> Word
reuseLabelRef nodes ma0
  = case extractFromTokens extractLabelRef defaultLabelRef nodes of
           (LabelRef a0) -> genericReuse1 LabelRef a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseLabelRef"

reuseGraph :: [Token doc Node clip token] -> Maybe Dirty -> Maybe List_Vertex -> Maybe List_Edge -> Graph
reuseGraph nodes ma0 ma1 ma2
  = case extractFromTokens extractGraph defaultGraph nodes of
           (Graph a0 a1 a2) -> genericReuse3 Graph a0 a1 a2 ma0 ma1 ma2
           _ -> error "Internal error:ProxParser_Generated.reuseGraph"

reuseVertex :: [Token doc Node clip token] -> Maybe String -> Maybe Shape -> Maybe Int -> Maybe Int -> Maybe Int -> Vertex
reuseVertex nodes ma0 ma1 ma2 ma3 ma4
  = case extractFromTokens extractVertex defaultVertex nodes of
           (Vertex a0 a1 a2 a3 a4) -> genericReuse5 Vertex a0 a1 a2 a3 a4 ma0 ma1 ma2 ma3 ma4
           _ -> error "Internal error:ProxParser_Generated.reuseVertex"

reuseCircle :: [Token doc Node clip token] -> Shape
reuseCircle nodes
  = case extractFromTokens extractCircle defaultCircle nodes of
           (Circle) -> genericReuse0 Circle
           _ -> error "Internal error:ProxParser_Generated.reuseCircle"

reuseSquare :: [Token doc Node clip token] -> Shape
reuseSquare nodes
  = case extractFromTokens extractSquare defaultSquare nodes of
           (Square) -> genericReuse0 Square
           _ -> error "Internal error:ProxParser_Generated.reuseSquare"

reuseEdge :: [Token doc Node clip token] -> Maybe Int -> Maybe Int -> Edge
reuseEdge nodes ma0 ma1
  = case extractFromTokens extractEdge defaultEdge nodes of
           (Edge a0 a1) -> genericReuse2 Edge a0 a1 ma0 ma1
           _ -> error "Internal error:ProxParser_Generated.reuseEdge"

reuseSubgraph :: [Token doc Node clip token] -> Maybe Dirty -> Maybe List_Vertex -> Maybe List_Edge -> Subgraph
reuseSubgraph nodes ma0 ma1 ma2
  = case extractFromTokens extractSubgraph defaultSubgraph nodes of
           (Subgraph a0 a1 a2) -> genericReuse3 Subgraph a0 a1 a2 ma0 ma1 ma2
           _ -> error "Internal error:ProxParser_Generated.reuseSubgraph"

reuseDirty :: [Token doc Node clip token] -> Dirty
reuseDirty nodes
  = case extractFromTokens extractDirty defaultDirty nodes of
           (Dirty) -> genericReuse0 Dirty
           _ -> error "Internal error:ProxParser_Generated.reuseDirty"

reuseClean :: [Token doc Node clip token] -> Dirty
reuseClean nodes
  = case extractFromTokens extractClean defaultClean nodes of
           (Clean) -> genericReuse0 Clean
           _ -> error "Internal error:ProxParser_Generated.reuseClean"

reuseList_Section :: [Token doc Node clip token] -> Maybe ConsList_Section -> List_Section
reuseList_Section nodes ma0
  = case extractFromTokens extractList_Section defaultList_Section nodes of
           (List_Section a0) -> genericReuse1 List_Section a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseList_Section"

reuseList_Paragraph :: [Token doc Node clip token] -> Maybe ConsList_Paragraph -> List_Paragraph
reuseList_Paragraph nodes ma0
  = case extractFromTokens extractList_Paragraph defaultList_Paragraph nodes of
           (List_Paragraph a0) -> genericReuse1 List_Paragraph a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseList_Paragraph"

reuseList_Subsection :: [Token doc Node clip token] -> Maybe ConsList_Subsection -> List_Subsection
reuseList_Subsection nodes ma0
  = case extractFromTokens extractList_Subsection defaultList_Subsection nodes of
           (List_Subsection a0) -> genericReuse1 List_Subsection a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseList_Subsection"

reuseList_Subsubsection :: [Token doc Node clip token] -> Maybe ConsList_Subsubsection -> List_Subsubsection
reuseList_Subsubsection nodes ma0
  = case extractFromTokens extractList_Subsubsection defaultList_Subsubsection nodes of
           (List_Subsubsection a0) -> genericReuse1 List_Subsubsection a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseList_Subsubsection"

reuseList_Word :: [Token doc Node clip token] -> Maybe ConsList_Word -> List_Word
reuseList_Word nodes ma0
  = case extractFromTokens extractList_Word defaultList_Word nodes of
           (List_Word a0) -> genericReuse1 List_Word a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseList_Word"

reuseList_Vertex :: [Token doc Node clip token] -> Maybe ConsList_Vertex -> List_Vertex
reuseList_Vertex nodes ma0
  = case extractFromTokens extractList_Vertex defaultList_Vertex nodes of
           (List_Vertex a0) -> genericReuse1 List_Vertex a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseList_Vertex"

reuseList_Edge :: [Token doc Node clip token] -> Maybe ConsList_Edge -> List_Edge
reuseList_Edge nodes ma0
  = case extractFromTokens extractList_Edge defaultList_Edge nodes of
           (List_Edge a0) -> genericReuse1 List_Edge a0 ma0
           _ -> error "Internal error:ProxParser_Generated.reuseList_Edge"




--------------------------------------------------------------------------
-- extract functions                                                    --
--------------------------------------------------------------------------

extractRootEnr :: Maybe Node -> Maybe EnrichedDoc
extractRootEnr (Just (Node_RootEnr x@(RootEnr _) _)) = Just x
extractRootEnr _ = Nothing

extractRootDoc :: Maybe Node -> Maybe Document
extractRootDoc (Just (Node_RootDoc x@(RootDoc _) _)) = Just x
extractRootDoc _ = Nothing

extractRoot :: Maybe Node -> Maybe Root
extractRoot (Just (Node_Root x@(Root _ _ _) _)) = Just x
extractRoot _ = Nothing

extractSection :: Maybe Node -> Maybe Section
extractSection (Just (Node_Section x@(Section _ _ _) _)) = Just x
extractSection _ = Nothing

extractSubsection :: Maybe Node -> Maybe Subsection
extractSubsection (Just (Node_Subsection x@(Subsection _ _ _) _)) = Just x
extractSubsection _ = Nothing

extractSubsubsection :: Maybe Node -> Maybe Subsubsection
extractSubsubsection (Just (Node_Subsubsection x@(Subsubsection _ _) _)) = Just x
extractSubsubsection _ = Nothing

extractParagraph :: Maybe Node -> Maybe Paragraph
extractParagraph (Just (Node_Paragraph x@(Paragraph _) _)) = Just x
extractParagraph _ = Nothing

extractSubgraphPara :: Maybe Node -> Maybe Paragraph
extractSubgraphPara (Just (Node_SubgraphPara x@(SubgraphPara _) _)) = Just x
extractSubgraphPara _ = Nothing

extractWord :: Maybe Node -> Maybe Word
extractWord (Just (Node_Word x@(Word _) _)) = Just x
extractWord _ = Nothing

extractNodeRef :: Maybe Node -> Maybe Word
extractNodeRef (Just (Node_NodeRef x@(NodeRef _) _)) = Just x
extractNodeRef _ = Nothing

extractLabel :: Maybe Node -> Maybe Word
extractLabel (Just (Node_Label x@(Label _) _)) = Just x
extractLabel _ = Nothing

extractLabelRef :: Maybe Node -> Maybe Word
extractLabelRef (Just (Node_LabelRef x@(LabelRef _) _)) = Just x
extractLabelRef _ = Nothing

extractGraph :: Maybe Node -> Maybe Graph
extractGraph (Just (Node_Graph x@(Graph _ _ _) _)) = Just x
extractGraph _ = Nothing

extractVertex :: Maybe Node -> Maybe Vertex
extractVertex (Just (Node_Vertex x@(Vertex _ _ _ _ _) _)) = Just x
extractVertex _ = Nothing

extractCircle :: Maybe Node -> Maybe Shape
extractCircle (Just (Node_Circle x@(Circle) _)) = Just x
extractCircle _ = Nothing

extractSquare :: Maybe Node -> Maybe Shape
extractSquare (Just (Node_Square x@(Square) _)) = Just x
extractSquare _ = Nothing

extractEdge :: Maybe Node -> Maybe Edge
extractEdge (Just (Node_Edge x@(Edge _ _) _)) = Just x
extractEdge _ = Nothing

extractSubgraph :: Maybe Node -> Maybe Subgraph
extractSubgraph (Just (Node_Subgraph x@(Subgraph _ _ _) _)) = Just x
extractSubgraph _ = Nothing

extractDirty :: Maybe Node -> Maybe Dirty
extractDirty (Just (Node_Dirty x@(Dirty) _)) = Just x
extractDirty _ = Nothing

extractClean :: Maybe Node -> Maybe Dirty
extractClean (Just (Node_Clean x@(Clean) _)) = Just x
extractClean _ = Nothing

extractList_Section :: Maybe Node -> Maybe List_Section
extractList_Section (Just (Node_List_Section x@(List_Section _) _)) = Just x
extractList_Section _ = Nothing

extractList_Paragraph :: Maybe Node -> Maybe List_Paragraph
extractList_Paragraph (Just (Node_List_Paragraph x@(List_Paragraph _) _)) = Just x
extractList_Paragraph _ = Nothing

extractList_Subsection :: Maybe Node -> Maybe List_Subsection
extractList_Subsection (Just (Node_List_Subsection x@(List_Subsection _) _)) = Just x
extractList_Subsection _ = Nothing

extractList_Subsubsection :: Maybe Node -> Maybe List_Subsubsection
extractList_Subsubsection (Just (Node_List_Subsubsection x@(List_Subsubsection _) _)) = Just x
extractList_Subsubsection _ = Nothing

extractList_Word :: Maybe Node -> Maybe List_Word
extractList_Word (Just (Node_List_Word x@(List_Word _) _)) = Just x
extractList_Word _ = Nothing

extractList_Vertex :: Maybe Node -> Maybe List_Vertex
extractList_Vertex (Just (Node_List_Vertex x@(List_Vertex _) _)) = Just x
extractList_Vertex _ = Nothing

extractList_Edge :: Maybe Node -> Maybe List_Edge
extractList_Edge (Just (Node_List_Edge x@(List_Edge _) _)) = Just x
extractList_Edge _ = Nothing




--------------------------------------------------------------------------
-- default functions                                                    --
--------------------------------------------------------------------------

defaultRootEnr :: EnrichedDoc
defaultRootEnr = RootEnr hole

defaultRootDoc :: Document
defaultRootDoc = RootDoc hole

defaultRoot :: Root
defaultRoot = Root hole hole hole

defaultSection :: Section
defaultSection = Section hole hole hole

defaultSubsection :: Subsection
defaultSubsection = Subsection hole hole hole

defaultSubsubsection :: Subsubsection
defaultSubsubsection = Subsubsection hole hole

defaultParagraph :: Paragraph
defaultParagraph = Paragraph hole

defaultSubgraphPara :: Paragraph
defaultSubgraphPara = SubgraphPara hole

defaultWord :: Word
defaultWord = Word hole

defaultNodeRef :: Word
defaultNodeRef = NodeRef hole

defaultLabel :: Word
defaultLabel = Label hole

defaultLabelRef :: Word
defaultLabelRef = LabelRef hole

defaultGraph :: Graph
defaultGraph = Graph hole hole hole

defaultVertex :: Vertex
defaultVertex = Vertex hole hole hole hole hole

defaultCircle :: Shape
defaultCircle = Circle

defaultSquare :: Shape
defaultSquare = Square

defaultEdge :: Edge
defaultEdge = Edge hole hole

defaultSubgraph :: Subgraph
defaultSubgraph = Subgraph hole hole hole

defaultDirty :: Dirty
defaultDirty = Dirty

defaultClean :: Dirty
defaultClean = Clean

defaultList_Section :: List_Section
defaultList_Section = List_Section Nil_Section

defaultList_Paragraph :: List_Paragraph
defaultList_Paragraph = List_Paragraph Nil_Paragraph

defaultList_Subsection :: List_Subsection
defaultList_Subsection = List_Subsection Nil_Subsection

defaultList_Subsubsection :: List_Subsubsection
defaultList_Subsubsection = List_Subsubsection Nil_Subsubsection

defaultList_Word :: List_Word
defaultList_Word = List_Word Nil_Word

defaultList_Vertex :: List_Vertex
defaultList_Vertex = List_Vertex Nil_Vertex

defaultList_Edge :: List_Edge
defaultList_Edge = List_Edge Nil_Edge




--------------------------------------------------------------------------
-- extractFromTokens                                                    --
--------------------------------------------------------------------------

-- return result of the first extraction application in the list that is not Nothing
extractFromTokens :: (Maybe Node -> Maybe a) -> a -> [Token doc Node clip token] -> a
extractFromTokens extr def []     = def
extractFromTokens extr def (t:ts) = maybe (extractFromTokens extr def ts) id (extr (tokenNode t))



--------------------------------------------------------------------------
-- genericReuse functions                                               --
--------------------------------------------------------------------------

genericReuse0 :: (r) ->
                 
                 r
genericReuse0 f =
  f

genericReuse1 :: (a0 -> r) ->
                 a0 -> 
                 Maybe a0 -> r
genericReuse1 f a0 ma0 =
  f (maybe a0 id ma0)

genericReuse2 :: (a0 -> a1 -> r) ->
                 a0 -> a1 -> 
                 Maybe a0 -> Maybe a1 -> r
genericReuse2 f a0 a1 ma0 ma1 =
  f (maybe a0 id ma0) (maybe a1 id ma1)

genericReuse3 :: (a0 -> a1 -> a2 -> r) ->
                 a0 -> a1 -> a2 -> 
                 Maybe a0 -> Maybe a1 -> Maybe a2 -> r
genericReuse3 f a0 a1 a2 ma0 ma1 ma2 =
  f (maybe a0 id ma0) (maybe a1 id ma1) (maybe a2 id ma2)

genericReuse4 :: (a0 -> a1 -> a2 -> a3 -> r) ->
                 a0 -> a1 -> a2 -> a3 -> 
                 Maybe a0 -> Maybe a1 -> Maybe a2 -> Maybe a3 -> r
genericReuse4 f a0 a1 a2 a3 ma0 ma1 ma2 ma3 =
  f (maybe a0 id ma0) (maybe a1 id ma1) (maybe a2 id ma2) (maybe a3 id ma3)

genericReuse5 :: (a0 -> a1 -> a2 -> a3 -> a4 -> r) ->
                 a0 -> a1 -> a2 -> a3 -> a4 -> 
                 Maybe a0 -> Maybe a1 -> Maybe a2 -> Maybe a3 -> Maybe a4 -> r
genericReuse5 f a0 a1 a2 a3 a4 ma0 ma1 ma2 ma3 ma4 =
  f (maybe a0 id ma0) (maybe a1 id ma1) (maybe a2 id ma2) (maybe a3 id ma3) (maybe a4 id ma4)



