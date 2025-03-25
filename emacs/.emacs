;; Bootstrap straight.el
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

;; Initialize package.el and add MELPA repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Automatically save buffers when they lose focus
(defun save-buffer-if-visiting-file ()
  (when (and (buffer-file-name) (buffer-modified-p))
    (save-buffer)))
(add-hook 'focus-out-hook 'save-buffer-if-visiting-file)
(add-hook 'kill-buffer-hook 'save-buffer-if-visiting-file)

;; Disable save prompts when killing a buffer
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function kill-buffer-query-functions))
;; Disable auto-save files
(setq auto-save-default nil)

;; Buffer Terminator (from MELPA)
(use-package buffer-terminator
  :custom
  (buffer-terminator-verbose nil)
  :config
  (buffer-terminator-mode 1))
(setq buffer-terminator-verbose t)
(setq buffer-terminator-inactivity-timeout (* 10 60)) ; 30 minutes
;; defines what is inactive
(customize-set-variable 'buffer-terminator-interval (* 5 60)) ; 10 minutes
;; how often checks for inactive

;; Remind things from diary (calander)
(require 'appt)
(appt-activate 1) 
(add-hook 'diary-hook 'appt-make-list) 
(setq appt-display-mode 'window)
;; change to modeline if you want it in minibuf

;; Common shortcuts
(global-set-key (kbd "C-c s") 'scratch-buffer)
(global-set-key (kbd "C-c c") 'calendar)

;; Terminal keybinding for vterm
(use-package vterm
  :config 
;;c  (term "/bin/bash")
  (global-set-key (kbd "C-`") 'vterm)
)

;; Syntax highlighting 
(setq font-lock-maximum-decoration t)


;; Date hotkey
;; same format for putting any shell output into buf
(defun insert-date ()
  "Insert the current date into the buffer."
  (interactive)
  (insert (shell-command-to-string "date")))
(global-set-key (kbd "C-c d") 'insert-date)



;; Dictionary (localhost is dictd)
(global-set-key (kbd "C-c l") #'dictionary-lookup-definition)
(setq dictionary-server "localhost")

;; Window management
(require 'golden-ratio)
(golden-ratio-mode 1)

;; Line wrap
(global-visual-line-mode t)
(add-hook 'prog-mode-hook 'visual-line-mode)

;; Dashboard (MELPA)
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice
        (lambda () (get-buffer-create dashboard-buffer-name))))

;; Do not prompt to save when exiting Emacs
(setq confirm-kill-emacs nil)

;; Spell check for text files using flyspell (built-in)
(add-hook 'text-mode-hook 'flyspell-mode)
(eval-after-load 'flyspell
  '(progn
     (define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-word)
     (define-key flyspell-mouse-map (kbd "<mouse-2>") nil)))


;; Set eww as default browser
(setq browse-url-browser-function 'eww-browse-ur)
(setq eww-download-directory "~/.emacs.d/eww/")

;; Bind C-x C-k to kill-buffer-and-window
(global-unset-key (kbd "C-x 4 0"))
;;(global-unset-key (kbd "C-x 5 0"))
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)
;; kills buffer not interactive.  


;; C-x C-b runs ibuffer instead of just listing buffers
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b")'ibuffer)


;; Unbind weird fill command
(global-unset-key (kbd "C-x f"))


;; PACKAGES START




;; Multiple-cursors
(use-package multiple-cursors
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
)

;; Save place in file
(save-place-mode 1)
(setq save-place-file (expand-file-name "places" user-emacs-directory))


;; Smartparens (MELPA)
(use-package smartparens
  :config
  (smartparens-global-mode 1)
  (smartparens-strict-mode 1))
(global-set-key (kbd "C-x a") 'mark-whole-buffer)


;; Spacious Padding (MELPA)
(use-package spacious-padding
  :config
  (spacious-padding-mode 1))

;; Vertico for Completion (MELPA)
(use-package vertico
  :config
  (vertico-mode 1))

;; Disable normal movement
(use-package guru-mode
  :config
  (guru-global-mode))

;; use markdown mode for markdown files
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(require 'powerline)
(powerline-nano-theme)


;; Run local LLM
(setq
 gptel-model 'tinyllama:latest
 gptel-backend (gptel-make-ollama "Ollama"
                 :host "localhost:11434"
                 :stream t
                 :models '(tinyllama:latest)))


;; PACKAGES END


;; company mode, autocompletion
  (add-hook 'after-init-hook 'global-company-mode)



;; Custom-set variables and faces (managed by Emacs Custom)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(bongo-enabled-backends '(mpv))
;; '(cua-mode t)
 '(custom-enabled-themes '(nano-dark))
 '(custom-safe-themes
   '("b8bd60a23b9e2f08b0c437231ee84f2dacc70fdc4d5a0fb87229bb9926273fdd"
     "dc15dbd4b0a00c64610fd4379a89424e0be1b418f09457e0f062cac931e8ca82"
     "cb024671ccb98c3ee7583e32df4bfdb50044dada87064e8fcf0fea2357ba7dd9"
     "1781e8bccbd8869472c09b744899ff4174d23e4f7517b8a6c721100288311fa5"
     "de8f2d8b64627535871495d6fe65b7d0070c4a1eb51550ce258cd240ff9394b0"
     "acfe7ff6aacb9432f124cde4e35d6d2b4bc52916411de73a6ccded9750c9fa97"
     "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02"
     default))
 '(desktop-save-mode t)
 '(display-time-mode t)
 '(elfeed-feeds
   '(">News" "http://feeds.bbci.co.uk/news/rss.xml?edition=int"
     "http://rss.cnn.com/rss/edition_world.rss"
     "https://feeds.npr.org/1002/rss.xml"
     "http://vox.com/rss/index.xml"
     "https://en.wikinews.org/w/index.php?title=Special:NewsFeed&feed=atom&categories=Published&notcategories=No%20publish%7CArchived%7CAutoArchived%7Cdisputed&namespace=0&count=30&hourcount=124&ordermethod=categoryadd&stablepages=only"
     ">cybersecurity" "https://www.eff.org/rss/updates.xml"
     "https://digdeeper.club/atom.xml"
     "https://blog.g0tmi1k.com/atom.xml"
     "https://feeds.feedburner.com/securityintelligence/feed/news"
     "https://rss.packetstormsecurity.com/"
     "https://reclaimthenet.org/feed/"
     "https://www.schneier.com/blog/atom.xml" ">Git"
     "https://rss-bridge.org/bridge01/?action=display&context=Project+Issues&u=newsboat&p=newsboat&c=off&bridge=GithubIssueBridge&format=Atom"
     "https://rss-bridge.org/bridge01/?action=display&bridge=GithubTrendingBridge&context=By+language&language=&date_range=today&format=Atom"
     "https://github.com/swaywm/sway/releases.atom" ">Science"
     "https://www.nature.com/srep.rss"
     "https://www.science.org/rss/news_current.xml" ">Distros"
     "https://distrowatch.com/news/dw.xml"
     "https://planet.debian.org/atom.xml"
     "https://planet.gentoo.org/atom.xml" ">Filesharing"
     "https://opentrackers.org/feed/"
     "https://feeds.feedburner.com/Torrentfreak"
     "https://boards.4chan.org/t/index.rss"
     "https://github.com/jc141x/releases-feed/releases/latest/download/releases.rss"
     "http://archive.org/services/collection-rss.php"
     "https://simpcity.su/forums/asmr.47/index.rss" ">Linux"
     "https://www.cyberciti.biz/atom/atom.xml"
     "https://www.dedoimedo.com/rss_feed.xml"
     "https://micronews.debian.org/feeds/feed.rss"
     "http://feeds.feedburner.com/linuxtoday/linux?format=xml"
     "http://www.fsf.org/static/fsforg/rss/news.xml"
     "http://static.fsf.org/fsforg/rss/blogs.xml" ">Programming"
     "https://nullprogram.com/feed/"
     "https://projecteuler.net/rss2_euler.xml" ">Technology"
     "http://feeds.arstechnica.com/arstechnica/index"
     "https://hackaday.com/feed/"
     "https://www.technologyreview.com/feed" ">Misc"
     "https://en.wikipedia.org/w/index.php?title=Special:NewPages&feed=rss"
     "https://news.unm.edu/cats/employee_wellness.xml"
     "https://lwn.net/headlines/rss"))
 '(global-display-line-numbers-mode t)
 '(google-translate-default-source-language "la")
 '(google-translate-default-target-language "en")
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Roboto Mono" :foundry "GOOG" :slant normal :weight light :height 150 :width normal)))))
