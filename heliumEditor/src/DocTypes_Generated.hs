module DocTypes_Generated where

import Common.CommonTypes
import Evaluation.DocTypes

import Presentation.PresTypes
import List
import Char

data UserToken = StrTk String  -- StrTk is for keywords, so eq takes the string value into account
               | IntTk
               | LIdentTk
               | UIdentTk
               | OpTk
               | SymTk deriving (Show, Eq, Ord)
-- TODO call strTk KeyTk

-- what about IDP fields for primitive type String_?
-- seems to be a general problem, IDP fields depend on what kind of presentations the value
-- is part of

-- Do lists need Hole's? Or can we use Nil for that?



-- Clip contains a constructor for each of the types in the document
-- Node contains a constructor for each of the constructors in each of the types in the document


data HeliumMessage =
         HMessage [String] 
       | HError [String] [PathDoc] [PathDoc] [PathDoc] deriving Show







-- ?? what does this old comment mean:
-- data depends on IDP, not good. Now a pres change may cause a data update.
-- Do this automatically, store elsewhere?


-- this one cannot be generated, but needs to be here for now
data Document = RootDoc Root
              | HoleDocument
              | ParseErrDocument (Presentation Document Node ClipDoc UserToken) deriving Show


type HeliumTypeInfo = ([HeliumMessage],[(String,String)], [(PathDoc, String)])

{-
Find out more on how to integrate non proxima types (such as HeliumTypeInfo)
-}


----- GENERATED PART STARTS HERE. DO NOT EDIT ON OR BEYOND THIS LINE -----

{- ------------------------------------

 generated part

-------------------------------------- -}


-- Generated Types --



data Dummy = Dummy Root Dummy 
           | HoleDummy
           | ParseErrDummy (Presentation Document Node ClipDoc UserToken)
              deriving Show


data EnrichedDoc = RootEnr RootE HeliumTypeInfo Document 
                 | HoleEnrichedDoc
                 | ParseErrEnrichedDoc (Presentation Document Node ClipDoc UserToken)
                    deriving Show


data Root = Root IDP List_Decl 
          | HoleRoot
          | ParseErrRoot (Presentation Document Node ClipDoc UserToken)
             deriving Show


data RootE = RootE IDP List_Decl List_Decl 
           | HoleRootE
           | ParseErrRootE (Presentation Document Node ClipDoc UserToken)
              deriving Show


data Decl = Decl IDP IDP IDP IDP Bool Bool Ident Exp 
          | BoardDecl IDP IDP Board 
          | PPPresentationDecl IDP IDP PPPresentation 
          | HoleDecl
          | ParseErrDecl (Presentation Document Node ClipDoc UserToken)
             deriving Show


data Ident = Ident IDP IDP String 
           | HoleIdent
           | ParseErrIdent (Presentation Document Node ClipDoc UserToken)
              deriving Show


data Exp = PlusExp IDP Exp Exp 
         | TimesExp IDP Exp Exp 
         | DivExp IDP Exp Exp 
         | PowerExp IDP Exp Exp 
         | BoolExp IDP Bool 
         | IntExp IDP Int 
         | LamExp IDP IDP Ident Exp 
         | AppExp Exp Exp 
         | CaseExp IDP IDP Exp List_Alt 
         | LetExp IDP IDP List_Decl Exp 
         | IdentExp Ident 
         | IfExp IDP IDP IDP Exp Exp Exp 
         | ParenExp IDP IDP Exp 
         | ListExp IDP IDP [IDP] List_Exp 
         | ProductExp IDP IDP [IDP] List_Exp 
         | HoleExp
         | ParseErrExp (Presentation Document Node ClipDoc UserToken)
            deriving Show


data Alt = Alt IDP IDP Ident Exp 
         | HoleAlt
         | ParseErrAlt (Presentation Document Node ClipDoc UserToken)
            deriving Show


