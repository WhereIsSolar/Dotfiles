;;Plugins: Sraight, theme (catpuccin or ef-theme), ligatures (fira-code),
;;         eglot, evil (notation, commentary, surround), beacon
;;         vertico, embark, consult, marginalia

;; Bootstrap straight
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; no welcome screen
(setq inhibit-startup-screen t)

;; set up default directory and no backup
(setq default-directory "~/")
(setq make-backup-files nil)

;; Turn off unused menus
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;custom font
(custom-set-faces
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight regular :height 170 :width normal)))))

(put 'set-goal-column 'disabled nil)
;; bootstrap margin and step distance by bottom or top
(setq redisplay-dont-pause t
      scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Frame transparency
(set-frame-parameter (selected-frame) 'alpha '(70 80))
(add-to-list 'default-frame-alist '(alpha . (95 95)))

;; Cursor visibility
(straight-use-package 'beacon)
(beacon-mode 1)

;; Autocompletion
(straight-use-package 'company)
(straight-use-package 'company-quickhelp)
(require 'company)

;; Eglot (LSP)
(straight-use-package 'eglot)
(use-package eglot
  :straight t
  :hook
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure)))
;; Включение семантической подсветки (требует Emacs 29+)
(setq eglot-ignored-server-capabilities nil)

;; Custom theme
(use-package doom-themes
  :ensure t
  :straight t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  ;; (doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-tomorrow-night t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  ;; (doom-themes-neotree-config)
  ;; or for treemacs users
  ;; (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Evil-mode PART ----------------------
(setq evil-want-keybinding nil)
(straight-use-package 'evil)
(require 'evil)
(evil-mode 1)

(straight-use-package 'evil-commentary)
(straight-use-package 'evil-surround)

(use-package evil-commentary
 :straight t
 :config
 (evil-commentary-mode 1))

(use-package evil-surround
  :straight t
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
    :after evil
    :straight t
    :config (evil-collection-init))
;; Evil-mode PART ----------------------

(use-package which-key
    :straight t
    :config (which-key-mode))

(use-package magit :straight t)

(use-package rainbow-delimiters
  :straight t
  :hook (prog-mode . rainbow-delimiters-mode))

;;for coding
(defun print-to-file (filename data)
  (with-temp-file filename
    (mapcar (lambda (d) (prin1 d (current-buffer))) data) ))

(defun read-from-file (filename)
  (with-temp-buffer
    (insert-file-contents filename)
    (cl-assert (eq (point) (point-min)))
    (read (current-buffer))))


(defmacro make-enable-switch (switch-name &rest enable-expressions)
  `(defmacro ,switch-name (enable?)
     (if enable?
   ',(cons 'progn  enable-expressions))))


(straight-use-package 'go-mode)
(setq display-line-numbers-type 'relative)

(make-enable-switch enable-emacs-lisp
        (add-hook 'emacs-lisp-mode-hook #'company-mode)
        (add-hook 'emacs-lisp-mode-hook #'display-line-numbers-mode)
	)

(make-enable-switch enable-python
        (add-hook 'python-mode-hook #'company-mode)
        (add-hook 'python-mode-hook #'display-line-numbers-mode)
	)

(make-enable-switch enable-c
        (add-hook 'c-mode-hook #'company-mode)
        (add-hook 'c-mode-hook #'display-line-numbers-mode)
	)

(make-enable-switch enable-make
        (add-hook 'makefile-mode-hook #'company-mode)
        (add-hook 'makefile-mode-hook #'display-line-numbers-mode))
;;My addon
(make-enable-switch enable-c++
        (add-hook 'c++-mode-hook #'company-mode)
        (add-hook 'c++-mode-hook #'display-line-numbers-mode)
	)

(make-enable-switch enable-go
	(add-hook 'go-mode-hook #'company-mode)
	(add-hook 'go-mode-hook #'display-line-numbers-mode)
	)

(make-enable-switch enable-org
	(add-hook 'org-mode-hook #'company-mode)
	(add-hook 'org-mode-hook #'display-line-numbers-mode)
	)

(enable-emacs-lisp 't)
(enable-python 't)
(enable-c 't)
(enable-make 't)
(enable-c++ 't)
(enable-go 't)
(enable-org 't)


;;consult-ripgrep, consult-find

;; Основные настройки
(use-package vertico
  :straight t
  :init
  (vertico-mode))  ; Вертикальные списки дополнений

(use-package consult
  :straight t
  :bind
  (("M-s f" . consult-find)        ; Поиск файлов
   ("M-s g" . consult-grep)        ; Поиск по содержимому
   ("M-s r" . consult-ripgrep)))   ; Быстрый поиск через ripgrep

(use-package embark
  :straight t
  :bind
  (("C-." . embark-act)            ; Действия над объектами
   :map minibuffer-local-map
   ("C-c C-o" . embark-export)))   ; Экспорт результатов

(use-package marginalia
  :straight t
  :init
  (marginalia-mode))  ; Аннотации для дополнений




;; ---------------------------------IDK PART ------------------------------

;; PATH tweaks

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
        "[ \t\n]*$" "" (shell-command-to-string
            "$SHELL --login -c 'echo $PATH'"
                ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin"))
(setq exec-path (append exec-path '("~/.local/bin")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8ba8918be4bb12c57cae812f8f9543e7a4b59a3cc1d5d4a4f97dc26a397c94e3"
     default))
 '(tool-bar-mode nil))


;(set-face-attribute 'menu nil
;                    :inverse-video nil
;                    :background "green"
;                    :foreground "pink"
;                    :bold t)


;(require 'package)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and package-pinned-packages. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;(package-initialize)

;(add-to-list 'package-archives
;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;;;;;;;;;;;;;;;;;;;;;;;;DISABLED;;;;;;;;;;;;;;;;;;



;; Bootstrap ligatures
;; (straight-use-package 'fira-code-mode)
;; (use-package fira-code-mode
;;   :config
;;   (setq fira-code-mode-disabled-ligatures '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>" 
;;      ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!==" 
;;      "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<" 
;;      "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->" 
;;      "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<" 
;;      "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
;;      "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|" 
;;      "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:" 
;;      ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:" 
;;      "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!" 
;;      "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "?:" "?=" 
;;      "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)" "\\\\" 
;;      "://" "*" "++" "++++" "x" "+" "* " "[]" ": " ":"
;; 					    )) ; опционально
;;   (global-fira-code-mode))

;; ;; Sometimes it needs in ligatures, but on my machine in works without it
;; (straight-use-package 'ligature)

;; (use-package ligature
;;   :config
;;   ;; Включи лигатуры для программирования
;;   (ligature-set-ligatures 'prog-mode '("!=" ">=" "<=" "==" "?=" "->" "<-" "||" "&&""__" "~~>""~~>" "<~~" "<~" ".." "..." "+=" "-=" "*=" "/=" "_|_" "www" "^=" "~~" "~@"
;; 				       "~-" "**" "*>" "/*"  "*/" "||" "|-" "::" ":=" "==" "=>" "!=" "!!" "-~" "-|" "->" "<-" "--" "<~" "<=" "<>"  "<<" "##" "#_" "%%" ".."
;; 				       "?:" "??" ";;" "/=" "//" "__" "~~" "(*" "*)" "\\\\" "://" 
;; 				       ))
;; (global-ligature-mode t))
