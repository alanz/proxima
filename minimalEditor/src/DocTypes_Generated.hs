module DocTypes_Generated where

import CommonTypes
import DocTypes

import PresTypes
import List
import Char


data Document = RootDoc IDD Root 
              | HoleDocument
              | ParseErrDocument (Presentation Document Node ClipDoc)
                 deriving Show

instance DocNode Node where
  noNode = NoNode

----- GENERATED PART STARTS HERE. DO NOT EDIT ON OR BEYOND THIS LINE -----

{- ------------------------------------

 generated part

-------------------------------------- -}


-- Generated Types --



data EnrichedDoc = RootEnr IDD Root Document 
                 | HoleEnrichedDoc
                 | ParseErrEnrichedDoc (Presentation Document Node ClipDoc)
                    deriving Show


data String_ = String_ IDD String 
             | HoleString_
             | ParseErrString_ (Presentation Document Node ClipDoc)
                deriving Show


data Bool_ = Bool_ IDD Bool 
           | HoleBool_
           | ParseErrBool_ (Presentation Document Node ClipDoc)
              deriving Show


data Int_ = Int_ IDD Int 
          | HoleInt_
          | ParseErrInt_ (Presentation Document Node ClipDoc)
             deriving Show


data Dummy = Dummy IDD List_Dummy String_ Bool_ Int_ 
           | HoleDummy
           | ParseErrDummy (Presentation Document Node ClipDoc)
              deriving Show


data Root = Root IDD Tree Graph List_Paragraph List_SubGraph 
          | HoleRoot
          | ParseErrRoot (Presentation Document Node ClipDoc)
             deriving Show


data Tree = Bin IDD Tree Tree 
          | Leaf IDD 
          | HoleTree
          | ParseErrTree (Presentation Document Node ClipDoc)
             deriving Show


data Paragraph = Paragraph IDD List_Word 
               | HoleParagraph
               | ParseErrParagraph (Presentation Document Node ClipDoc)
                  deriving Show


data Word = Word IDD String_ 
          | HoleWord
          | ParseErrWord (Presentation Document Node ClipDoc)
             deriving Show


data Graph = Graph IDD List_Vertex List_Edge 
           | HoleGraph
           | ParseErrGraph (Presentation Document Node ClipDoc)
              deriving Show


data Vertex = Vertex IDD String_ Int_ Int_ Int_ 
            | HoleVertex
            | ParseErrVertex (Presentation Document Node ClipDoc)
               deriving Show


data Edge = Edge IDD Int_ Int_ 
          | HoleEdge
          | ParseErrEdge (Presentation Document Node ClipDoc)
             deriving Show


data SubGraph = SubGraph IDD List_Vertex List_Edge 
              | HoleSubGraph
              | ParseErrSubGraph (Presentation Document Node ClipDoc)
                 deriving Show


data List_Dummy = List_Dummy IDD ConsList_Dummy 
                | HoleList_Dummy
                | ParseErrList_Dummy (Presentation Document Node ClipDoc)
                   deriving Show


data ConsList_Dummy = Cons_Dummy Dummy ConsList_Dummy 
                    | Nil_Dummy 
                       deriving Show


data List_Paragraph = List_Paragraph IDD ConsList_Paragraph 
                    | HoleList_Paragraph
                    | ParseErrList_Paragraph (Presentation Document Node ClipDoc)
                       deriving Show


data ConsList_Paragraph = Cons_Paragraph Paragraph ConsList_Paragraph 
                        | Nil_Paragraph 
                           deriving Show


data List_SubGraph = List_SubGraph IDD ConsList_SubGraph 
                   | HoleList_SubGraph
                   | ParseErrList_SubGraph (Presentation Document Node ClipDoc)
                      deriving Show


data ConsList_SubGraph = Cons_SubGraph SubGraph ConsList_SubGraph 
                       | Nil_SubGraph 
                          deriving Show


data List_Word = List_Word IDD ConsList_Word 
               | HoleList_Word
               | ParseErrList_Word (Presentation Document Node ClipDoc)
                  deriving Show


data ConsList_Word = Cons_Word Word ConsList_Word 
                   | Nil_Word 
                      deriving Show


data List_Vertex = List_Vertex IDD ConsList_Vertex 
                 | HoleList_Vertex
                 | ParseErrList_Vertex (Presentation Document Node ClipDoc)
                    deriving Show


data ConsList_Vertex = Cons_Vertex Vertex ConsList_Vertex 
                     | Nil_Vertex 
                        deriving Show


data List_Edge = List_Edge IDD ConsList_Edge 
               | HoleList_Edge
               | ParseErrList_Edge (Presentation Document Node ClipDoc)
                  deriving Show


data ConsList_Edge = Cons_Edge Edge ConsList_Edge 
                   | Nil_Edge 
                      deriving Show


-- Generated Types --

