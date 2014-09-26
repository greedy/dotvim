syntax clear

syn match capnpComment /#.*$/
syn match capnpNumber /\([-+]\|\<\)0x\x\+\>/
syn match capnpFloat /[-+]\?\<inf\>/
syn match capnpFloat /[-+]\?\<inf\>/
syn match capnpFloat /\<nan\>/
syn match capnpNumber /\([-+]\|\<\)\d\+\>/
syn match capnpFloat /\([-+]\|\<\)\d\+\.\d*\>/
syn match capnpFloat /\([-+]\|\<\)\d\+\(\.\d*\)\?e[-+]\?\d\+\>/
syn match capnpFloat /\([-+]\|\<\)\.\d\+\(e[-+]\?\d\+\)\?\>/
syn match capnpBoolean /\<\(true\|false\)\>/
syn match capnpConstant /\<void\>/
syn match capnpKeyword /\<\(using\|const\|import\|extends\)\>/
syn match capnpStructure /\<\(annotation\|struct\|enum\|interface\|union\)\>/ nextgroup=capnpTypeName skipwhite
syn match capnpTypeName /\<\K\k*\>/ contained
syn match capnpFieldName /\<\K\k*\>\ze\s\+@/ 
syn match capnpFieldName /\<\K\k*\>\ze\s\+:/
" syn region capnpType start=/:/ end=/\ze\(,\|)\|;\|{\|=\)/
syn match capnpType /:\_.\{-}\ze[^[:alnum:][:space:].]/ nextgroup=capnpTypeParameter
syn region capnpTypeParameter start=/(/ end=/)/ contained contains=capnpTypeParameter
syn region capnpAnnotationBody start=/(/ end=/)/ contained contains=capnpString,capnpNumber,capnpFloat
syn match capnpAnnotation /\$\K\(\.\|\k\)*/ skipwhite nextgroup=capnpAnnotationBody
syn match capnpId /@\d\+/
syn match capnpId /@0x\x\+/
syn region capnpString start=+\(0x\)\?"+ end=+"+ skip=+\\"+

hi def link capnpComment Comment
hi def link capnpSpecial Special
hi def link capnpKeyword Keyword
hi def link capnpIdentifier Identifier
hi def link capnpType Type
hi def link capnpTypeParameter capnpType
hi def link capnpStructure Structure
hi def link capnpNumber Number
hi def link capnpFloat Float
hi def link capnpString String
hi def link capnpAnnotation Function
hi def link capnpAnnotationBody capnpAnnotation
hi def link capnpBoolean Boolean
hi def link capnpConstant Constant

hi def link capnpId capnpSpecial

hi def link capnpTypeName capnpIdentifier
