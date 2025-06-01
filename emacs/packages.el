;; Sat May 31 03:19:03 PM MDT 2025




;; === PACKAGES START ===

;; Initialize package.el and add MELPA repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun vterm-right()
  (interactive)
  (split-window-right)
  (vterm)
  )

;; Terminal keybinding for vterm
(use-package vterm
  :config 
;;c  (term "/bin/bash")
  ;;(global-set-key (kbd "C-`") 'multi-vterm) 
  (global-set-key (kbd "C-`") #'vterm-right) 
)

(use-package key-chord
  :ensure t
  :config
  ;; chords
  (key-chord-define-global "xf" 'jump-char-forward)

  
  )

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode)
;;  (setq nerd-icons-color-icons nil)

  
  )


(use-package ace-jump-mode
  :ensure t
  :config
  (global-set-key (kbd "C-x SPC") 'ace-jump-mode)
  )

(use-package goto-last-change
  :ensure t
  :config
  (global-set-key(kbd "C-x C-x") 'goto-last-change)
  )

(use-package which-key
  :ensure t
  :config 
  (which-key-mode 1)
)

;; error checking
(use-package flycheck
  :ensure t
  :config 
  
  (add-hook 'after-init-hook #'global-flycheck-mode)

  )





(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)

  )

;; Might be obsolete because of ace-jump
(use-package jump-char
  :ensure t
  :config
  (global-set-key (kbd "C-c f") 'jump-char-forward)
  (global-set-key (kbd "C-c F") 'jump-char-backward)
  
  )

;; http://ergoemacs.org/emacs/elisp_read_file_content.html
;; This is part of dashboard config.

(defun read-lines (filePath)
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

;; Dashboard (MELPA)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (setq dashboard-footer-messages (read-lines "~/.emacs.d/jps.txt"))
  
  
  )


  
  

(defun bible ()
  "Open the bible."
  
  (interactive)
  (find-file "~/.emacs.d/jps.txt")
  ) 

(global-set-key (kbd "C-c M-b") 'bible)





;; which-key??
;; conflitcs with doom-modeline
;; (use-package powerline
;;   :ensure t
;;   :config
;;   (powerline-vim-theme)
;;   )

;; Window management
(use-package golden-ratio
  :ensure t

  :config
  (require 'golden-ratio)
;;  (golden-ratio-mode 1)
)


;; Buffer Terminator (from MELPA)
(use-package buffer-terminator
  :ensure t

  :custom
  (buffer-terminator-verbose nil)
  :config
  (buffer-terminator-mode 1)
  (setq buffer-terminator-verbose t)
  (setq buffer-terminator-inactivity-timeout (* 30 60)) ; 30 minutes
  ;; defines what is inactive
  (customize-set-variable 'buffer-terminator-interval (* 10 60)) ; 10 minutes
  ;; how often checks for inactive
  
  )

;; https://github.com/zk-phi/phi-search
;; I would like to be an isearch purist, but for now I will try phi
(use-package phi-search
  :ensure t
  :config
  (global-set-key (kbd "C-s") 'phi-search)
  (global-set-key (kbd "C-r") 'phi-search-backward)
  (global-set-key (kbd "M-%") 'phi-replace-query)
  
  )

;; Multiple-cursors
(use-package multiple-cursors
  :ensure t

  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (setq mc/always-run-for-all t)
  )

;; Save place in file
(save-place-local-mode 1) ;; persistent
(setq save-place-file (expand-file-name "places" user-emacs-directory))



;; Smartparens (MELPA)
(use-package smartparens
  :ensure t

  :config
  (smartparens-global-mode 1)
  (smartparens-strict-mode 1)
  (sp-pair "<" ">")

  )




;; Spacious Padding (MELPA)
(use-package spacious-padding
  :ensure t

  :config
  (spacious-padding-mode 1))

;; Vertico for Completion (MELPA)
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

;; I like this
;; annotated minibuf
(use-package marginalia
  :ensure t
  :init (marginalia-mode 1))



;; Disable normal movement
(use-package guru-mode
  :ensure t
  :config
  (guru-global-mode))

;; use markdown mode for markdown files
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))



;; Run local LLM
(setq
 gptel-model 'tinyllama:latest
 gptel-backend (gptel-make-ollama "Ollama"
                 :host "localhost:11434"
                 :stream t
                 :models '(tinyllama:latest)))


;; company mode, autocompletion
(use-package company
    :ensure t
    :config
    (add-hook 'after-init-hook 'global-company-mode)
    (global-company-mode 1)
  )

;; PACKAGES END
