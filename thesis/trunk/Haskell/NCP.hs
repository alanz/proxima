module Main where

import Layers


type LayerFunction horArg vertArg horRes vertRes = 
       horArg -> vertArg -> (horRes, vertRes)  --

-- code for haskell.xml
data LayerC h0 h1 doc pres gest upd =
       LayerC { presentC ::   LayerFunction h0 doc h1 pres
              , translateC :: LayerFunction h1 gest h0 upd
              }

composeDown :: LayerFunction horArgU arg horResU interm ->
               LayerFunction horArgL interm horResL res ->
               LayerFunction (horArgU, horArgL) arg (horResU,horResL) res
composeDown upper lower = 
  \(horArgU, horArgL) arg ->                                           
    let (horResU, interm) = upper horArgU arg       --
        (horResL, res)    = lower horArgL interm    --      
    in  ((horResU,horResL), res)                    --


composeUp :: LayerFunction horArgU interm horResU res ->
             LayerFunction horArgL arg horResL interm ->
             LayerFunction (horArgU, horArgL) arg (horResU,horResL) res
composeUp upper lower = 
  \(horArgU, horArgL) arg ->
    let (horResL, interm) = lower horArgL arg
        (horResU, res)    = upper horArgU interm            
    in  ((horResU,horResL), res)

-- problem, when we combine, the thing is no longer a Simple'.

lift :: Simple a b c d e f -> LayerC a (b,a) c d e f
lift simple = 
  LayerC { presentC = present simple
         , translateC = translate simple
         }

combine :: LayerC a b c d e f -> LayerC g h d i j e -> 
           LayerC (a,g) (b,h) c i j f
combine upper lower =
  LayerC { presentC = composeDown (presentC upper) (presentC lower)
         , translateC = composeUp (translateC upper) (translateC lower)
         }

combine' :: Simple' a b c d e f -> Simple' g a d h i e -> 
           Simple' (a,g) (b,a) c h i f
combine' upper lower =
  Simple' { present' = composeDown (present' upper) (present' lower)
          , translate' = composeUp (translate' upper) (translate' lower)
          }
{-data Simple' state mapping doc pres gest upd =
       Simple' { present' ::   LayerFunction state doc (mapping, state) pres
               , translate' :: LayerFunction (mapping, state) gest state upd
               }
-}

{-

result is (mapping, (mapping,...)), but arg is ((mapping, state), ((mapping,state), ...))))  

handling the h params at loop level is only possible when they are not connected like this.

Solution: special combinator combUp and combDown, specific to h params and h args
Or: wrap simples so htypes match. 
-}


main' layer0 layer1 layer2 = 
 do { (state0, state1, state2) <- initStates
    ; doc <- initDoc 
    ; let layers = lift layer0 `combine` lift layer1 `combine` lift  layer2
    ; editLoop layers ((state0, state1), state2) doc
    }

editLoop layers states doc = loop states doc
 where loop states doc = 
        do { -- Compute rendering:
             let (mappingsStates, pres) = presentC layers states doc
           
           ; showRendering pres
           ; gest <- getGesture
 
             -- Compute document update:
           ; let (states', update) = translateC layers mappingsStates gest
       
           ; let doc' = updateDocument update doc
           ; loop states' doc'
           }

