;; M-;
(comment-dwim)




;; C-M-f
;; C-M-b
;; jump between parens and quotes
;; like % in vim
(foward-sexp)

;; C-x 0
;; rebind pls
(delete-window)


;; zoom
C-x C-=

;; c-$(num) adds c-u

;; M-e
(forward-sentence)

;; Encrypt file
;; maybe rename to gpg or encrypt
(epa-encrypt-file)

;; Available key binds
(free-keys)

;; M-()
(insert-parentheses)
;; this for quotes would be nice
;; open new window
(make-frame)

;; Macro commands

;; enter macro editor
;; (C-x) (C-e)
(kmacro-edit-macro)

;; M-y clipboard

;; Keyboard Macro Editor.  Press C-c C-c to finish; press C-x k RET to cancel.
;; Original keys: C-x SPC > 2*C-f C-SPC 3*M-f M-w C-x M-b C-s C-y RET

Command: last-kbd-macro
Key: none

Macro:

C-x SPC			;; ace-jump-mode
>			;; self-insert-command
2*C-f			;; forward-char
C-SPC			;; set-mark-command
3*M-f			;; forward-word
M-w			;; kill-ring-save
C-x M-b			;; bible
C-s			;; phi-search
C-y			;; yank
RET			;; newline
