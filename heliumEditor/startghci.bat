@echo off
ghci src/Main.hs -package lang -cpp -fglasgow-exts -fallow-undecidable-instances -fno-monomorphism-restriction -package wx -isrc -i../proxima/src/evaluation -i../proxima/src/presentation -i../proxima/src/layout -i../proxima/src/arrangement -i../proxima/src/rendering -i../proxima/src/main -i../proxima/src/common                                          %*    -i../parsec -i../lvm/src/lib/common:../lvm/src/lib/common/ghc:../lvm/src/lib/lvm:../lvm/src/lib/asm:../lvm/src/lib/core -i../heliumNT/src/syntax:../heliumNT/src/parser:../heliumNT/src/main:../heliumNT/src/utils:../heliumNT/src/modulesystem:../heliumNT/src/staticanalysis/constraints:../heliumNT/src/staticanalysis/inferencers:../heliumNT/src/staticanalysis/inferencers/typingstrategies:../heliumNT/src/staticanalysis/solvers:../heliumNT/src/staticanalysis/solvers/typegraph:../heliumNT/src/staticanalysis/solvers/typegraphheuristics:../heliumNT/src/staticanalysis/messages:../heliumNT/src/staticanalysis/staticchecks:../heliumNT/src/staticanalysis/types:../heliumNT/src/codegeneration:../Top/src:../heliumNT/src/staticanalysis/miscellaneous:../heliumNT/src/staticanalysis/directives:../heliumNT/src/staticanalysis/heuristics -fallow-overlapping-instances

rem -cpp is slow. Only turn on when compiling modules with preprocessor directives,
rem once compiled, the object files may be used