if exists("b:current_syntax")
    finish
endif

syn match titledec /^#\+ /
syn match projdec /^@\+ /

syn match DraculaOrange /\v^\@\+ \zs.*$/

syn match quote / ["'`].\{-}["'`][\$.,?! ]/
syn match tag /<.\{-}>/
syn match DraculaPink / [*].\{-}[*][.,?! ]/ "Emphasis *...*
syn match DraculaPink /\. / "Fullstops
syn match DraculaYellow /^---\_.\{-}---$/ "YamlContainer
syn match DraculaOrange /^TODO:/ "Todo Marker
syn match DraculaGreen /^DONE:/  "Todo Marker
syn match DraculaRed /^LATE:/  "Todo Marker
syn match DraculaRed /^FAIL:/  "Todo Marker
syn match DraculaPurple /^* /  "List Marker
syn match DraculaPurple /^\d\. / "Numbered List Marker


hi link titledec Function
hi link projdec Function
hi link quote Function

let b:current_syntax = "ejrnl"
