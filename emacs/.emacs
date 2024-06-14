;; 3rd party package thing
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; MELPA, another package repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Evil 
(require 'evil)
(evil-mode 1)
(setq evil-respect-visual-line-mode t)
;;(evil-global-set-key 'motion "j" 'evil-next-visual-line) ;; this is mega-retarded
;;(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t)
 '(custom-enabled-themes '(whiteboard))
 '(custom-safe-themes
   '("e7ce09ff7426c9a290d06531edc4934dd05d9ea29713f9aabff834217dbb08e4" "b6c43bb2aea78890cf6bd4a970e6e0277d2daf0075272817ea8bb53f9c6a7f0a" "91c008faf603a28d026957120a5a924a3c8fff0e12331abf5e04c0e9dd310c65" "0ed3d96a506b89c1029a1ed904b11b5adcebeb2e0c16098c99c0ad95cb124729" "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" default))
 '(display-line-numbers-type 'relative)
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(indicate-buffer-boundaries 'left)
 '(inhibit-startup-screen t)
 '(org-agenda-files nil)
 '(package-vc-selected-packages
   '((light-dashboard :vc-backend Git :url "https://github.com/ichernyshovvv/light-dashboard" :branch "master")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight regular :height 113 :width normal)))))

;; Line wrap
(global-visual-line-mode t)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'prog-mode-hook 'visual-line-mode)


;;(require 'epa-file)
;;(epa-file-enable)


;; Stores backups in .emacs.d/backups/
(setq backup-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/backups"))))

;; Go to symbolic links automatically
(setq vc-follow-symlinks t)

(setq-default mode-line-format
              (list
               ;; status
               '(:eval (if (buffer-modified-p)
                           " *"
                         " "))
               '(:eval (if buffer-read-only
                           " RO "
                         " "))
               ;; file name
               '(:eval (or (buffer-file-name) (buffer-name)))
               "  "
               ;; line and column numbers
               "Line: %l Col: %c  "
               ;; major mode
               'mode-line-modes
               ))

;; Make sure the mode line updates
(force-mode-line-update t)

;; Enable which-key mode
(require 'which-key)
(which-key-mode)

;; Font
;;(set-frame-font "Iosevka-12" nil t)
(when (member "Iosevka" (font-family-list))
  (set-face-attribute 'default nil :font "Iosevka-12"))


;; Disable save prompts when killing a buffer
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function kill-buffer-query-functions))

;; Automatically save buffers when they lose focus
(defun save-buffer-if-visiting-file ()
  (when (and (buffer-file-name) (buffer-modified-p))
    (save-buffer)))
(add-hook 'focus-out-hook 'save-buffer-if-visiting-file)
(add-hook 'kill-buffer-hook 'save-buffer-if-visiting-file)

;; Do not prompt to save when exiting Emacs
(setq confirm-kill-emacs nil)

;; Bindings

;; Spell check
(setq ispell-program-name "/usr/bin/ispell")
(global-set-key (kbd "C-;") 'ispell)

;; Terminal
(global-set-key (kbd "C-`") 'eshell)

;; Bongo, music player
(global-set-key (kbd "C-c m") 'bongo)

;; Save place in file
(save-place-mode 1)
(setq save-place-file (expand-file-name "places" user-emacs-directory))

;; Auto-complete pairs.
(smartparens-global-mode 1)

;; Padding
(require 'spacious-padding)
(spacious-padding-mode 1)

;; Minibuffer Stuff

;; Completion
(require 'vertico)
(vertico-mode 1)

;; -- START OF ORG MODE CONFIG --

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(use-package org
  :pin gnu)

;; Follow the links
(setq org-return-follows-link  t)

;; Associate all org files with org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Make the indentation look nicer
(add-hook 'org-mode-hook 'org-indent-mode)

;; Remap the change priority keys to use the UP or DOWN key
(define-key org-mode-map (kbd "C-c <up>") 'org-priority-up)
(define-key org-mode-map (kbd "C-c <down>") 'org-priority-down)

;; Wrap the lines in org mode so that things are easier to read
(add-hook 'org-mode-hook 'visual-line-mode)

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 1.6 :underline nil))))))

;; -- END OF ORG MODE CONFIG --
