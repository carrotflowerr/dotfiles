;;; Zimblo's Awesome Config --- minimal config for writing and fun
;; Last Sync: Sat May 31 03:18:37 PM MDT 2025
;;; This should be compatible with any (up to date) version of Emacs.
;;; (load) functions may bring incompatibility 



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

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(load "~/.emacs.d/rss.el")
(load "~/.emacs.d/macro.el")
(load "~/.emacs.d/packages.el")
;; ^ if shit gets fucked this is the problem ^

;; Idea: a hook that, when file.note, automatically saves to ~/.note/


;; Put backup files (file.txt~) in .emacs.d/
;; this applies to pre-made files opened with emacs
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t)

;; Disable save prompts when killing a buffer
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function kill-buffer-query-functions))
;; Disable auto-save files
(setq auto-save-default nil)

(setq line-spacing .2)

;; (ido-mode)

;; Dired settings
(setq dired-listing-switches "-lh --time-style=long-iso -t --group-directories-first")

;; btw, C-x C-q dired-toggle-read-only


(use-package dired
  :ensure nil
  :commands (dired)
  :hook ((dired-mode . hl-line-mode)
         (dired-mode . dired-omit-mode)
         (dired-mode . dired-hide-details-mode))
  :bind (:map dired-mode-map
	      ("-" . dired-up-directory))
  :init
  ;; let me drag files into other programs
  (setq dired-mouse-drag-files t)
  (setq dired-bind-jump nil)
  :config
  (global-set-key (kbd "C-x C-d") 'dired-jump)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode)
  (setq dired-dwim-target t)
  (setq dired-listing-switches "-aghoA --group-directories-first")
  ;; Hide . and .. in dired
  (setq dired-omit-files
        (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$"))
;;;;; xdg-open integration
  (require 'dired-x)
  ;; prevent opening extra dired buffers
  ;; emacs 28
  (setq dired-kill-when-opening-new-dired-buffer t))


;; might be awful for normal writing
;; hook;; Macro edit
(global-set-key (kbd "C-x M-m") 'kmacro-edit-macro)



;; Interface binds
;; want to use hydra for this
;; (global-set-key (kbd "C-c s") 'scratch-buffer)
;; (global-set-key (kbd "C-c c") 'calendar)
;; (global-set-key (kbd "C-c r") 'elfeed)
;; (global-set-key (kbd "C-c m") 'dashboard-open)

;; Misc unbinds (things I find silly)
(global-unset-key (kbd "C-x f")) ;; fill command
(global-unset-key (kbd "C-x m")) ;; compose mail
;;(global-unset-key (kbd "C-x C-c"))

;; replaces upcase-word
(global-set-key (kbd "M-u") 'undo-redo)

;; (global-set-key (kbd "C-x C-u") 'undo-tree-mode)

;; Open in new window
;;(global-set-key (kbd "C-M-m") 'make-frame)

;; Auto focus windows
(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

(setq cursor-type 'box)

;; Syntax highlighting 
(setq font-lock-maximum-decoration t)

;; Dictionary (localhost is dictd)
(global-set-key (kbd "C-c l") #'dictionary-lookup-definition)
(setq dictionary-server "localhost")

;; Line wrap
(global-visual-line-mode t)
(add-hook 'prog-mode-hook 'visual-line-mode)

;; line numba
(global-display-line-numbers-mode)

;; show whitespace
(whitespace-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)

;; highlight current line
(global-hl-line-mode)

;; Do not prompt to save when exiting Emacs
(setq confirm-kill-emacs nil)

;; Spell check for text files using flyspell (built-in)
;;(add-hook 'text-mode-hook 'flyspell-mode)
;;(eval-after-load 'flyspell
;;  '(progn
;;     (define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-word)
;;     ))
;; why the fuck is this a text mode hook

;; Set eww as default browser
(setq browse-url-browser-function 'eww-browse-url)
(setq eww-download-directory "~/.emacs.d/eww/")


;; === BUFFER/WINDOW MANAGEMENT START ===

(defun zimblo-shell-to-buffer ()
  (interactive)
  (let ((current-prefix-arg '(4))) ; equivalent to C-u
    (call-interactively #'shell-command)))

;; does unbind normal shell command
;; M-| does shell on region
(global-set-key (kbd "M-!") #'zimblo-shell-to-buffer)


(global-set-key (kbd "C-x k")	       
		(lambda ()
		  (interactive)
		  (kill-buffer (current-buffer)))
		)
;; ^ just buffer, not window. non-interactive.
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)



;; kills buffer not interactive.  


;; C-x C-b runs ibuffer instead of just listing buffers
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b")'ibuffer)

(defun buffer-wipe()
  "Kill all buffers"
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows)
  )




;; (defun buffer-wipe () 
;;   "Kill all buffers except for default ones, and print the names of killed buffers."
;;   (interactive)
;;   (let ((default-buffers '("*scratch*" "*Messages*" "*dashboard*" "*straight-process*" "*Async-native-compile-log*"))) ; Add more default buffers if needed
;;     (dolist (buf (buffer-list))
;;       (let ((buf-name (buffer-name buf)))
;;         (when (and (not (member buf-name default-buffers))
;;                    (not (string-match-p "^\\*" buf-name))) ; Exclude all other special buffers
;;           (message "Killing buffer: %s" buf-name)
;;           (kill-buffer buf))))))




;; === BUFFER/WINDOW MANAGEMENT END ===


;; === CUSTOM VARIABLES START ===
;; (managed by Emacs Custom)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(bongo-enabled-backends '(mpv))
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("8594960510d1b67ac3db8ee047108cb5465580f38e26cfa3c25d4df64b3ed0f9"
     "d106f3f27d9dff7ff28a660b6ec3fb79bcce12bc2795ad544eca1509156b322e"
     "c7951fc937039f8f1640fce55d97628d8b2cd124461d6a28dce13fcc29fbed1d"
     "cdb768021bf99e838364dd5e7fc22d9b6f790124c97be379a5bda4f900e50c26"
     "1de73eec00f3487bc463de2ea9147fff57efadb2c293283558f0ed916c10a38b"
     "a24e023c71f74e8c6a79068947d706f68a566b49a774096671a5cbfe1fb90fc6"
     "14e168ce25a773e52e9032640d8cc34293f74fc599230340587fd17c96c2c97a"
     "b2a3b2bbe9aea795fd23ecb46ba1fbd28988b7d528b6a1f6e7f8a1122a9025aa"
     "5d67552ed2e841039034dc8245ee1746ab4f00614366ca7018386041f9b0a96f"
     "0ac7e8c9336aea2f73b28ecfd1f9fcfc64eeca0585aa071f2f67ff716dcb9c6c"
     "b58b5aa5664a927866daa481ae5f0795423ed3982ce5f64e56c4106261dbd13e"
     "e223120256455daba01b6c68510b48fac813acab05c314510e47aea377b23634"
     "de385583975ed8e83b71b212b3094ee74785834718e2413bc3acff36224fba8d"
     "e85a354f77ae6c2e47667370a8beddf02e8772a02e1f7edb7089e793f4762a45"
     "b011db0e1a00753fd9227d8c3c2f48dd517d316a6303bdbbff8d225ee760eea3"
     "fae5872ff90462502b3bedfe689c02d2fa281bc63d33cb007b94a199af6ccf24"
     "cee5c56dc8b95b345bfe1c88d82d48f89e0f23008b0c2154ef452b2ce348da37"
     "a3a71b922fb6cbf9283884ac8a9109935e04550bcc5d2a05414a58c52a8ffc47"
     "a0e9bc5696ce581f09f7f3e7228b949988d76da5a8376e1f2da39d1d026af386"
     "aff0396925324838889f011fd3f5a0b91652b88f5fd0611f7b10021cc76f9e09"
     "b3ba955a30f22fe444831d7bc89f6466b23db8ce87530076d1f1c30505a4c23b"
     "b1791a921c4f38cb966c6f78633364ad880ad9cf36eef01c60982c54ec9dd088"
     "ea4dd126d72d30805c083421a50544e235176d9698c8c541b824b60912275ba1"
     "36c5acdaf85dda0dad1dd3ad643aacd478fb967960ee1f83981d160c52b3c8ac"
     "541282f66e5cc83918994002667d2268f0a563205117860e71b7cb823c1a11e9"
     "ac893acecb0f1cf2b6ccea5c70ea97516c13c2b80c07f3292c21d6eb0cb45239"
     "cd5f8f91cc2560c017cc9ec24a9ab637451e36afd22e00a03e08d7b1b87c29ca"
     "6af300029805f10970ebec4cea3134f381cd02f04c96acba083c76e2da23f3ec"
     "19b62f442479efd3ca4c1cef81c2311579a98bbc0f3684b49cdf9321bd5dfdbf"
     "d6b369a3f09f34cdbaed93eeefcc6a0e05e135d187252e01b0031559b1671e97"
     "90185f1d8362727f2aeac7a3d67d3aec789f55c10bb47dada4eefb2e14aa5d01"
     "1ad12cda71588cc82e74f1cabeed99705c6a60d23ee1bb355c293ba9c000d4ac"
     "d609d9aaf89d935677b04d34e4449ba3f8bbfdcaaeeaab3d21ee035f43321ff1"
     "ffa78fc746f85d1c88a2d1691b1e37d21832e9a44a0eeee114a00816eabcdaf9"
     "df39cc8ecf022613fc2515bccde55df40cb604d7568cb96cd7fe1eff806b863b"
     "296dcaeb2582e7f759e813407ff1facfd979faa071cf27ef54100202c45ae7d4"
     "b9c002dc827fb75b825da3311935c9f505d48d7ee48f470f0aa7ac5d2a595ab2"
     "b41d0a9413fb0034cea34eb8c9f89f6e243bdd76bccecf8292eb1fefa42eaf0a"
     "2551f2b4bc12993e9b8560144fb072b785d4cddbef2b6ec880c602839227b8c7"
     "da69584c7fe6c0acadd7d4ce3314d5da8c2a85c5c9d0867c67f7924d413f4436"
     "4c16a8be2f20a68f0b63979722676a176c4f77e2216cc8fe0ea200f597ceb22e"
     "ae20535e46a88faea5d65775ca5510c7385cbf334dfa7dde93c0cd22ed663ba0"
     "59c36051a521e3ea68dc530ded1c7be169cd19e8873b7994bfc02a216041bf3b"
     "3d9938bbef24ecee9f2632cb25339bf2312d062b398f0dfb99b918f8f11e11b1"
     "c038d994d271ebf2d50fa76db7ed0f288f17b9ad01b425efec09519fa873af53"
     "ad7d874d137291e09fe2963babc33d381d087fa14928cb9d34350b67b6556b6d"
     "b8bd60a23b9e2f08b0c437231ee84f2dacc70fdc4d5a0fb87229bb9926273fdd"
     "dc15dbd4b0a00c64610fd4379a89424e0be1b418f09457e0f062cac931e8ca82"
     "cb024671ccb98c3ee7583e32df4bfdb50044dada87064e8fcf0fea2357ba7dd9"
     "1781e8bccbd8869472c09b744899ff4174d23e4f7517b8a6c721100288311fa5"
     "de8f2d8b64627535871495d6fe65b7d0070c4a1eb51550ce258cd240ff9394b0"
     "acfe7ff6aacb9432f124cde4e35d6d2b4bc52916411de73a6ccded9750c9fa97"
     "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02"
     default))
 '(desktop-save-mode t)
 '(display-time-mode t)
 ;; god damn it
 '(elfeed-feeds
   '("http://www.profightdb.com/rss.xml" "===World_News==="
     "https://feeds.bbci.co.uk/news/world/rss.xml"
     "http://rss.cnn.com/rss/edition_world.rss"
     "https://www.nytimes.com/svc/collections/v1/publish/https://www.nytimes.com/section/world/rss.xml"
     "https://feeds.washingtonpost.com/rss/world"
     "https://feeds.npr.org/1004/rss.xml" "===ABQ==="
     "http://feeds.bizjournals.com/bizj_albuquerque"
     "http://nmpoliticalreport.com/feed/"
     "https://www.reddit.com/r/Albuquerque/.rss"
     "https://www.cabq.gov/news/news/RSS" "https://www.krqe.com/feed/"
     "===UNM===" "https://news.unm.edu/rss.xml" "===Loonix==="
     "https://itsfoss.com/rss/" "https://www.debian.org/News/news"
     "https://www.kernel.org/feeds/kdist.xml"
     "https://hnrss.org/frontpage" "===Misc==="
     "https://darkstarastrology.com/feed/"
     "https://bearblog.dev/discover/feed/") t)
 '(global-display-line-numbers-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
 '(global-display-line-numbers-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight regular :height 151 :width normal)))))


;; "JetBrainsMono Nerd Font,JetBrainsMono NF

;; === CUSTOM VARIABLES END ===
