{
module ScannerSheetHS where


import DocTypes_Generated
import Layout.ScanLib
}

$digit = 0-9
$char = .#[\n\ ]

tokens :-
  \n                              { mkToken $ \s -> KeyTk s }
  \                               { mkToken $ \s -> KeyTk s }
--  [0-9]+                        { mkToken $ \s -> IntToken }
--  [\(\)]                        { mkToken $ \s -> SymToken s }
  $digit[+\.$digit+]?             { mkToken $ \s -> FloatTk }
  $char+                          { mkToken $ \s -> WordTk }

{
}
--  in case of a lexical error from Alex, just add a single quote here. (total should be even)
