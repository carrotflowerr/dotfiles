;; Full docs
;; this is here because it's system specific.
(add-to-list 'Info-directory-list "/home/shell/Documents/source/emacs/info/")
(load "~/.emacs.d/macro.el")
;; channer
;;(load "~/.emacs.d/elpa/q4/q4.el")


;; === PACKAGES START ===

;; Initialize package.el and add MELPA repo
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


(use-package keyfreq
  :ensure t
  ;; (require 'keyfreq)
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  ;; exclude q4?
  )

(use-package hydra
  :ensure t

  :config

  (defhydra hydra-interface (:color blue :hint nil)
    "
Interface
"
    ("m" dashboard-open "dashboard")
    ("c" calendar "calendar")
    ("r" elfeed "elfeed")
    ("s" scratch-buffer "scratch")
    ("q" nil "quit"))

  (global-set-key (kbd "C-c m") 'hydra-interface/body)

  )



(use-package key-chord
  :ensure t
  :config
  (key-chord-mode)
  ;; chords
  (key-chord-define-global ",." 'god-mode-all) ;; weird  
  (key-chord-define-global "xf" 'jump-char-forward)
  (key-chord-define-global "XF" 'jump-char-backward)
  (key-chord-define-global "yl" 'yank-line)
  (key-chord-define-global "4c" 'q4/browse-board) ;; (retarded)
  (key-chord-define-global "kc" 'edit-key-chords)
  
)

(use-package eww
  :defer t
  :custom (eww-retrieve-command nil)
  :config

  (defun wiki (page)
    "Search wikipedia for info on a specific term"
    (interactive (list (completing-read "Search Term: " nil)))
    (eww (format "https://en.wikipedia.org/wiki/%s" page)))

  (defun my/eww-readablity ()
    (interactive)
    (let ((eww-retrieve-command '("rdrview" "-H")))
      (eww-reload nil nil)))
  ;; I think this slows rendering down
)

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

;; (use-package doom-modeline
;;   :ensure t
;;   :config
;;   (doom-modeline-mode)
;;   (setq nerd-icons-color-icons nil)


;;   )


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
  (setq dashboard-footer-messages (read-lines "~/.emacs.d/jps.txt")
;;  (setq dashboard-footer-messages (read-lines "~/.note/mywords")
	)

  ;; (setq dashboard-startup-banner "~/.emacs.d/elpa/dashboard-20250227.121/banners/logo.svg" "~/.emacs.d/elpa/dashboard-20250227.121/banners/splash.svg" "~/.emacs.d/elpa/dashboard-20250227.121/banners/gnu.svg")

  (setq dashboard-startup-banner
	(list
	 "~/.emacs.d/elpa/dashboard-20250227.121/banners/logo.svg"
	 "~/.emacs.d/elpa/dashboard-20250227.121/banners/splash.svg"
	;; "~/.emacs.d/elpa/dashboard-20250227.121/banners/resized-gnu.svg")
	))


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
;; (use-package buffer-terminator
;;   :ensure t

;;   :custom
;;   (buffer-terminator-verbose nil)
;;   :config
;;   (buffer-terminator-mode 1)
;;   (setq buffer-terminator-verbose t)
;;   (setq buffer-terminator-inactivity-timeout (* 30 60)) ; 30 minutes
;;   ;; defines what is inactive
;;   (customize-set-variable 'buffer-terminator-interval (* 10 60)) ; 10 minutes
;;   ;; how often checks for inactive

;;   )

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
(electric-pair-mode)
(electric-quote-mode)
;; this should replace smartparens. if it does, mode to init.el
;; (use-package smartparens
;;   :ensure t

;;   :config
;;   (smartparens-global-mode 1)
;;   (smartparens-strict-mode 1)
;;   ;;  (sp-pair "<" ">")

;;   )




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
  :init (marginalia-mode 1)
  )



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
 gptel-backend (gptel-make-ollama "Ollama"
		 :host "localhost:11434"
		 :stream t
		 :models '(
			   mistral:7b-instruct-q4_0
			   deepseek-r1:latest
			   tinyllama:latest
			   )
		 )
 )

(setq gptel-model 'mistral:7b-instruct-q4_0)


;; company mode, autocompletion
(use-package company
    :ensure t
    :config
    (add-hook 'after-init-hook 'global-company-mode)
    (global-company-mode 1)
    )

;; PACKAGES END
