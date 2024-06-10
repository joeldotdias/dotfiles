; identifier
(identifier) @variable

; types
(integer) @number
(boolean) @boolean
(char) @string
(string) @string

; brackets
[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
]@punctuation.bracket


; keywords
[
  "let"
  "fn"
  "return"
]@keyword

[
 "if"
 "else"
 ] @keyword.conditional

; operators
[
 "="
 "=="
 "!="
 ">"
 "<"
 ">="
 "<="
 "+"
 "-"
 "*"
 "/"
 "%"
] @operator

((call
  function: (identifier) @function.builtin)
  (#match? @function.builtin "^write|len|first|last|strip_start|append"))

(call function: (identifier) @function.call)

; [
 ; "&&"
;  "||"
;  "!"
; ] @keyword.operator

(line_comment) @comment