data Board = Board BoardRow BoardRow BoardRow BoardRow BoardRow BoardRow BoardRow BoardRow 
           | HoleBoard
           | ParseErrBoard (Presentation Document Node ClipDoc UserToken)
              deriving Show


data BoardRow = BoardRow BoardSquare BoardSquare BoardSquare BoardSquare BoardSquare BoardSquare BoardSquare BoardSquare 
              | HoleBoardRow
              | ParseErrBoardRow (Presentation Document Node ClipDoc UserToken)
                 deriving Show


data BoardSquare = Queen Bool 
                 | King Bool 
                 | Bishop Bool 
                 | Knight Bool 
                 | Rook Bool 
                 | Pawn Bool 
                 | Empty 
                 | HoleBoardSquare
                 | ParseErrBoardSquare (Presentation Document Node ClipDoc UserToken)
                    deriving Show


data PPPresentation = PPPresentation Bool List_Slide 
                    | HolePPPresentation
                    | ParseErrPPPresentation (Presentation Document Node ClipDoc UserToken)
                       deriving Show


data Slide = Slide String ItemList 
           | HoleSlide
           | ParseErrSlide (Presentation Document Node ClipDoc UserToken)
              deriving Show


data ItemList = ItemList ListType List_Item 
              | HoleItemList
              | ParseErrItemList (Presentation Document Node ClipDoc UserToken)
                 deriving Show


data ListType = Bullet 
              | Number 
              | Alpha 
              | HoleListType
              | ParseErrListType (Presentation Document Node ClipDoc UserToken)
                 deriving Show


data Item = StringItem String 
          | HeliumItem Exp 
          | ListItem ItemList 
          | HoleItem
          | ParseErrItem (Presentation Document Node ClipDoc UserToken)
             deriving Show


data List_Decl = List_Decl ConsList_Decl 
               | HoleList_Decl
               | ParseErrList_Decl (Presentation Document Node ClipDoc UserToken)
                  deriving Show


data ConsList_Decl = Cons_Decl Decl ConsList_Decl 
                   | Nil_Decl 
                      deriving Show


data List_Alt = List_Alt ConsList_Alt 
              | HoleList_Alt
              | ParseErrList_Alt (Presentation Document Node ClipDoc UserToken)
                 deriving Show


data ConsList_Alt = Cons_Alt Alt ConsList_Alt 
                  | Nil_Alt 
                     deriving Show


data List_Exp = List_Exp ConsList_Exp 
              | HoleList_Exp
              | ParseErrList_Exp (Presentation Document Node ClipDoc UserToken)
                 deriving Show


data ConsList_Exp = Cons_Exp Exp ConsList_Exp 
                  | Nil_Exp 
                     deriving Show


data List_Slide = List_Slide ConsList_Slide 
                | HoleList_Slide
                | ParseErrList_Slide (Presentation Document Node ClipDoc UserToken)
                   deriving Show


data ConsList_Slide = Cons_Slide Slide ConsList_Slide 
                    | Nil_Slide 
                       deriving Show


data List_Item = List_Item ConsList_Item 
               | HoleList_Item
               | ParseErrList_Item (Presentation Document Node ClipDoc UserToken)
                  deriving Show


data ConsList_Item = Cons_Item Item ConsList_Item 
                   | Nil_Item 
                      deriving Show


-- Generated Types --

data ClipDoc = Clip_Dummy Dummy
             | Clip_EnrichedDoc EnrichedDoc
             | Clip_Root Root
             | Clip_RootE RootE
             | Clip_Decl Decl
             | Clip_Ident Ident
             | Clip_Exp Exp
             | Clip_Alt Alt
             | Clip_Board Board
             | Clip_BoardRow BoardRow
             | Clip_BoardSquare BoardSquare
             | Clip_PPPresentation PPPresentation
             | Clip_Slide Slide
             | Clip_ItemList ItemList
             | Clip_ListType ListType
             | Clip_Item Item
             | Clip_List_Decl List_Decl
             | Clip_List_Alt List_Alt
             | Clip_List_Exp List_Exp
             | Clip_List_Slide List_Slide
             | Clip_List_Item List_Item
             | Clip_Document Document
             | Clip_Bool Bool
             | Clip_Int Int
             | Clip_String String
             | Clip_Nothing deriving Show




