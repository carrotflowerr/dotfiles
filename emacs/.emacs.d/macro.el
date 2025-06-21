;; === MACROS START ===  -*- lexical-binding: t; -*-
;; save macros like this with (insert-kbd-macro)
;; a macro/function to save macros might make sense

;;  " Save buffer and open pdf (.md,.org)"
(defalias 'pdfsave
  (kmacro "C-x C-s C-c C-e l p")
  )

(defalias 'bible-save-quote
   (kmacro "C-x SPC > a C-f C-f C-S-n M-w C-x C-f . e m a <tab> b i b l <tab> <return> C-y <return> <return> C-x C-s"))

;; Open place of random quote (must be on dash)
(defalias 'bible-goto-quote
  (kmacro "C-x SPC > a C-f C-f C-SPC M-f M-f M-f M-w C-c M-b C-s C-y <return>")
  )

(defalias 'encrypt #'epa-encrypt-file)
;; maybe a binding for text hook?

(defalias 'yank-line
   (kmacro "C-a C-S-e M-w C-a"))

(defalias 'edit-key-chords
   (kmacro "C-x C-f . e m a <tab> p a c k <tab> <return> C-s k e y - c h o r d <return>"))

(defalias 'theme-toggle
   (kmacro "M-x t h e m e - c h o o s e - v a r i a n t <return> <return>"))


;; === MACROS END ===