data ClipDoc = Clip_Root Root
             | Clip_Document Document
             | Clip_String String
             | Clip_Bool Bool
             | Clip_Int Int
             | Clip_List_Dummy List_Dummy
             | Clip_String_ String_
             | Clip_Bool_ Bool_
             | Clip_Int_ Int_
             | Clip_Tree Tree
             | Clip_Graph Graph
             | Clip_List_Paragraph List_Paragraph
             | Clip_List_SubGraph List_SubGraph
             | Clip_List_Word List_Word
             | Clip_List_Vertex List_Vertex
             | Clip_List_Edge List_Edge
             | Clip_Dummy Dummy
             
             | Clip_Paragraph Paragraph
             
             | Clip_SubGraph SubGraph
             
             | Clip_Word Word
             
             | Clip_Vertex Vertex
             
             | Clip_Edge Edge
             
             | Clip_Nothing deriving Show




data Node = NoNode 
          | RootDocNode Document Path
          | HoleDocumentNode Document Path
          | RootEnrNode EnrichedDoc Path 
          | HoleEnrichedDocNode EnrichedDoc Path 
          | String_Node String_ Path 
          | HoleString_Node String_ Path 
          | Bool_Node Bool_ Path 
          | HoleBool_Node Bool_ Path 
          | Int_Node Int_ Path 
          | HoleInt_Node Int_ Path 
          | DummyNode Dummy Path 
          | HoleDummyNode Dummy Path 
          | RootNode Root Path 
          | HoleRootNode Root Path 
          | BinNode Tree Path 
          | LeafNode Tree Path 
          | HoleTreeNode Tree Path 
          | ParagraphNode Paragraph Path 
          | HoleParagraphNode Paragraph Path 
          | WordNode Word Path 
          | HoleWordNode Word Path 
          | GraphNode Graph Path 
          | HoleGraphNode Graph Path 
          | VertexNode Vertex Path 
          | HoleVertexNode Vertex Path 
          | EdgeNode Edge Path 
          | HoleEdgeNode Edge Path 
          | SubGraphNode SubGraph Path 
          | HoleSubGraphNode SubGraph Path 
          | List_DummyNode List_Dummy Path 
          | HoleList_DummyNode List_Dummy Path 
          | List_ParagraphNode List_Paragraph Path 
          | HoleList_ParagraphNode List_Paragraph Path 
          | List_SubGraphNode List_SubGraph Path 
          | HoleList_SubGraphNode List_SubGraph Path 
          | List_WordNode List_Word Path 
          | HoleList_WordNode List_Word Path 
          | List_VertexNode List_Vertex Path 
          | HoleList_VertexNode List_Vertex Path 
          | List_EdgeNode List_Edge Path 
          | HoleList_EdgeNode List_Edge Path 



instance Show Node where
  show NoNode            = "NoNode"
  show (RootDocNode _ _) = "RootDocNode"
  show (HoleDocumentNode _ _) = "HoleDocumentNode"
  show (RootEnrNode _ _)  = "RootEnrNode"
  show (HoleEnrichedDocNode _ _)  = "HoleEnrichedDocNode"
  show (String_Node _ _)  = "String_Node"
  show (HoleString_Node _ _)  = "HoleString_Node"
  show (Bool_Node _ _)  = "Bool_Node"
  show (HoleBool_Node _ _)  = "HoleBool_Node"
  show (Int_Node _ _)  = "Int_Node"
  show (HoleInt_Node _ _)  = "HoleInt_Node"
  show (DummyNode _ _)  = "DummyNode"
  show (HoleDummyNode _ _)  = "HoleDummyNode"
  show (RootNode _ _)  = "RootNode"
  show (HoleRootNode _ _)  = "HoleRootNode"
  show (BinNode _ _)  = "BinNode"
  show (LeafNode _ _)  = "LeafNode"
  show (HoleTreeNode _ _)  = "HoleTreeNode"
  show (ParagraphNode _ _)  = "ParagraphNode"
  show (HoleParagraphNode _ _)  = "HoleParagraphNode"
  show (WordNode _ _)  = "WordNode"
  show (HoleWordNode _ _)  = "HoleWordNode"
  show (GraphNode _ _)  = "GraphNode"
  show (HoleGraphNode _ _)  = "HoleGraphNode"
  show (VertexNode _ _)  = "VertexNode"
  show (HoleVertexNode _ _)  = "HoleVertexNode"
  show (EdgeNode _ _)  = "EdgeNode"
  show (HoleEdgeNode _ _)  = "HoleEdgeNode"
  show (SubGraphNode _ _)  = "SubGraphNode"
  show (HoleSubGraphNode _ _)  = "HoleSubGraphNode"
  show (List_DummyNode _ _)  = "List_DummyNode"
  show (HoleList_DummyNode _ _)  = "HoleList_DummyNode"
  show (List_ParagraphNode _ _)  = "List_ParagraphNode"
  show (HoleList_ParagraphNode _ _)  = "HoleList_ParagraphNode"
  show (List_SubGraphNode _ _)  = "List_SubGraphNode"
  show (HoleList_SubGraphNode _ _)  = "HoleList_SubGraphNode"
  show (List_WordNode _ _)  = "List_WordNode"
  show (HoleList_WordNode _ _)  = "HoleList_WordNode"
  show (List_VertexNode _ _)  = "List_VertexNode"
  show (HoleList_VertexNode _ _)  = "HoleList_VertexNode"
  show (List_EdgeNode _ _)  = "List_EdgeNode"
  show (HoleList_EdgeNode _ _)  = "HoleList_EdgeNode"
