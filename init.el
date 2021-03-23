(require 'package)

(setq package-list '(use-package))

;; Add Melpa as the default Emacs Package repository ;; only contains a very limited number of packages
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/archive-contents/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

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
(set-frame-font "SauceCodePro Nerd Font 15" nil t)

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

;; Set some higher mem thresholds
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

;; Unbind evil-jump-backward and evil-jump-forward
(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-k") 'evil-jump-forward)
(global-unset-key (kbd "<tab>"))
(global-set-key (kbd "C-j") 'evil-jump-backward)

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

;; Only doing this so I can use diminish to hide the minor mode..
(use-package page-break-lines :ensure t :diminish page-break-lines-mode)

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
(setq dashboard-footer-messages '("Happy coding!"))

;; Disable jump shortcuts
(setq dashboard-show-shortcuts nil)

;; set C++ indentation to 4
(setq c-default-style "stroustrup")

;; Add doom-themes
(use-package doom-themes
  :ensure t
  :config
  ;; (load-theme 'doom-opera t)
  ;; (load-theme 'doom-gruvbox t)
  ;; (load-theme 'doom-dracula t)
  ;; (load-theme 'doom-horizon t)
  ;; (load-theme 'doom-Iosvkem t)
  ;; (load-theme 'doom-material t)
  ;; (load-theme 'doom-nord t)
  ;; (load-theme 'doom-oceanic-next t)
  (load-theme 'doom-opera t)
  ;; (load-theme 'doom-peacock t)
  ;; (load-theme 'doom-snazzy t)
  ;; (load-theme 'doom-sourcerer t)
  ;; (load-theme 'doom-spacegrey t)
  ;; (load-theme 'doom-tomorrow-night t)
  ;; (load-theme 'doom-wilmersdorf t)
  :no-require t)

;; Load solarized-dark theme
(use-package solarized-theme
  :ensure t
  ;; :config (load-theme 'solarized-dark t)
  :no-require t)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (setq powerline-default-separator 'arrow)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (setq-default powerline-height 22)
  (spaceline-spacemacs-theme))

(use-package diminish
  :ensure t
  :init
  (diminish 'eldoc-mode)
  (diminish 'abbrev-mode))

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

;; set undo system
(use-package undo-tree :ensure t :diminish undo-tree-mode)
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

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
    "bb" 'helm-buffers-list
    "m" 'helm-bookmarks
    "/" 'helm-projectile-ag
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
  :diminish evil-commentary-mode
  :no-require t
  :config
  (evil-commentary-mode))

;; Set up evil escape
(use-package evil-escape
  :ensure t
  :diminish evil-escape-mode
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
  :bind ("M-x" . helm-M-x)
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

;; install ag and helm-ag for use with helm-projectile-ag
(use-package ag :ensure t)
(use-package helm-ag :ensure t)

;; Install projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1)
  ;; Set up projectile search path
  (setq projectile-project-search-path '("~/motologic/")))

;; Install helm-projectile
(use-package helm-projectile
  :ensure t
  :config
  (add-to-list 'grep-find-ignored-directories "spec/fixtures")
  (add-to-list 'grep-find-ignored-directories "spec/vcr"))

;; Install flycheck
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  ;; Don't lint elisp files
  (setq flycheck-global-modes '(not emacs-lisp-mode))
  (global-flycheck-mode))

;; Install rubocop
(use-package rubocop :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path))))

;; Install emacs bundler control
(use-package bundler :ensure t)

;; Auto insert block "end"
(use-package ruby-end
  :ensure t
  :diminish ruby-end-mode
  :config
  (setq ruby-end-insert-newline nil))

(use-package enh-ruby-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
               '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
  (setq enh-ruby-deep-indent-paren nil))

(use-package rust-mode :ensure t)

;; Use spaces for tabs in rust-mode
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(use-package flycheck-rust :ensure t)

;; Set up flycheck-rust
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package zoom
  :ensure t
  :diminish zoom-mode "Zoom"
  :config
  (setq zoom-size '(0.618 . 0.618)))

(use-package yaml-mode :ensure t)
(use-package dockerfile-mode :ensure t)
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )

(use-package terraform-mode :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(terraform-mode lsp-mode web-mode golden-ratio evil-search-highlight-persist telephone-line dimmer use-package solarized-theme smooth-scrolling rubocop restart-emacs rbenv ranger powerline helm-projectile helm-ag flycheck evil-surround evil-leader evil-exchange evil-escape evil-commentary dashboard bundler better-defaults all-the-icons ag)))
