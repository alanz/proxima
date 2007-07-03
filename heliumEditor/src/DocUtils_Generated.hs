module DocUtils_Generated where

import DocTypes
import DocTypes_Generated
import PresTypes
import Text.ParserCombinators.Parsec
import DocUtils

--instance Show Node where
--  show NoNode = "<>"
--  show (DocNode doc pth) = "<"++shallowShowDoc1 doc++","++show pth++">"
--  show (ExpNode exp pth) = "<"++shallowShowExp1 exp++","++show pth++">"
--  show _ = "<NODE>"

instance Eq Node where
  nd1 == nd2 = rankNode nd1 == rankNode nd2
  
instance Ord Node where
  nd1 <= nd2 = rankNode nd1 <= rankNode nd2

-- XML

toXMLRoot (RootDoc _ _ dcls)  = Elt "Module" [] [] -- $ toXMLList_Decl dcls
toXMLRoot _                    = Elt "ErrRoot" [] []

toXMLDocument document = Elt "Document" [] []



toXMLHeliumTypeInfo = Elt "HeliumTypeInfo" [] []



---- constructors for boxed primitive types
-- fix name clash in ProxParser 
--mkString_ :: String -> String_
--mkString_ str = String_ NoIDD str

--mkBool_ :: Bool -> Bool_
--mkBool_ b = Bool_ NoIDD b

--mkInt_ :: Int -> Int_
--mkInt_ i = Int_ NoIDD i

string_ :: String_ -> String
string_ (String_ _ str) = str
string_ _ = ""

bool_ :: Bool_ -> Bool
bool_ (Bool_ _ b) = b
bool_ _ = False

int_ :: Int_ -> Int
int_ (Int_ _ i) = i
int_ _ = 0

----


initBoard = demoBoard -- Board NoIDD (backRow (Bool_ NoIDD True)) (pawnRow (Bool_ NoIDD True)) emptyRow emptyRow emptyRow emptyRow (pawnRow (Bool_ NoIDD False)) (backRow (Bool_ NoIDD False))

demoBoard = Board NoIDD r8 r7 r6 r5 r4 r3 r2 r1
 where r1 = BoardRow NoIDD e  e  bb e  e  e  br bk
       r2 = BoardRow NoIDD e  e  e  e  bn bp e  bp
       r3 = BoardRow NoIDD bp e  e  e  e  e  e  wp
       r4 = BoardRow NoIDD e  e  br e  bq bp wq wr
       r5 = BoardRow NoIDD e  bp wp e  e  e  e  e
       r6 = BoardRow NoIDD e  e  e  e  wn e  e  e
       r7 = BoardRow NoIDD wp wp wb e  e  wp wp e
       r8 = BoardRow NoIDD e  wk e  wr e  e  e  e
       [e,wp,wr,wn,wb,wq,wk,bp,br,bn,bb,bq,bk] = Empty : pieces (Bool_ NoIDD True) ++ pieces (Bool_ NoIDD False)
       pieces c = [Pawn NoIDD c, Rook NoIDD c, Knight NoIDD c, Bishop NoIDD c, Queen NoIDD c, King NoIDD c]
      
  
-- Kasparov,G - Lautier,J Moscow, 1995 1.Ng4!! Qe6 [1...Rxg5 2.Nxe5 Rxh5 3.Rd8+ Ng8 4.Nxf7#] 2.Rd8 Qg6 3.Qxe7 1-0

emptyBoard = Board NoIDD emptyRow emptyRow emptyRow emptyRow emptyRow emptyRow emptyRow emptyRow

emptyRow = BoardRow NoIDD Empty Empty Empty Empty Empty Empty Empty Empty

pawnRow c = BoardRow NoIDD (Pawn NoIDD c) (Pawn NoIDD c) (Pawn NoIDD c) (Pawn NoIDD c) 
                          (Pawn NoIDD c) (Pawn NoIDD c) (Pawn NoIDD c) (Pawn NoIDD c)
backRow c = BoardRow NoIDD (Rook NoIDD c) (Knight NoIDD c) (Bishop NoIDD c) (Queen NoIDD c) 
                          (King NoIDD c) (Bishop NoIDD c) (Knight NoIDD c) (Rook NoIDD c)




initPPPresentation = 
  PPPresentation NoIDD (Bool_ NoIDD True) $ List_Slide NoIDD $
    mkSlides
      [ Slide NoIDD (mkString_ "slide_1") $
          ItemList NoIDD (Bullet NoIDD) $ List_Item NoIDD $
                         mkItems [ StringItem NoIDD (mkString_ "item_1")
                                 , HeliumItem NoIDD -- simple trick to use parser: Needs an additional parse (F1) though!
                                     --(ident "\\ x -> increaze x")
                                     (ident "\\b -> \\x -> if b then ink x else x")
                                 , StringItem NoIDD (mkString_ "item_2")
                                 , ListItem NoIDD listItem
                                 ]
       , Slide NoIDD (mkString_ "slide_2") $
          ItemList NoIDD (Alpha NoIDD) $  List_Item NoIDD $
                         mkItems [ StringItem NoIDD (mkString_ "item_a")
                                 , StringItem NoIDD (mkString_ "item_b")
                                 , StringItem NoIDD (mkString_ "item_c")
                                 ]
      ]
 where listItem = ItemList NoIDD (Number NoIDD) $  List_Item NoIDD $
                    mkItems [ StringItem NoIDD (mkString_ "nested_item_1")
                            , ListItem NoIDD listItem'
                            , StringItem NoIDD (mkString_ "nested_item_2")
                            , StringItem NoIDD (mkString_ "nested_item_3")
                            ]
       listItem' = ItemList NoIDD (Bullet NoIDD) $  List_Item NoIDD $
                    mkItems [ StringItem NoIDD (mkString_ "nested_nested_item")
                            , StringItem NoIDD (mkString_ "nested_nested_item")
                            , StringItem NoIDD (mkString_ "nested_nested_item")
                            ]
       dv e1 e2 = DivExp NoIDD NoIDP e1 e2 
       lam str body = LamExp NoIDD NoIDP NoIDP (Ident NoIDD NoIDP NoIDP (mkString_ str)) body
       ifxp c t e = IfExp NoIDD NoIDP NoIDP NoIDP c t e 
       int i = IntExp NoIDD NoIDP (Int_ NoIDD i)
       bool b = BoolExp NoIDD NoIDP (Bool_ NoIDD b)
       ident str = IdentExp NoIDD (Ident NoIDD NoIDP NoIDP (mkString_ str))
       

       mkString_ str = String_ NoIDD str

mkSlides []     = Nil_Slide
mkSlides (s:ss) = Cons_Slide s (mkSlides ss)

mkItems []     = Nil_Item 
mkItems (s:ss) = Cons_Item s (mkItems ss)






----- GENERATED PART STARTS HERE. DO NOT EDIT ON OR BEYOND THIS LINE -----

{- ------------------------------------

 generated part

-------------------------------------- -}
rankNode :: Node -> Int
rankNode NoNode            = 0
rankNode (RootDocNode _ _) = 1
rankNode (HoleDocumentNode _ _) = 2
rankNode (RootEnrNode _ _)  = 3
rankNode (HoleEnrichedDocNode _ _)  = 4
rankNode (DeclNode _ _)  = 5
rankNode (BoardDeclNode _ _)  = 6
rankNode (PPPresentationDeclNode _ _)  = 7
rankNode (HoleDeclNode _ _)  = 8
rankNode (IdentNode _ _)  = 9
rankNode (HoleIdentNode _ _)  = 10
rankNode (PlusExpNode _ _)  = 11
rankNode (TimesExpNode _ _)  = 12
rankNode (DivExpNode _ _)  = 13
rankNode (PowerExpNode _ _)  = 14
rankNode (BoolExpNode _ _)  = 15
rankNode (IntExpNode _ _)  = 16
rankNode (LamExpNode _ _)  = 17
rankNode (AppExpNode _ _)  = 18
rankNode (CaseExpNode _ _)  = 19
rankNode (LetExpNode _ _)  = 20
rankNode (IdentExpNode _ _)  = 21
rankNode (IfExpNode _ _)  = 22
rankNode (ParenExpNode _ _)  = 23
rankNode (ListExpNode _ _)  = 24
rankNode (ProductExpNode _ _)  = 25
rankNode (HoleExpNode _ _)  = 26
rankNode (AltNode _ _)  = 27
rankNode (HoleAltNode _ _)  = 28
rankNode (BoardNode _ _)  = 29
rankNode (HoleBoardNode _ _)  = 30
rankNode (BoardRowNode _ _)  = 31
rankNode (HoleBoardRowNode _ _)  = 32
rankNode (QueenNode _ _)  = 33
rankNode (KingNode _ _)  = 34
rankNode (BishopNode _ _)  = 35
rankNode (KnightNode _ _)  = 36
rankNode (RookNode _ _)  = 37
rankNode (PawnNode _ _)  = 38
rankNode (EmptyNode _ _)  = 39
rankNode (HoleBoardSquareNode _ _)  = 40
rankNode (PPPresentationNode _ _)  = 41
rankNode (HolePPPresentationNode _ _)  = 42
rankNode (SlideNode _ _)  = 43
rankNode (HoleSlideNode _ _)  = 44
rankNode (ItemListNode _ _)  = 45
rankNode (HoleItemListNode _ _)  = 46
rankNode (BulletNode _ _)  = 47
rankNode (NumberNode _ _)  = 48
rankNode (AlphaNode _ _)  = 49
rankNode (HoleListTypeNode _ _)  = 50
rankNode (StringItemNode _ _)  = 51
rankNode (HeliumItemNode _ _)  = 52
rankNode (ListItemNode _ _)  = 53
rankNode (HoleItemNode _ _)  = 54
rankNode (String_Node _ _)  = 55
rankNode (HoleString_Node _ _)  = 56
rankNode (Bool_Node _ _)  = 57
rankNode (HoleBool_Node _ _)  = 58
rankNode (Int_Node _ _)  = 59
rankNode (HoleInt_Node _ _)  = 60
rankNode (List_DeclNode _ _)  = 61
rankNode (HoleList_DeclNode _ _)  = 62
rankNode (List_AltNode _ _)  = 63
rankNode (HoleList_AltNode _ _)  = 64
rankNode (List_ExpNode _ _)  = 65
rankNode (HoleList_ExpNode _ _)  = 66
rankNode (List_SlideNode _ _)  = 67
rankNode (HoleList_SlideNode _ _)  = 68
rankNode (List_ItemNode _ _)  = 69
rankNode (HoleList_ItemNode _ _)  = 70



instance HasPath Node where
  pathNode NoNode            = NoPathD
  pathNode (RootDocNode _ pth) = PathD pth
  pathNode (HoleDocumentNode _ pth) = PathD pth
  pathNode (RootEnrNode _ pth)  = PathD pth
  pathNode (HoleEnrichedDocNode _ pth)  = PathD pth
  pathNode (DeclNode _ pth)  = PathD pth
  pathNode (BoardDeclNode _ pth)  = PathD pth
  pathNode (PPPresentationDeclNode _ pth)  = PathD pth
  pathNode (HoleDeclNode _ pth)  = PathD pth
  pathNode (IdentNode _ pth)  = PathD pth
  pathNode (HoleIdentNode _ pth)  = PathD pth
  pathNode (PlusExpNode _ pth)  = PathD pth
  pathNode (TimesExpNode _ pth)  = PathD pth
  pathNode (DivExpNode _ pth)  = PathD pth
  pathNode (PowerExpNode _ pth)  = PathD pth
  pathNode (BoolExpNode _ pth)  = PathD pth
  pathNode (IntExpNode _ pth)  = PathD pth
  pathNode (LamExpNode _ pth)  = PathD pth
  pathNode (AppExpNode _ pth)  = PathD pth
  pathNode (CaseExpNode _ pth)  = PathD pth
  pathNode (LetExpNode _ pth)  = PathD pth
  pathNode (IdentExpNode _ pth)  = PathD pth
  pathNode (IfExpNode _ pth)  = PathD pth
  pathNode (ParenExpNode _ pth)  = PathD pth
  pathNode (ListExpNode _ pth)  = PathD pth
  pathNode (ProductExpNode _ pth)  = PathD pth
  pathNode (HoleExpNode _ pth)  = PathD pth
  pathNode (AltNode _ pth)  = PathD pth
  pathNode (HoleAltNode _ pth)  = PathD pth
  pathNode (BoardNode _ pth)  = PathD pth
  pathNode (HoleBoardNode _ pth)  = PathD pth
  pathNode (BoardRowNode _ pth)  = PathD pth
  pathNode (HoleBoardRowNode _ pth)  = PathD pth
  pathNode (QueenNode _ pth)  = PathD pth
  pathNode (KingNode _ pth)  = PathD pth
  pathNode (BishopNode _ pth)  = PathD pth
  pathNode (KnightNode _ pth)  = PathD pth
  pathNode (RookNode _ pth)  = PathD pth
  pathNode (PawnNode _ pth)  = PathD pth
  pathNode (EmptyNode _ pth)  = PathD pth
  pathNode (HoleBoardSquareNode _ pth)  = PathD pth
  pathNode (PPPresentationNode _ pth)  = PathD pth
  pathNode (HolePPPresentationNode _ pth)  = PathD pth
  pathNode (SlideNode _ pth)  = PathD pth
  pathNode (HoleSlideNode _ pth)  = PathD pth
  pathNode (ItemListNode _ pth)  = PathD pth
  pathNode (HoleItemListNode _ pth)  = PathD pth
  pathNode (BulletNode _ pth)  = PathD pth
  pathNode (NumberNode _ pth)  = PathD pth
  pathNode (AlphaNode _ pth)  = PathD pth
  pathNode (HoleListTypeNode _ pth)  = PathD pth
  pathNode (StringItemNode _ pth)  = PathD pth
  pathNode (HeliumItemNode _ pth)  = PathD pth
  pathNode (ListItemNode _ pth)  = PathD pth
  pathNode (HoleItemNode _ pth)  = PathD pth
  pathNode (String_Node _ pth)  = PathD pth
  pathNode (HoleString_Node _ pth)  = PathD pth
  pathNode (Bool_Node _ pth)  = PathD pth
  pathNode (HoleBool_Node _ pth)  = PathD pth
  pathNode (Int_Node _ pth)  = PathD pth
  pathNode (HoleInt_Node _ pth)  = PathD pth
  pathNode (List_DeclNode _ pth)  = PathD pth
  pathNode (HoleList_DeclNode _ pth)  = PathD pth
  pathNode (List_AltNode _ pth)  = PathD pth
  pathNode (HoleList_AltNode _ pth)  = PathD pth
  pathNode (List_ExpNode _ pth)  = PathD pth
  pathNode (HoleList_ExpNode _ pth)  = PathD pth
  pathNode (List_SlideNode _ pth)  = PathD pth
  pathNode (HoleList_SlideNode _ pth)  = PathD pth
  pathNode (List_ItemNode _ pth)  = PathD pth
  pathNode (HoleList_ItemNode _ pth)  = PathD pth



rootEnrIDD :: Node -> Maybe IDD
rootEnrIDD (RootEnrNode (RootEnr iDD _ _ _ _ _) _) = Just iDD
rootEnrIDD _                                   = Nothing

declIDD :: Node -> Maybe IDD
declIDD (DeclNode (Decl iDD _ _ _ _ _ _ _ _) _) = Just iDD
declIDD _                                   = Nothing

boardDeclIDD :: Node -> Maybe IDD
boardDeclIDD (BoardDeclNode (BoardDecl iDD _ _ _) _) = Just iDD
boardDeclIDD _                                   = Nothing

pPPresentationDeclIDD :: Node -> Maybe IDD
pPPresentationDeclIDD (PPPresentationDeclNode (PPPresentationDecl iDD _ _ _) _) = Just iDD
pPPresentationDeclIDD _                                   = Nothing

identIDD :: Node -> Maybe IDD
identIDD (IdentNode (Ident iDD _ _ _) _) = Just iDD
identIDD _                                   = Nothing

plusExpIDD :: Node -> Maybe IDD
plusExpIDD (PlusExpNode (PlusExp iDD _ _ _) _) = Just iDD
plusExpIDD _                                   = Nothing

timesExpIDD :: Node -> Maybe IDD
timesExpIDD (TimesExpNode (TimesExp iDD _ _ _) _) = Just iDD
timesExpIDD _                                   = Nothing

divExpIDD :: Node -> Maybe IDD
divExpIDD (DivExpNode (DivExp iDD _ _ _) _) = Just iDD
divExpIDD _                                   = Nothing

powerExpIDD :: Node -> Maybe IDD
powerExpIDD (PowerExpNode (PowerExp iDD _ _ _) _) = Just iDD
powerExpIDD _                                   = Nothing

boolExpIDD :: Node -> Maybe IDD
boolExpIDD (BoolExpNode (BoolExp iDD _ _) _) = Just iDD
boolExpIDD _                                   = Nothing

intExpIDD :: Node -> Maybe IDD
intExpIDD (IntExpNode (IntExp iDD _ _) _) = Just iDD
intExpIDD _                                   = Nothing

lamExpIDD :: Node -> Maybe IDD
lamExpIDD (LamExpNode (LamExp iDD _ _ _ _) _) = Just iDD
lamExpIDD _                                   = Nothing

appExpIDD :: Node -> Maybe IDD
appExpIDD (AppExpNode (AppExp iDD _ _) _) = Just iDD
appExpIDD _                                   = Nothing

caseExpIDD :: Node -> Maybe IDD
caseExpIDD (CaseExpNode (CaseExp iDD _ _ _ _) _) = Just iDD
caseExpIDD _                                   = Nothing

letExpIDD :: Node -> Maybe IDD
letExpIDD (LetExpNode (LetExp iDD _ _ _ _) _) = Just iDD
letExpIDD _                                   = Nothing

identExpIDD :: Node -> Maybe IDD
identExpIDD (IdentExpNode (IdentExp iDD _) _) = Just iDD
identExpIDD _                                   = Nothing

ifExpIDD :: Node -> Maybe IDD
ifExpIDD (IfExpNode (IfExp iDD _ _ _ _ _ _) _) = Just iDD
ifExpIDD _                                   = Nothing

parenExpIDD :: Node -> Maybe IDD
parenExpIDD (ParenExpNode (ParenExp iDD _ _ _) _) = Just iDD
parenExpIDD _                                   = Nothing

listExpIDD :: Node -> Maybe IDD
listExpIDD (ListExpNode (ListExp iDD _ _ _ _) _) = Just iDD
listExpIDD _                                   = Nothing

productExpIDD :: Node -> Maybe IDD
productExpIDD (ProductExpNode (ProductExp iDD _ _ _ _) _) = Just iDD
productExpIDD _                                   = Nothing

altIDD :: Node -> Maybe IDD
altIDD (AltNode (Alt iDD _ _ _ _) _) = Just iDD
altIDD _                                   = Nothing

boardIDD :: Node -> Maybe IDD
boardIDD (BoardNode (Board iDD _ _ _ _ _ _ _ _) _) = Just iDD
boardIDD _                                   = Nothing

boardRowIDD :: Node -> Maybe IDD
boardRowIDD (BoardRowNode (BoardRow iDD _ _ _ _ _ _ _ _) _) = Just iDD
boardRowIDD _                                   = Nothing

queenIDD :: Node -> Maybe IDD
queenIDD (QueenNode (Queen iDD _) _) = Just iDD
queenIDD _                                   = Nothing

kingIDD :: Node -> Maybe IDD
kingIDD (KingNode (King iDD _) _) = Just iDD
kingIDD _                                   = Nothing

bishopIDD :: Node -> Maybe IDD
bishopIDD (BishopNode (Bishop iDD _) _) = Just iDD
bishopIDD _                                   = Nothing

knightIDD :: Node -> Maybe IDD
knightIDD (KnightNode (Knight iDD _) _) = Just iDD
knightIDD _                                   = Nothing

rookIDD :: Node -> Maybe IDD
rookIDD (RookNode (Rook iDD _) _) = Just iDD
rookIDD _                                   = Nothing

pawnIDD :: Node -> Maybe IDD
pawnIDD (PawnNode (Pawn iDD _) _) = Just iDD
pawnIDD _                                   = Nothing

emptyIDD _                                   = Nothing

pPPresentationIDD :: Node -> Maybe IDD
pPPresentationIDD (PPPresentationNode (PPPresentation iDD _ _) _) = Just iDD
pPPresentationIDD _                                   = Nothing

slideIDD :: Node -> Maybe IDD
slideIDD (SlideNode (Slide iDD _ _) _) = Just iDD
slideIDD _                                   = Nothing

itemListIDD :: Node -> Maybe IDD
itemListIDD (ItemListNode (ItemList iDD _ _) _) = Just iDD
itemListIDD _                                   = Nothing

bulletIDD :: Node -> Maybe IDD
bulletIDD (BulletNode (Bullet iDD) _) = Just iDD
bulletIDD _                                   = Nothing

numberIDD :: Node -> Maybe IDD
numberIDD (NumberNode (Number iDD) _) = Just iDD
numberIDD _                                   = Nothing

alphaIDD :: Node -> Maybe IDD
alphaIDD (AlphaNode (Alpha iDD) _) = Just iDD
alphaIDD _                                   = Nothing

stringItemIDD :: Node -> Maybe IDD
stringItemIDD (StringItemNode (StringItem iDD _) _) = Just iDD
stringItemIDD _                                   = Nothing

heliumItemIDD :: Node -> Maybe IDD
heliumItemIDD (HeliumItemNode (HeliumItem iDD _) _) = Just iDD
heliumItemIDD _                                   = Nothing

listItemIDD :: Node -> Maybe IDD
listItemIDD (ListItemNode (ListItem iDD _) _) = Just iDD
listItemIDD _                                   = Nothing

string_IDD :: Node -> Maybe IDD
string_IDD (String_Node (String_ iDD _) _) = Just iDD
string_IDD _                                   = Nothing

bool_IDD :: Node -> Maybe IDD
bool_IDD (Bool_Node (Bool_ iDD _) _) = Just iDD
bool_IDD _                                   = Nothing

int_IDD :: Node -> Maybe IDD
int_IDD (Int_Node (Int_ iDD _) _) = Just iDD
int_IDD _                                   = Nothing




shallowShowEnrichedDoc1 (RootEnr  _ _ _ _ _ _) = "RootEnr"
shallowShowDecl1 (Decl  _ _ _ _ _ _ _ _ _) = "Decl"
shallowShowDecl1 (BoardDecl  _ _ _ _) = "BoardDecl"
shallowShowDecl1 (PPPresentationDecl  _ _ _ _) = "PPPresentationDecl"
shallowShowIdent1 (Ident  _ _ _ _) = "Ident"
shallowShowExp1 (PlusExp  _ _ _ _) = "PlusExp"
shallowShowExp1 (TimesExp  _ _ _ _) = "TimesExp"
shallowShowExp1 (DivExp  _ _ _ _) = "DivExp"
shallowShowExp1 (PowerExp  _ _ _ _) = "PowerExp"
shallowShowExp1 (BoolExp  _ _ _) = "BoolExp"
shallowShowExp1 (IntExp  _ _ _) = "IntExp"
shallowShowExp1 (LamExp  _ _ _ _ _) = "LamExp"
shallowShowExp1 (AppExp  _ _ _) = "AppExp"
shallowShowExp1 (CaseExp  _ _ _ _ _) = "CaseExp"
shallowShowExp1 (LetExp  _ _ _ _ _) = "LetExp"
shallowShowExp1 (IdentExp  _ _) = "IdentExp"
shallowShowExp1 (IfExp  _ _ _ _ _ _ _) = "IfExp"
shallowShowExp1 (ParenExp  _ _ _ _) = "ParenExp"
shallowShowExp1 (ListExp  _ _ _ _ _) = "ListExp"
shallowShowExp1 (ProductExp  _ _ _ _ _) = "ProductExp"
shallowShowAlt1 (Alt  _ _ _ _ _) = "Alt"
shallowShowBoard1 (Board  _ _ _ _ _ _ _ _ _) = "Board"
shallowShowBoardRow1 (BoardRow  _ _ _ _ _ _ _ _ _) = "BoardRow"
shallowShowBoardSquare1 (Queen  _ _) = "Queen"
shallowShowBoardSquare1 (King  _ _) = "King"
shallowShowBoardSquare1 (Bishop  _ _) = "Bishop"
shallowShowBoardSquare1 (Knight  _ _) = "Knight"
shallowShowBoardSquare1 (Rook  _ _) = "Rook"
shallowShowBoardSquare1 (Pawn  _ _) = "Pawn"
shallowShowBoardSquare1 (Empty ) = "Empty"
shallowShowPPPresentation1 (PPPresentation  _ _ _) = "PPPresentation"
shallowShowSlide1 (Slide  _ _ _) = "Slide"
shallowShowItemList1 (ItemList  _ _ _) = "ItemList"
shallowShowListType1 (Bullet  _) = "Bullet"
shallowShowListType1 (Number  _) = "Number"
shallowShowListType1 (Alpha  _) = "Alpha"
shallowShowItem1 (StringItem  _ _) = "StringItem"
shallowShowItem1 (HeliumItem  _ _) = "HeliumItem"
shallowShowItem1 (ListItem  _ _) = "ListItem"
shallowShowString_1 (String_  _ _) = "String_"
shallowShowBool_1 (Bool_  _ _) = "Bool_"
shallowShowInt_1 (Int_  _ _) = "Int_"
shallowShowList_Decl1 (List_Decl  _ _) = "List_Decl"
shallowShowConsList_Decl1 (Cons_Decl  _ _) = "Cons_Decl"
shallowShowConsList_Decl1 (Nil_Decl ) = "Nil_Decl"
shallowShowList_Alt1 (List_Alt  _ _) = "List_Alt"
shallowShowConsList_Alt1 (Cons_Alt  _ _) = "Cons_Alt"
shallowShowConsList_Alt1 (Nil_Alt ) = "Nil_Alt"
shallowShowList_Exp1 (List_Exp  _ _) = "List_Exp"
shallowShowConsList_Exp1 (Cons_Exp  _ _) = "Cons_Exp"
shallowShowConsList_Exp1 (Nil_Exp ) = "Nil_Exp"
shallowShowList_Slide1 (List_Slide  _ _) = "List_Slide"
shallowShowConsList_Slide1 (Cons_Slide  _ _) = "Cons_Slide"
shallowShowConsList_Slide1 (Nil_Slide ) = "Nil_Slide"
shallowShowList_Item1 (List_Item  _ _) = "List_Item"
shallowShowConsList_Item1 (Cons_Item  _ _) = "Cons_Item"
shallowShowConsList_Item1 (Nil_Item ) = "Nil_Item"