data Node = NoNode 
          | RootDocNode Document Path
          | HoleDocumentNode Document Path
          | DummyNode Dummy Path 
          | HoleDummyNode Dummy Path 
          | RootEnrNode EnrichedDoc Path 
          | HoleEnrichedDocNode EnrichedDoc Path 
          | RootNode Root Path 
          | HoleRootNode Root Path 
          | RootENode RootE Path 
          | HoleRootENode RootE Path 
          | DeclNode Decl Path 
          | BoardDeclNode Decl Path 
          | PPPresentationDeclNode Decl Path 
          | HoleDeclNode Decl Path 
          | IdentNode Ident Path 
          | HoleIdentNode Ident Path 
          | PlusExpNode Exp Path 
          | TimesExpNode Exp Path 
          | DivExpNode Exp Path 
          | PowerExpNode Exp Path 
          | BoolExpNode Exp Path 
          | IntExpNode Exp Path 
          | LamExpNode Exp Path 
          | AppExpNode Exp Path 
          | CaseExpNode Exp Path 
          | LetExpNode Exp Path 
          | IdentExpNode Exp Path 
          | IfExpNode Exp Path 
          | ParenExpNode Exp Path 
          | ListExpNode Exp Path 
          | ProductExpNode Exp Path 
          | HoleExpNode Exp Path 
          | AltNode Alt Path 
          | HoleAltNode Alt Path 
          | BoardNode Board Path 
          | HoleBoardNode Board Path 
          | BoardRowNode BoardRow Path 
          | HoleBoardRowNode BoardRow Path 
          | QueenNode BoardSquare Path 
          | KingNode BoardSquare Path 
          | BishopNode BoardSquare Path 
          | KnightNode BoardSquare Path 
          | RookNode BoardSquare Path 
          | PawnNode BoardSquare Path 
          | EmptyNode BoardSquare Path 
          | HoleBoardSquareNode BoardSquare Path 
          | PPPresentationNode PPPresentation Path 
          | HolePPPresentationNode PPPresentation Path 
          | SlideNode Slide Path 
          | HoleSlideNode Slide Path 
          | ItemListNode ItemList Path 
          | HoleItemListNode ItemList Path 
          | BulletNode ListType Path 
          | NumberNode ListType Path 
          | AlphaNode ListType Path 
          | HoleListTypeNode ListType Path 
          | StringItemNode Item Path 
          | HeliumItemNode Item Path 
          | ListItemNode Item Path 
          | HoleItemNode Item Path 
          | List_DeclNode List_Decl Path 
          | HoleList_DeclNode List_Decl Path 
          | List_AltNode List_Alt Path 
          | HoleList_AltNode List_Alt Path 
          | List_ExpNode List_Exp Path 
          | HoleList_ExpNode List_Exp Path 
          | List_SlideNode List_Slide Path 
          | HoleList_SlideNode List_Slide Path 
          | List_ItemNode List_Item Path 
          | HoleList_ItemNode List_Item Path 



