;; === MACROS START ===
;; save macros like this with (insert-kbd-macro)

;; Save buffer and open pdf (.md,.org)
(defalias 'pdfsave
   (kmacro "C-x C-s C-c C-e l p"))

(defalias 'bible-save-quote
   (kmacro "C-x SPC > a C-f C-f C-S-n M-w C-x C-f . e m a <tab> b i b l <tab> <return> C-y <return> <return> C-x C-s"))

;; Open place of random quote (must be on dash)
(defalias 'bible-goto-quote
  (kmacro "C-x SPC > a C-f C-f C-SPC M-f M-f M-f M-w C-c M-b C-s C-y <return>")
  )

(defalias 'encrypt #'epa-encrypt-file)
;; maybe a binding for text hook?

;; === MACROS END ===
