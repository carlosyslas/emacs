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

;; Basic config
(use-package emacs
  :ensure nil
  :config
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (delete-selection-mode 1))

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

(load-theme 'modus-vivendi)
(set-face-attribute 'default nil :family "Iosevka Nerd Font" :height 150)
