(defun open-interactive-shell ()
  "Open an interactive shell in the right window."
  (interactive)
  (split-window-right)         ; Split the frame into two windows (left and right).
  (other-window 1)             ; Move to the right window.
  (shell))                    ; Start the shell in the right window.

(global-set-key (kbd "C-c s") 'open-interactive-shell)



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t)
 '(custom-enabled-themes '(misterioso))
 '(delete-selection-mode nil)
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(size-indication-mode t)
 '(tab-bar-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Bind Tab key to indent-for-tab-command
(define-key global-map (kbd "TAB") 'indent-for-tab-command)
;

;; Bind C-s to save
(define-key global-map (kbd "C-s") 'save-buffer)

;; Bind / to search
(define-key global-map (kbd "/") 'isearch-forward-regexp)


;; Bind C-a to mark-whole-buffer
(define-key global-map (kbd "C-a") 'mark-whole-buffer)













