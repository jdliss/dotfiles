(require 'package)

(setq package-list '(use-package))

;; Add Melpa as the default Emacs Package repository ;; only contains a very limited number of packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Activate all the packages (in particular autoloads)
(package-initialize)

;; Update local package index
(unless package-archive-contents
  (package-refresh-contents))

;; Install all missing packages
(dolist (package package-list) (unless (package-installed-p package)
    (package-install package)))

;; load use-package
(require 'use-package)

;; better set of default settings
(use-package better-defaults :ensure t)

;; Don't autosave files
(setq auto-save-default nil)

;; Don't make backup files
(setq make-backup-files nil)

;; Set font info
(set-frame-font "Source Code Pro 15" nil t)

;; Turn off bell
(setq ring-bell-function 'ignore)

;; Show line numbers
(global-linum-mode 1)

;; Enable transparent title-bar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

;; Disable title-bar text
(setq frame-title-format nil)

;; start emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Show trailing whitespace
;; (setq-default show-trailing-whitespace t)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set electric-pair mode to auto insert matching parents/brackets
(electric-pair-mode)

;; Auto-indent when hitting RET key
;; This fixes the issue with getting nicely formatted brackets when typing '{' and hitting RET
;; Note - autoindents accoring to major mode
(global-set-key (kbd "RET") 'newline-and-indent)

;; No blinking cursor
(blink-cursor-mode 0)

;; Don't make lockfiles
(setq create-lockfiles nil)

;; Can't get these shortcuts out of my fingers :)
;; Rebind dired mode
(global-unset-key (kbd "C-x C-d"))
(global-set-key (kbd "C-x C-d C-d") (kbd "C-x C-f C-j"))

;; add shortcut to re-render the frame
(global-set-key (kbd "<f5>") #'redraw-display)
(global-set-key (kbd "C-c '") #'ruby-toggle-string-quotes)

;; Always re-read changed files from disk
(global-auto-revert-mode t)

;; Smooth scrolling
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  ;; start scrolling 5 lines away from top and bottom
  (setq smooth-scroll-margin 5))

;; Help making scrolling a little less jumpy
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

;; Required by dashboard
(use-package all-the-icons :ensure t :no-require t)

;; Better home page
(use-package dashboard
  :ensure t
  :no-require t
  :config
  (dashboard-setup-startup-hook))

;; Set dashboard items
(setq dashboard-items '((recents  . 5)
                        (projects . 10)
                        ))

;; Set dashboard heading icons
(setq dashboard-set-heading-icons t)

;; Set dashboard file icons
;; TODO: get this to work
;; (setq dashboard-set-file-icons t)

;; Set the banner
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" which displays whatever image you would prefer
(setq dashboard-startup-banner '1)

;; Center dashboard content
(setq dashboard-center-content t)

;; Set custom dashboard footer message
(setq dashboard-footer "Happy coding!")

;; Disable jump shortcuts
(setq dashboard-show-shortcuts nil)

;; Load solarized-dark theme
(use-package solarized-theme
  :ensure t
  :no-require t
  :config
  (load-theme 'solarized-dark t))

;; Set up powerline
(use-package powerline
  :ensure t
  :no-require t
  :config
  (powerline-default-theme))

;; Alternatively - use telephone-line
;; (use-package telephone-line
;;   :ensure t
;;   :init
;;   (setq telephone-line-lhs
;;         '((evil   . (telephone-line-evil-tag-segment))
;;           (accent . (telephone-line-vc-segment
;;                      telephone-line-erc-modified-channels-segment
;;                      telephone-line-process-segment))
;;           (nil    . (telephone-line-minor-mode-segment
;;                      telephone-line-buffer-segment))))
;;   (setq telephone-line-rhs
;;         '((nil    . (telephone-line-misc-info-segment))
;;           (accent . (telephone-line-major-mode-segment))
;;           (evil   . (telephone-line-airline-position-segment))))
;;   :config
;;   (telephone-line-mode 1))

;; ;; Install smart-mode-line
;; (use-package smart-mode-line
;;   :ensure t
;;   :config
;;   (setq sml/shorten-directory nil)
;;   (sml/setup))

;; Install ranger
(use-package ranger
  :ensure t
  :config
  ;; Show hidden files
  (setq ranger-show-hidden t)
  ;; Don't preview files over 1MB
  (setq ranger-max-preview-size 1)
  ;; Don't show ranger header
  (setq ranger-modify-header nil)
  ;; Use ranger instead of dired
  (ranger-override-dired-mode t))

;; Use Evil mode
(use-package evil
  :ensure t
  :no-require t
  :init
  (setq evil-search-module 'evil-search)
  :config
  (evil-mode t))

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)

;; Set up leader key functionality
(use-package evil-leader
  :ensure t
  :no-require t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "<SPC>" 'helm-M-x
    ;; "<tab>" 'ranger
    "<tab>" 'deer
    "f" 'helm-find-files
    ;; "b" 'helm-buffers-list
    "m" 'helm-bookmarks
    "/" 'helm-projectile-grep
    "qq" 'evil-quit-all
    "qr" 'restart-emacs
    "bi" 'bundle-install
    "ts" 'flycheck-mode
    "z" 'zoom-mode
    "w" 'save-buffer
    "[" 'previous-buffer
    "]" 'next-buffer)
  ;; Vertical splits appear to the right
  (setq evil-vsplit-window-right t)
  ;; Horizontal splits appear below
  (setq evil-split-window-below t))

;; Quick line commenting
(use-package evil-commentary
  :ensure t
  :no-require t
  :config
  (evil-commentary-mode))

;; Set up evil escape
(use-package evil-escape
  :ensure t
  :no-require t
  :config
  (evil-escape-mode)
  ;; Set the escape sequence to jk
  (setq-default evil-escape-key-sequence "jk"))


;; Allows for swapping two pieces of text (gx)
(use-package evil-exchange
  :ensure t
  :config
  (evil-exchange-install))

;; Adds restart emacs command to keybind
(use-package restart-emacs :ensure t :no-require t)

;; Install helm
(use-package helm
  :ensure t
  :bind
  ("M-x" . helm-M-x)
  :config
  (setq helm-display-header-line nil)
  ;; Auto resize helm window
  (helm-autoresize-mode 1)
  ;; or for always 30% of frame
  ;; (setq helm-autoresize-max-height 30)
  ;; (setq helm-autoresize-min-height 30)
  ;; Open helm buffer inside current buffer frame instead of across entire window
  (setq helm-split-window-inside-p t)
  ;; Use ESC to quit helm stuff instead of C-g
  (define-key helm-map (kbd "<escape>") 'helm-keyboard-quit)
  ;; Tab opens directory in helm viewer
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  ;; C-z lists helm actions
  (define-key helm-map (kbd "C-z")  'helm-select-action))

;; install ag and helm-ag
(use-package ag :ensure t :no-require t)
(use-package helm-ag :ensure t :no-require t)

;; Install projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  ;; Set up projectile search path
  (setq projectile-project-search-path '("~/motologic/")))

;; Install helm-projectile
(use-package helm-projectile :ensure t)

;; Install flycheck
(use-package flycheck
  :ensure t
  :config
  ;; Don't lint elisp files
  (setq flycheck-global-modes '(not emacs-lisp-mode))
  (global-flycheck-mode))

;; Install rubocop
(use-package rubocop :ensure t)

;; Make sure emacs is aware of rbenv paths
;; (setenv "PATH"
;;         (concat (getenv "HOME") "/.rbenv/shims:"
;;                 (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
;; (setq exec-path
;;       (cons (concat (getenv "HOME") "/.rbenv/shims")
;;             (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(use-package exec-path-from-shell
  :ensure t
  :config
  (let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))
  )

;; Install emacs bundler control
(use-package bundler :ensure t)

;; Auto insert block "end"
(use-package ruby-end :ensure t)

(use-package enh-ruby-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
               '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
  (setq enh-ruby-deep-indent-paren nil)
  )

;; Emacs pairing with rbenv
(use-package rbenv
  :ensure t
  :config
  (global-rbenv-mode))

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package zoom
  :ensure t
  :config
  (setq zoom-size '(0.618 . 0.618)))

(use-package docker-compose-mode
  :ensure t
  :no-require t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages
   (quote
    (golden-ratio evil-search-highlight-persist telephone-line dimmer use-package solarized-theme smooth-scrolling rubocop restart-emacs rbenv ranger powerline helm-projectile helm-ag flycheck evil-surround evil-leader evil-exchange evil-escape evil-commentary dashboard bundler better-defaults all-the-icons ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )