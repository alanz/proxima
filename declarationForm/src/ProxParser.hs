module ProxParser where

import Common.CommonTypes hiding (Dirty (..))
import qualified Common.CommonTypes
import Presentation.PresLayerTypes
import Presentation.PresLayerUtils
import Presentation.PresentationParsing
import Presentation.XprezLib

import List hiding (delete)


import ProxParser_Generated
import Evaluation.DocumentEdit
import DocUtils_Generated

import Char

import DocTypes_Generated
import DocUtils_Generated
              
-------------------- Proxima Parser/Structure Recognizer -------------------- 

{-
recognizeEnrichedDoc :: ListParser Document Node ClipDoc UserToken EnrichedDoc
recognizeEnrichedDoc = pStr $ 
          (\str trees trees2-> reuseRootEnr [str] (Just trees) (Just trees2))
      <$> pStructural Node_RootEnr
      <*> recognizeList_Tree
      <*> recognizeList_Tree
--      <*> pPrs parseTree
-}

recognizeEnrichedDoc :: ListParser Document Node ClipDoc UserToken EnrichedDoc
recognizeEnrichedDoc = pStructural

pDescription :: ProxParser Description
pDescription = Description 
  <$> pLine


pStyledText :: ProxParser StyledText
pStyledText = 
          (\ws -> reuseStyledText [] (Just (toList_Word ws)))
      <$  pList (pKey " ") 
      <*> pList pWord'

pWord' = (\ps -> Word $ toList_WordPart ps) <$> 
         pList1 pWordPart <*  pList (pKey " ")  


pWordPart = (\word -> reuseWordPart [] (Just $ getTokenIDP word) (Just $ tokenString word)) <$>
          pToken WordTk
 <|> OpenTag TextBold <$ pStyleTag ScannedBold Start
 <|> OpenTag TextItalic <$ pStyleTag ScannedItalic Start
 <|> (\t -> let (r,g,b) = getTokenColor t in OpenTag (TextColor r g b)) <$> pColorTag Start                                
 <|> CloseTag TextBold <$ pStyleTag ScannedBold End
 <|> CloseTag TextItalic <$ pStyleTag ScannedItalic End
 <|> (\t -> let (r,g,b) = getTokenColor t in CloseTag (TextColor r g b)) <$> pColorTag End -- pStyleTag (ScannedColored (0,0,0)) End
  
pKey str  = pToken (KeyTk str)

{-
pStyledText :: ProxParser StyledText
pStyledText = StyledText . toList_StringOrStyled <$> pList pStringOrStyled 

pStringOrStyled :: ProxParser StringOrStyled
pStringOrStyled = pString <|> pStyle

pString = (\word -> reuseString [] (Just $ getTokenIDP word) (Just $ tokenString word)) <$>
          pToken WordTk
pStyle = (\_ styled _ -> Styled TextBold styled) <$> pStyleTag Bold Start <*> pStyledText <*> pStyleTag Bold End
     <|> (\_ styled _ -> Styled TextItalic styled) <$> pStyleTag Italic Start <*> pStyledText <*> pStyleTag Italic End
     <|> (\_ styled _ -> Styled TextRed styled) <$> pStyleTag (Colored (255,0,0)) Start <*> pStyledText <*> pStyleTag (Colored (255,0,0)) End

-}


pLine = 
      (\spcs wrds -> spcs ++ concat wrds)
  <$> pSpaces <*> pList ((++) <$> pWord <*> pSpaces)

pSpaces = concat <$> pList (const " " <$> pToken (KeyTk " "))

pWord = tokenString <$> pToken WordTk




pStyleTag :: ScannedStyle -> StartOrEnd -> ProxParser (Token Document Node ClipDoc UserToken)
pStyleTag style startorend = pSym $ StyleTk 0 (ScannedStyleTag style startorend)

pColorTag :: StartOrEnd -> ProxParser (Token Document Node ClipDoc UserToken)
pColorTag startOrEnd = pSym (StyleTk 0 (ScannedStyleTag (ScannedColored (0,0,0)) startOrEnd))

pFloat = read . tokenString <$> pToken FloatTk

pInt_ :: ProxParser Int_
pInt_ = toInt_ . round
  <$> pFloat
  <|> pSucceed (toInt_ 0)
  
pFloat_ :: ProxParser Float_
pFloat_ = toFloat_
  <$> pFloat

{-
intParser :: ListParser Document Node ClipDoc UserToken Int
intParser = 0 
      <$ pToken LeafToken
      <* pToken IntToken


pTree = pLeaf <|> pBin

pLeaf = pStructuralConstr Node_Leaf
{-
          (\str t -> reuseLeaf [str] (Just $ read $ tokenString t))
      <$> pToken LeafToken
      <*> pToken IntToken
-}
     
pBin :: ListParser Document Node ClipDoc UserToken Tree
pBin = 
          (\bin open1 left close1 open2 right close2 -> 
              reuseBin [bin] (Just $ getTokenIDP bin) (Just $ getTokenIDP open1) (Just $ getTokenIDP close1) (Just $ getTokenIDP open2) (Just $ getTokenIDP close2) (Just left) (Just right))
      <$> pToken BinToken
      <*> pToken (SymToken "(")
      <*> pTree
      <*> pToken (SymToken ")")      
      <*> pToken (SymToken "(")
      <*> pTree
      <*> pToken (SymToken ")")      


recognizeList_Tree :: ListParser Document Node ClipDoc UserToken List_Tree
recognizeList_Tree = pStr $
          (\str trees -> reuseList_Tree [str] (Just $ toConsList_Tree trees))
      <$> pStructuralTk Node_List_Tree
      <*> pList recognizeTree


recognizeTree :: ListParser Document Node ClipDoc UserToken Tree
recognizeTree = pStr $
          (\str left right -> reuseBin [str] Nothing Nothing Nothing Nothing Nothing (Just left) (Just right))
      <$> pStructuralTk Node_Bin
      <*> recognizeTree
      <*> recognizeTree
--      <*  recognizeTree
  <|>     (\str -> reuseLeaf [str] Nothing Nothing Nothing)
      <$> pStructuralTk Node_Leaf
-}