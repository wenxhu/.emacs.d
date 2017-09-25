;; init.el --- Emacs configuration

;; Install Packages
;; --------------------------------------

(require 'package)
;;; Code:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar myPackages
  '(dracula-theme            ;; A dark theme for Emacs
    leuven-theme             ;; A Awesome Emacs color theme
    material-theme           ;; A Material Design for Emacs
    monokai-theme            ;; A fruity color theme for Emacs
    jazz-theme               ;; A warm color theme for Emacs
    helm                     ;; Incremental and narrowing framework
    magit                    ;; A Git Porcelain inside Emacs
    company                  ;; Modular text completion framework
    flycheck                 ;; On-the-fly syntax checking
    yasnippet                ;; Yet another snippet extension
    projectile               ;; Manage and navigate projects in Emacs easily
    tide                     ;; Typrscript Interactive Development Environment
    
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; Basic Customization
;; --------------------------------------

(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(toggle-frame-fullscreen)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-linum-mode t)
(column-number-mode t)
(line-number-mode t)
(show-paren-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq default-directory "~/Code/")

(add-to-list 'default-frame-alist
             '(font . "Source Code Pro"))

(setq display-time-24hr-format t
      display-time-format "%Y-%m-%d | %H:%M"
      display-time-day-and-date t
      display-time-interval 60
      display-time-default-load-average nil)
(display-time-mode)

;; Theme Customization
;; --------------------------------------

;;(load-theme 'dracula t)
;;(load-theme 'leuven t)
;;(load-theme 'material t)
(load-theme 'monokai t)
;;(load-theme 'jazz t)

;; Plugin Customization
;; --------------------------------------

;; helm
(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)

;; projectile
(projectile-global-mode)

;; company
(require 'company)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-align-annotations t)
(add-hook 'after-init-hook 'global-company-mode)

;; flycheck
(require 'flycheck)
(global-flycheck-mode)

;; Typescript Customization
;; --------------------------------------

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tide projectile yasnippet flycheck company magit helm jazz-theme monokai-theme material-theme leuven-theme dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