instance Show Node where
  show NoNode            = "NoNode"
  show (RootDocNode _ _) = "RootDocNode"
  show (HoleDocumentNode _ _) = "HoleDocumentNode"
  show (DummyNode _ _)  = "DummyNode"
  show (HoleDummyNode _ _)  = "HoleDummyNode"
  show (RootEnrNode _ _)  = "RootEnrNode"
  show (HoleEnrichedDocNode _ _)  = "HoleEnrichedDocNode"
  show (RootNode _ _)  = "RootNode"
  show (HoleRootNode _ _)  = "HoleRootNode"
  show (RootENode _ _)  = "RootENode"
  show (HoleRootENode _ _)  = "HoleRootENode"
  show (DeclNode _ _)  = "DeclNode"
  show (BoardDeclNode _ _)  = "BoardDeclNode"
  show (PPPresentationDeclNode _ _)  = "PPPresentationDeclNode"
  show (HoleDeclNode _ _)  = "HoleDeclNode"
  show (IdentNode _ _)  = "IdentNode"
  show (HoleIdentNode _ _)  = "HoleIdentNode"
  show (PlusExpNode _ _)  = "PlusExpNode"
  show (TimesExpNode _ _)  = "TimesExpNode"
  show (DivExpNode _ _)  = "DivExpNode"
  show (PowerExpNode _ _)  = "PowerExpNode"
  show (BoolExpNode _ _)  = "BoolExpNode"
  show (IntExpNode _ _)  = "IntExpNode"
  show (LamExpNode _ _)  = "LamExpNode"
  show (AppExpNode _ _)  = "AppExpNode"
  show (CaseExpNode _ _)  = "CaseExpNode"
  show (LetExpNode _ _)  = "LetExpNode"
  show (IdentExpNode _ _)  = "IdentExpNode"
  show (IfExpNode _ _)  = "IfExpNode"
  show (ParenExpNode _ _)  = "ParenExpNode"
  show (ListExpNode _ _)  = "ListExpNode"
  show (ProductExpNode _ _)  = "ProductExpNode"
  show (HoleExpNode _ _)  = "HoleExpNode"
  show (AltNode _ _)  = "AltNode"
  show (HoleAltNode _ _)  = "HoleAltNode"
  show (BoardNode _ _)  = "BoardNode"
  show (HoleBoardNode _ _)  = "HoleBoardNode"
  show (BoardRowNode _ _)  = "BoardRowNode"
  show (HoleBoardRowNode _ _)  = "HoleBoardRowNode"
  show (QueenNode _ _)  = "QueenNode"
  show (KingNode _ _)  = "KingNode"
  show (BishopNode _ _)  = "BishopNode"
  show (KnightNode _ _)  = "KnightNode"
  show (RookNode _ _)  = "RookNode"
  show (PawnNode _ _)  = "PawnNode"
  show (EmptyNode _ _)  = "EmptyNode"
  show (HoleBoardSquareNode _ _)  = "HoleBoardSquareNode"
  show (PPPresentationNode _ _)  = "PPPresentationNode"
  show (HolePPPresentationNode _ _)  = "HolePPPresentationNode"
  show (SlideNode _ _)  = "SlideNode"
  show (HoleSlideNode _ _)  = "HoleSlideNode"
  show (ItemListNode _ _)  = "ItemListNode"
  show (HoleItemListNode _ _)  = "HoleItemListNode"
  show (BulletNode _ _)  = "BulletNode"
  show (NumberNode _ _)  = "NumberNode"
  show (AlphaNode _ _)  = "AlphaNode"
  show (HoleListTypeNode _ _)  = "HoleListTypeNode"
  show (StringItemNode _ _)  = "StringItemNode"
  show (HeliumItemNode _ _)  = "HeliumItemNode"
  show (ListItemNode _ _)  = "ListItemNode"
  show (HoleItemNode _ _)  = "HoleItemNode"
  show (List_DeclNode _ _)  = "List_DeclNode"
  show (HoleList_DeclNode _ _)  = "HoleList_DeclNode"
  show (List_AltNode _ _)  = "List_AltNode"
  show (HoleList_AltNode _ _)  = "HoleList_AltNode"
  show (List_ExpNode _ _)  = "List_ExpNode"
  show (HoleList_ExpNode _ _)  = "HoleList_ExpNode"
  show (List_SlideNode _ _)  = "List_SlideNode"
  show (HoleList_SlideNode _ _)  = "HoleList_SlideNode"
  show (List_ItemNode _ _)  = "List_ItemNode"
  show (HoleList_ItemNode _ _)  = "HoleList_ItemNode"
