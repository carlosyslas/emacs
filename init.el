;; -*- lexical-binding: t; -*-
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

(straight-use-package 'use-package)

(setq is-mac (eq system-type 'darwin))
(when is-mac
  (setq mac-command-modifier 'meta
	mac-option-modifier nil
	mac-right-option-modifier 'control))

;; Basic config
(use-package emacs
  :ensure nil
  :config
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (delete-selection-mode 1)
  (electric-pair-mode 1)
  (set-variable 'inhibit-startup-message t)
  (set-variable 'use-short-answers t))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(use-package crux
  :ensure t
  :straight t
  :bind
  (("C-a" . crux-move-beginning-of-line)
   ("C-k" . crux-smart-kill-line)
   ("C-," . crux-duplicate-current-line-or-region)
   ("C-c I" . crux-find-user-init-file)
   ("C-c l" . crux-find-current-directory-dir-locals-file)
   ("C-<backspace>" . crux-kill-line-backwards)))

(use-package exec-path-from-shell
  :ensure t
  :straight t
  :config
  (exec-path-from-shell-initialize))


(use-package magit
  :ensure t
  :straight t)

(use-package agent-shell
  :ensure t
  :straight t)

(use-package ace-window
  :ensure t
  :straight t
  :config
  (setq aw-keys '(?u ?i ?o ?p ?j ?k ?l))
  :bind
  (("M-o". #'ace-window)))

(use-package vertico
  :ensure t
  :straight t
  :config
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :straight t
  :config
  (marginalia-mode))

(use-package dumb-jump
  :ensure t
  :straight t
  :custom
  (dump-jump-prefer-searcher 'rg)
  :ensure-system-package (rg)
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package go-mode
  :ensure t
  :straight t)

(use-package spacious-padding
  :ensure t
  :straight t
  :config
  (spacious-padding-mode 1))

(use-package olivetti
  :ensure t
  :straight t)


(load-theme 'modus-operandi-tinted)
(set-face-attribute 'default nil :family "Iosevka Nerd Font" :height 150)
