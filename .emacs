(setq shell-file-name "/bin/zsh")
(setq explicit-shell-file-name "/bin/zsh")
(cd "/Users/acele")

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/apel-10.8/")
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(add-to-list 'load-path "~/.emacs.d/emacs-w3m-1.4.4/")
(add-to-list 'load-path "~/.emacs.d/org-mode/")
(add-to-list 'load-path "~/.emacs.d/mmm-mode/")
(add-to-list 'load-path "~/.emacs.d/haskell-mode/")
(add-to-list 'load-path "~/.emacs.d/scala-mode/")
(add-to-list 'load-path "~/.emacs.d/ensime/elisp/")
(add-to-list 'load-path "~/.emacs.d/sml-mode-4.1/")
(add-to-list 'load-path "~/.emacs.d/slime-2012-02-06/")
(add-to-list 'load-path "~/.emacs.d/kahua.el/")
(add-to-list 'load-path "~/.emacs.d/tuareg-mode/")
(add-to-list 'load-path "~/.emacs.d/mew/")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/rinari/")
(add-to-list 'load-path "~/.emacs.d/rhtml/")


;;fmacpathk
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;popwin

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;;utility
(require 'popup)
(require 'dbus)
(defun notify-error-on-dbus(title cont)
  (shell-command (format "notify-send %d %s" title cont))
  )

(setq ns-command-modifier (quote super))

;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/auto-install/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)             ; 互換性確保
;; (add-to-list 'load-path "~/.emacs.d/auto-install/")
;;println()
(setq warning-suppress-types nil)
(require 'anything-startup)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(scroll-bar-mode -1)
(setq ring-bell-function 'ignore);;ビープ音を消す
;;カーソルの点滅

(setq blink-cursor-interval 0.5)
(setq blink-cursor-delay 3.0)
(blink-cursor-mode 1)

;;appearance

(defvar paren-face 'paren-face)
(make-face 'paren-face)
(set-face-foreground 'paren-face "#ffffff")

(defvar brace-face 'brace-face)
(make-face 'brace-face)
(set-face-foreground 'brace-face "#ffaa88")

(defvar bracket-face 'bracket-face)
(make-face 'bracket-face)
(set-face-foreground 'bracket-face "#ffff00")

(setq lisp-font-lock-keywords-2
       (append '(("(\\|)" . paren-face))
               lisp-font-lock-keywords-2))

(setq lisp-font-lock-keywords-2
       (append '(("(\\|)" . paren-face))
               lisp-font-lock-keywords-2))

(add-hook 'scheme-mode-hook
           '(lambda ()
              (setq scheme-font-lock-keywords-2
                    (append '(("(\\|)" . paren-face)
			      ("\\[\\|\\]" . bracket-face))
                            scheme-font-lock-keywords-2))))

(defvar font-lock-string-face 'font-lock-string-face)
(make-face 'font-lock-string-face)
(set-face-foreground 'font-lock-string-face "#f22222")

 (add-hook 'scheme-mode-hook
           (lambda ()
            (add-to-list 'scheme-font-lock-keywords-2 '("#\\\\\\(\\w+\\|.\\)" . font-lock-string-face)) ; 文字 #\x
            (add-to-list 'scheme-font-lock-keywords-2 '("#\\[.*?\\]" . font-lock-string-face)) ; 文字集合 #[...]
            (add-to-list 'scheme-font-lock-keywords-2 '("#/\\(.\\|\\\\/\\)*/" . font-lock-string-face)))) ; 正規表現 #/.../

;;  (setq c-font-lock-keywords-3
;;        (append '(("(\\|)" . paren-face))
;;                '(("{\\|}" . brace-face))
;;                '(("\\[\\|\\]" . bracket-face))
;;                c-font-lock-keywords-3))

;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-hober)))


;;(setq initial-scratch-message "scratch")
(setq frame-title-format (format "emacs23@acele : %%f" (system-name)))
(setq default-frame-alist
      (append '(
	       (height . 30)
	       (line-spacing . 0)
	       (left-fringe . 3)
	       (right-fringe . 0)
	       (menu-bar-lines .nil)
	       (tool-bar-lines .nil)
	       (foreground-color ."azure1")
;;AntiqueWhite1")
	       (background-color ."black")
	       (cursor-color ."pink")
	       (visibility . t)
	       (alpha .(80 80 80 80))
	       )default-frame-alist))
(setq initial-frame-alist default-frame-alist)

;;font
;; (set-fontset-font
;;  (frame-parameter nil 'font)
;;  'mule-unicode-0100-24ff
;;  '("M+2VM+IPAG circle" . "iso10646-1"))

(set-face-attribute 'default nil
		    :family "apple-monaco"
		    :height 130)

(setq inhibit-startup-message t)
(setq indent-line-function 'indent-relative-maybe)
(setq indent-tabs-mode nil)
(delete-selection-mode t)
(cua-selection-mode t)

;;行末の空白を表示
(setq-default show-trailing-whitespace nil)
(tool-bar-mode -1)

(require 'auto-complete)
(require 'auto-complete-config)
(setq ac-auto-show-menu 0.000000001)


(global-auto-complete-mode t)
(setq ac-modes (append ac-modes '(c-mode)))
(setq ac-modes (append ac-modes '(c++-mode)))
(setq ac-modes (append ac-modes '(python-mode)))
(setq ac-modes (append ac-modes '(scheme-mode)))
(setq ac-modes (append ac-modes '(javascript-mode)))
(setq ac-modes (append ac-modes '(flex-mode)))
(setq ac-modes (append ac-modes '(php-mode)))
(setq ac-modes (append ac-modes '(html-mode)))
(setq ac-modes (append ac-modes '(css-mode)))
(setq ac-modes (append ac-modes '(scala-mode)))
(setq ac-modes (append ac-modes '(lisp-mode)))
(setq ac-modes (append ac-modes '(gauche-mode)))
;;(setq ac-modes (append ac-modes '(haskell-mode)))

(require 'undo-tree)
(global-undo-tree-mode t)

(require 'elscreen)
(set-face-background 'elscreen-tab-background-face "black")
(set-face-background 'elscreen-tab-other-screen-face "thistle")
(set-face-background 'elscreen-tab-current-screen-face "greenyellow")

(setq elscreen-tab-display-kill-screen nil)

;;full screen
;; (defun my-mac-toggle-max-window ()
;;   (interactive)
;;   (if (frame-parameter nil 'fullscreen)
;;       (set-frame-parameter nil 'fullscreen nil)
;;     (set-frame-parameter nil 'fullscreen 'fullboth)))
;; (global-set-key "\C-p" 'my-mac-toggle-max-window)

;; バッテリー残量表示
(display-battery-mode 1)

(require 'linum)
(global-linum-mode t)
(column-number-mode t)
(line-number-mode t)
(setq linum-format "%2d")
(global-set-key [(super l)] 'global-linum-mode)

;; (setq width (max widt, (/ (length str))))
;; (require 'crosshairs)
;; (set-face-background 'col-highlight "ghost white")
;; (set-face-background 'hl-line "ghost white")
;; (add-hook 'c-mode-hook '(lambda()(crosshairs-mode t)))
;; (add-hook 'c++-mode-hook '(lambda()(crosshairs-mode t)))
;; (add-hook 'emacs-lisp-mode-hook '(lambda()(crosshairs-mode t)))
;; (add-hook 'python-mode-hook '(lambda()(crosshairs-mode t)))
;; (add-hook 'javascript-mode-hook '(lambda()(crosshairs-mode t)))
;; (defun toggle-crosshair-mode(&optional arg)
;;   (interactive "p")


;;bookmark

(setq-default bm-buffer-persistence nil)
(require 'bm)
(set-face-foreground 'bm-face "black")
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(global-set-key (kbd "s-\\") 'bm-toggle)
(global-set-key (kbd "s-[") 'bm-previous)
(global-set-key (kbd "s-]") 'bm-next)

;;minor-mode
(ffap-bindings)

(require 'tramp)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(setq-default save-place t)
(require 'saveplace)

;; (iswitchb-mode 1)
;; (setq read-buffer-function 'iswitchb-read-buffer)
;; (setq iswitchb-regexp nil)
;; (setq iswitchb-prompt-newbuffer nil)

(require 'sr-speedbar)
(setq sr-speedbar-right-side 0)


;;;;paren face
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
;(setq show-paren-style 'expression) ;カッコの中に色がつく
;(setq show-paren-style 'mixed)　;両方



(display-time)
(transient-mark-mode 1)

;;gavage-collection limit
(setq gc-cons-threshold (* 300 gc-cons-threshold))
(setq echo-keystrokes 0.000001)

(setq history-length 1000)


(defalias 'yes-or-no-p 'y-or-n-p)

;;(require 'hideshow)
;;(require 'fold-dwim)
;;(hs-minor-mode t)
;;minor-end


;;scroll
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

(defun scroll-up-with-lines()
  ""
  (interactive)
  (scroll-up 1))

(defun scroll-down-with-lines()
  ""
  (interactive)
  (scroll-down 1))

;;flymake
(require 'flymake)
(defun flymake-python-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "pyflakes" (list local-file))))

(defconst flymake-allowed-python-file-name-masks '(("\\.py$" flymake-python-init)))
(defvar flymake-python-err-line-patterns '(("\\(.*\\):\\([0-9]+\\):\\(.*\\)" 1 2 nil 3)))

(defun flymake-python-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-python-file-name-masks))
  (setq flymake-err-line-patterns flymake-python-err-line-patterns)
  (flymake-mode t))
;;(add-hook 'python-mode-hook '(lambda () (flymake-python-load)))

(defun flymake-simple-generic-init (cmd &optional opts)
  (let* ((temp-file  (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list cmd (append opts (list local-file)))))

;; Makefile が無くてもC/C++のチェック
(defun flymake-simple-make-or-generic-init (cmd &optional opts)
  (if (file-exists-p "Makefile")
      (flymake-simple-make-init)
    (flymake-simple-generic-init cmd opts)))

(defun flymake-c-init ()
  (flymake-simple-make-or-generic-init
   "gcc" '("-Wall" "-Wextra" "-pedantic" "-fsyntax-only")))

(defun flymake-cc-init ()
  (flymake-simple-make-or-generic-init
   "g++" '("-Wall" "-Wextra" "-pedantic" "-fsyntax-only")))

(push '("\\.[cC]\\'" flymake-c-init) flymake-allowed-file-name-masks)
(push '("\\.cpp\\'" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-hook '(lambda()(flymake-mode t)))
(add-hook 'c++-mode-hook '(lambda()(flymake-mode t)))



(defun next-flymake-error ()
  (interactive)
  (flymake-goto-next-error)
  (let* ((err (get-char-property (point) 'help-echo))
         (line-no (flymake-current-line-no)))
      (when err
        (message err)
;;        (notify-error-on-dbus line-no err)
      )))

(defun previous-flymake-error ()
  (interactive)
  (flymake-goto-prev-error)
  (let ((err (get-char-property (point) 'help-echo)))
    (when err
      (message err))))

(defun clone-line-forward ()
  (interactive "*")
  (save-excursion
  (let ((contents (buffer-substring
                    (line-beginning-position)
                    (line-end-position))))
                    (end-of-line)
                    (insert ?\n contents)))
  (next-line 1))


(defun sfull-scr (&optional arg)
  (interactive "p")
  (set-frame-parameter nil 'fullscreen 'fullboth))
(defun full-scr (&optional arg)
  (interactive "p")
  (set-frame-parameter nil 'fullscreen 'maximized))
(defun release-scr (&optional arg)
  (interactive "p")
  (set-frame-parameter nil 'fullscreen 'nil))

(defun open-settings (&optional arg)
  (interactive "p")
  (find-file "~/.emacs"))

(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))

(require 'autoinsert)
(auto-insert-mode t)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-alist
      (nconc '(
               ("\\.cpp$" . "template.cpp")
               ("\\.c$"   . "template.c")
	       ("\\.py$" .  "template.py")
	       ("\\.scm$" .  "template.scm")
               ) auto-insert-alist))

;;yasnippet
(require 'yasnippet-bundle)

;; Pymacs
(require 'pymacs)
(autoload 'pymacs-apply "pymacs" nil t)
(autoload 'pymacs-call "pymacs" nil t)
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(eval-after-load "pymacs"
  '(add-to-list 'pymacs-load-path "~/emacs.d/pymacs-elisp/"))

;;clipboard
(cond (window-system
       (setq x-select-enable-clipboard t)
       ))

;;w3m
(require 'w3m-load)

;;follow  *beta*

(require 'org-install)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(org-remember-insinuate)
(setq org-directory "~/memo/")
(setq org-default-notes-file (concat org-directory "agenda.org"))
(setq org-remember-templates
      '(("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")
        ("Bug"  ?b "** TODO %?   :bug:\n   %i\n   %a\n   %t" nil "Inbox")
        ("Idea" ?i "** %?\n   %i\n   %a\n   %t" nil "New Ideas")))
(global-set-key "\M-r" 'remember)



(require 'shell-pop)
;; multi-term に対応
(add-to-list 'shell-pop-internal-mode-list '("multi-term" "*terminal<1>*" '(lambda () (multi-term))))
(shell-pop-set-internal-mode "multi-term")
;; 25% の高さに分割する
(shell-pop-set-window-height 25)
(shell-pop-set-internal-mode-shell shell-file-name)

;;terminal
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(define-key term-raw-map "\C-r" 'term-send-reverse-search-history)
(add-to-list 'term-unbind-key-list '"C-SPC")
(add-hook 'term-mode-hook '(lambda()
  ;; (crosshairs-mode 0)
  (define-key term-raw-map "\C-y" 'term-paste)
  (define-key term-raw-map "\C-n" 'term-send-down)
  (define-key term-raw-map "\C-p" 'term-send-up)
  (define-key term-raw-map "\C-r" 'term-send-reverse-search-history)
  (define-key term-raw-map "\C-t" 'other-window)
  (define-key term-raw-map "\C-z"
    (lookup-key (current-global-map) "\C-z"))))

;;     (define-key term-raw-map (kbd "ESC") 'term-send-raw)
;;     (define-key term-raw-map [delete] 'term-send-raw))))
               ;; (define-key term-raw-map "\C-zn"
               ;;    (lookup-key (current-global-map) "\C-z"))

;;(dolist (dir (list
;;              "/usr/local/sbin"
;;              "/usr/local/bin"
;;              "/usr/sbin"
;;              "/usr/bin"
;;              "/sbin"
;;              "/bin"
;;              (expand-file-name "~/bin")
;;              (expand-file-name "~/.emacs.d/bin"))
;;              ))
;;
;;(when (and (file-exists-p dir) (not (member dir exec-path)))
;;   (setenv "PATH" (concat dir ":" (getenv "PATH")))
;;   (setq exec-path (append (list dir) exec-path)))

(setq system-uses-terminfo nil)

;;(require 'migemo)
;;key-bind
(require 'goto-chg)
;;(global-set-key "\C-w" 'backward-kill-line)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-t" 'other-window)
(global-set-key "\C-h" 'forward-word)
(global-set-key "\C-o" 'backward-word)
(global-set-key "\C-j" 'clone-line-forward)
;;(define-key key-translation-map "\C-i" "\C-ci")
(global-set-key "\C-ci" 'backward-kill-line)
(global-set-key [(C \.)] 'align-regexp)

;; (global-set-key [(tab)] 'indent-according-to-mode)
;; (global-set-key "\C-j" 'goto-line)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cs" 'set-variable)
(global-set-key "\C-\\" 'delete-other-windows)
(global-set-key [(C tab)] 'elscreen-next)
(global-set-key [(C iso-lefttab)] 'elscreen-previous)
(define-key ctl-x-map "rp" 'replace-string)
(define-key ctl-x-map "re" 'replace-regexp)
(define-key ctl-x-map "gl" 'goto-last-change)
(define-key ctl-x-map "gr" 'goto-last-change-reverse)
(define-key ctl-x-map "al" 'align-regexp)
;; (define-key ctl-x-map "rh" 'toggle-crosshair-mode)
(define-key ctl-x-map "m" 'make-directory)
(global-set-key (kbd "C-\"") 'elscreen-next)
(global-set-key (kbd "C-\'") 'elscreen-previous)
(global-set-key [(M n)] 'next-flymake-error)
(global-set-key [(M p)] 'previous-flymake-error)
(global-set-key [(M h)] (kbd "*"))
(global-set-key [(M j)] (kbd "%"))
(global-set-key [(M u)] (kbd "+"))
(global-set-key [(M i)] (kbd "-"))
(global-set-key [(M f)] (kbd "&"))
(global-set-key [(M d)] (kbd "^"))
(global-set-key [(M k)] (kbd "/"))
(global-set-key [(M l)] (kbd ","))
(global-set-key [(M o)] (kbd "$"))
(global-set-key [(super E)] 'sfull-scr)
(global-set-key [(super e)] 'full-scr)
(global-set-key [(super r)] 'release-scr)
(global-set-key [(super q)] 'open-settings)
(global-set-key [(super c)] 'compile)
;;(global-set-key [(super t)] 'shell-pop)
(global-set-key [(super t)] 'elscreen-create)
(global-set-key [(super b)] 'speedbar)
(global-set-key [(super n)] (kbd "1"))
(global-set-key [(super m)] (kbd "2"))
(global-set-key [(super \,)] (kbd "3"))
(global-set-key [(super j)] (kbd "4"))
(global-set-key [(super k)] (kbd "5"))
;; (global-set-key [(super l)] (kbd "6"))
(global-set-key [(super u)] (kbd "7"))
(global-set-key [(super i)] (kbd "8"))
(global-set-key [(super o)] (kbd "9"))
(global-set-key [(super h)] (kbd "0"))
;;(global-set-key [(super .)] (kbd "."))
(global-set-key [(super .)] 'goto-line)
(global-set-key [(super backspace)] (kbd "DEL"))
(global-set-key [(super /)] 'fold-dwim-toggle)


;; 警告エラー行の表示
;; (global-set-key [(super t)] 'flymake-display-err-menu-for-current-line)

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)


(add-hook 'tetris-mode '(lambda() (
    (define-key tetris-mode-map [(C SPC)] 'tetris-move-bottom))))

;;; GDB 関連
;;; 有用なバッファを開くモード

(setq gdb-many-windows t)

;;; 変数の上にマウスカーソルを置くと値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))

;;; I/O バッファを表示
(setq gdb-use-separate-io-buffer t)

;;; t にすると mini buffer に値が表示される
(setq gud-tooltip-echo-area nil)



;;scheme
(setq scheme-program-name "/usr/local/bin/gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
;; (add-hook 'scheme-mode-hook
;;           '(lambda ()
;;             (define-key scheme-mode-map "\"" 'electric-pair)
;;             (define-key scheme-mode-map "\'" 'electric-pair)
;;             (define-key scheme-mode-map "(" 'electric-pair)
;;             (define-key scheme-mode-map "[" 'electric-pair)
;;             (define-key scheme-mode-map "{" 'electric-pair)))

(require 'gauche-mode)
(defun my-scm-shell ()
  (interactive)
  (let ((win (selected-window))
        (tmpbuf " * temporary *"))
    (pop-to-buffer tmpbuf)
    (run-scheme scheme-program-name)
    (select-window win)
    ))

;; カッコの色の変更。この設定だと薄めの色になります
;;(defvar paren-face 'paren-face)
;;(make-face 'paren-face)
;;(set-face-foreground 'paren-face "yellow")

;; 定義をhookに設定して有効にします
(add-hook 'scheme-mode-hook
          (function
            (lambda ()
              (define-key scheme-mode-map "\C-x\C-d" 'my-scm-shell)
              )))


(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))


;; ;;haskell
(require 'auto-complete-haskell)
(setq ac-modes
      (append '(haskell-mode literate-haskell-mode inferior-haskell-mode)
              ac-modes))
(add-hook 'inferior-haskell-mode-hook
   (lambda ()
     (setq ac-sources '(my/ac-source-haskell
			ac-source-dictionary
			ac-source-words-in-same-mode-buffers))))

(setq haskell-program-name "/usr/local/bin/ghci")
(setq ghc-module-command "~/.cabal/bin/ghc-mod")
(load "haskell-site-file")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
(add-hook 'haskell-mode-hook '(lambda()
    (local-set-key [f5] "\C-c\C-l\C-x\omain\C-m\C-xo")
    (ghc-init)
    (local-set-key [(C \;)] (kbd "`"))
    (local-set-key [backtab] 'ghc-complete)
    (local-set-key "\C-i" 'haskell-indent-cycle)
    (local-set-key [backspace] 'backward-delete-char-untabify)
    (local-set-key "\r" 'newline-and-indent)
    (local-set-key [(C \.)] 'align-regexp)
    (local-set-key [(C \,)] 'align-arrow)
    (delete-selection-mode t)
    (cua-selection-mode t)
))

(defun align-equal ()
  (interactive)
  (align-regexp (region-beginning) (region-end) "=" 1 1 t)
)

(defun align-arrow ()
  (interactive)
  (align-regexp (region-beginning) (region-end) "->" 1)
)


(require 'php-mode)
;;(setq php-mode-force-pear t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;; (add-hook 'php-mode-hook
;;           (lambda ()
;;             (c-set-offset 'case-label' 4)
;;             (c-set-offset 'arglist-intro' 4)
;;             (c-set-offset 'arglist-cont-nonempty' 4)
;;             (c-set-offset 'arglist-close' 0)))

(defvar xcode:gccver "4.0")
(defvar xcode:sdkver "3.1.2")
(defvar xcode:sdkpath "/Developer/Platforms/iPhoneSimulator.platform/Developer")
(defvar xcode:sdk (concat xcode:sdkpath "/SDKs/iPhoneSimulator" xcode:sdkver ".sdk"))
(defvar flymake-objc-compiler (concat xcode:sdkpath "/usr/bin/gcc-" xcode:gccver))
(defvar flymake-objc-compile-default-options (list  "-x objective-c" "-Wall" "-Wextra" "-fsyntax-only" "-ObjC" "-std=c99" "-isysroot" xcode:sdk))
(defvar flymake-last-position nil)
(defvar flymake-objc-compile-options '("-I."))
(defun flymake-objc-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                    'flymake-create-temp-inplace))
         (local-file (file-relative-name
                     temp-file
                     (file-name-directory buffer-file-name))))
    (list flymake-objc-compiler (append flymake-objc-compile-default-options flymake-objc-compile-options (list local-file)))))


(add-hook 'objc-mode-hook
         (lambda ()
           ;; 拡張子 m と h に対して flymake を有効にする設定 flymake-mode t の前に書く必要があります
           (push '("\\.m$" flymake-objc-init) flymake-allowed-file-name-masks)
           (push '("\\.h$" flymake-objc-init) flymake-allowed-file-name-masks)
           ;; 存在するファイルかつ書き込み可能ファイル時のみ flymake-mode を有効にします
           (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
               (flymake-mode t))
         ))

;;scala-mode
(require 'scala-mode-auto)
(defadvice scala-block-indentation (around improve-indentation-after-brace activate)
  (if (eq (char-before) ?\{)
      (setq ad-return-value (+ (current-indentation) scala-mode-indent:step))
    ad-do-it))

(defun scala-newline-and-indent ()
  (interactive)
  (delete-horizontal-space)
  (let ((last-command nil))
    (newline-and-indent))
  (when (scala-in-multi-line-comment-p)
    (insert "* ")))

(add-hook 'scala-mode-hook
	  (lambda ()
            (define-key scala-mode-map (kbd "RET") 'scala-newline-and-indent)
	    (define-key scala-mode-map (kbd "\C-cr") 'scala-eval-region)
	    (define-key scala-mode-map (kbd "\C-cb") 'scala-eval-buffer)
	    ))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;sml-mode
(require 'sml-mode)

;; 透過
;; (defvar frame-alpha 100)
;; (defun inc-alpha (&optional arg)
;;   (interactive "p")
;;   (if (<= frame-alpha 98)
;;       (begin
;;        (setq 'frame-alpha (+ 'frame-alpha 2))
;;        (set-frame-parameter nil 'alpha 'frame-alpha))))
;; (defun dec-alpha (&optional arg)
;;   (interactive "p")
;;   (if (> frame-alpha 2)
;;       (begin
;;        (setq 'frame-alpha (- 'frame-alpha 2))
;;        (set-frame-parameter nil 'alpha 'frame-alpha))))

;SLIME
(setq inferior-lisp-program "/usr/local/bin/ccl64 -K utf-8")
;; (setq inferior-lisp-program "sbcl")

(require 'slime)
;; (setq slime-net-coding-system 'utf-8-unix)
(setq slime-startup-animation nil)
(setq slime-use-autodoc-mode t)
(slime-setup)
;;slime prompt
(slime-setup '(slime-repl))

;;slime with popwin
;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)


;HyperSpecを読み込む.
;HyperSpecがインストールされている場所「/usr/share/doc/hyperspec/」
(setq common-lisp-hyperspec-root
      (concat "file://" (expand-file-name "/opt/local/share/doc/lisp/HyperSpec-7-0/"))
      common-lisp-hyperspec-symbol-table
      (expand-file-name "/opt/local/share/doc/lisp/HyperSpec-7-0/Data/Map_Sym.txt"))
(require 'package)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'clojure-mode)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)


;;scheme-complete設定
;;(require 'scheme-complete)

;; (eval-after-load 'scheme
;;   ;; キーバインド
;;   '(progn
;;     ;; scheme-smart-complete: M-TAB
;;     (define-key scheme-mode-map "\e\t" 'scheme-smart-complete)
;;     ;; scheme-complete-or-indent: TAB
;;     (define-key scheme-mode-map "\t" 'scheme-complete-or-indent))
;;   )

;; (add-hook 'scheme-mode-hook
;;   (lambda ()
;;     ;; Gauche の場合、次の2個の変数を設定しておいたほうがよいのかも。
;;       (setq default-scheme-implementation 'gauche)
;;       (setq *current-scheme-implementation* 'gauche)
;;     ;; eldoc-mode
;;     (set (make-local-variable 'eldoc-documentation-function)
;;     	 'scheme-get-current-symbol-info)
;;          (eldoc-mode t)
;;     )
;;     )

(require 'kahua)
(setq auto-mode-alist
      (append '(("\\.kahua$" . kahua-mode)) auto-mode-alist))

;;mmm-mode
;; (require 'mmm-auto)
;; (setq mmm-grobal-mode 'maybe)
;; (mmm-add-classes
;;     '((mmm-ml-css-mode
;;       :submode css-mode
;;       :face mmm-code-submode-face
;;       :front "<style[^>]*>"
;;       :back "\n?[ \t]*</style>"
;;       )
;;      (mmm-ml-javascript-mode
;;       :submode javascript-mode
;;       :face mmm-code-submode-face
;;       :front "<script[^>]*>[^<]"
;;       :front-offset -1
;;       :back "\n?[ \t]*</script>"
;;       )

;;      ))
;;   (mmm-add-mode-ext-class 'html-mode nil 'mmm-ml-javascript-mode)
;;   (mmm-add-mode-ext-class 'html-mode nil 'mmm-ml-css-mode)

;;;; mmm-mode
;; (require 'mmm-auto)
;; (setq mmm-global-mode 'maybe)
;; (mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
;; (mmm-add-classes
;;  '((html-php
;;     :submode php-mode
;;     :front "<\\?\\(php\\)?"
;;     :back "\\?>")))
;; (add-to-list 'auto-mode-alist '("\\.php?\\'" . html-mode))

;;clojure-mode
(require 'clojure-mode)

;;ruby-mode
(require 'ruby-mode)

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)


(add-hook 'ruby-mode-hook
'(lambda ()
(local-set-key "\C-j" 'clone-line-forward))
(define-key ruby-mode-map (kbd "\r") 'newline-and-indent))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)

;; inf-ruby.el
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook\\\\
          '(lambda ()
             (inf-ruby-keys)))


;;rsense
(setq rsense-home "/Users/acele/.emacs.d/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(add-hook 'ruby-mode-hook
          '(lambda ()
             ;; .や::を入力直後から補完開始
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)
             ;; C-x .で補完出来るようキーを設定
             (define-key ruby-mode-map (kbd "C-x .") 'ac-complete-rsense)))

;; (setq rsense-rurema-home (concat rsense-home "/doc/ruby-refm"))
;; (setq rsense-rurema-refe "refe-1_9_2")

;; rails関連

;;rhtml-mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
	  (lambda () (rinari-launch)))

;;rinari
(require 'rinari)

(defun my-css-electric-pair-brace ()
  (interactive)
  (insert "{")(newline-and-indent)
  (newline-and-indent)
  (insert "}")
  (indent-for-tab-command)
  (previous-line)(indent-for-tab-command)
  )

(require 'jinja2-mode)
;;(add-to-list 'auto-mode-alist '("\\.$" . jinja2-mode))

(defun my-semicolon-ret ()
  (interactive)
  (insert ";")
  (newline-and-indent))

;; ;; scss-mode
;; ;; https://github.com/antonj/scss-mode
(autoload 'scss-mode "scss-mode")
;; (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.\\(scss\\|css\\)\\'" . scss-mode))
;;(add-hook 'scss-mode-hook 'ac-css-mode-setup)
;; (add-hook 'scss-mode-hook
;;           (lambda ()
;;             (define-key scss-mode-map "\M-{" 'my-css-electric-pair-brace)
;;             (define-key scss-mode-map ";" 'my-semicolon-ret)
;;             (setq css-indent-offset 2)
;;             (setq scss-compile-at-save nil)
;;             (setq ac-sources '(ac-source-yasnippet
;;                                ;; ac-source-words-in-same-mode-buffers
;;                                ac-source-words-in-all-buffer
;;                                ac-source-dictionary
;;                                ))
;;             (flymake-mode t)
;;             ))
(add-to-list 'ac-modes 'scss-mode)

(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(require 'whitespace)
(global-whitespace-mode 1)
(set-face-foreground 'whitespace-space "LightSlateGray")

(set-face-foreground 'whitespace-tab "LightSlateGray")

(require 'nrepl)

;;バックアップ
(setq auto-save-default nil)
(setq make-backup-files nil)