;;(setq unix-init-path "~/.emacs.d")
(add-to-list `load-path "~/.emacs.d/plugins/")

(require `popwin)
(popwin-mode 1)

;;erlang support
;;(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.10/emacs"
;;      load-path))
;;(setq erlang-root-dir "/usr/local/lib/erlang")
;;      (setq exec-path (cons "/usr/local/otp/bin" exec-path))
;;(require 'erlang-start)

;;podsvetka vstavlennogo teksta
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; another moving between buffers M + arrows - seems doesnt work
(windmove-default-keybindings `meta)

;;switch off startup and splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;;switch off auto save and auto backup
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)


;;scrolling settings
(setq scroll-step 1)
(setq scroll-margin 10)
(setq scroll-conservatively 10000)

;; Display the name of the current buffer in the title bar
(menu-bar-mode -1)
;;(scroll-bar-mode -1)
;;(tool-bar-mode -1)
(setq frame-title-format "GNU Emacs: %b")

;;podsvetka current stroki
(global-hl-line-mode 1)

;; lines numer = linum plugin
(require `linum)
(line-number-mode t)
(global-linum-mode t)
(setq linum-format " %d")

;;buffer selection and iBuffer settings
(require `bs)
(require `ibuffer)
(defalias `list-buffers `ibuffer)
(global-set-key (kbd "<f2>") `bs-show)

;;kill buffer without confirmation
(defun kill-current-buffer ()
(interactive)
(kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") `kill-current-buffer)


;;display time
(setq display-time-interval 1)
(setq display-time-format "%H:%M:%S")
(display-time-mode)

;;Scrolling settings

;;Zenburn theme
(add-to-list `custom-theme-load-path "~/.emacs.d/themes/")
(custom-set-faces
 `(default ((t (:background "brightblack"))))
)
(load-theme `zenburn t)

;;(add-to-list `load-path "~/.emacs.d/color-theme/color-theme-6.6.0/")
;;(add-to-list `load-path "~/.emacs.d/color-theme/color-theme-6.6.0/")
;;(require 'color-theme)
;;(load "~/.emacs.d/zenburn")

;;(eval-after-load "color-theme"
;;`(progn
;;  (color-theme-initialize)
;;  (setq color-theme-is-global t)
;;  (color-theme-zenburn)))

;;(add-to-list `custom-theme-load-path "~/.emacs.d/themes/")
;;
;;(defvar zenburn-override-colors-alist
;;`(("zenburn-bg+05" . "#282828")
;; ("zenburn-bg+1" . "#2F2F2F")
;; ("zenburn-bg+2" . "#3F3F3F")
;; ("zenburn-bg+3" . "#4F4F4F")))
;;
;;redefine some keys
(global-set-key (kbd "M-j") `backward-char)
(global-set-key (kbd "M-l") `forward-char)
(global-set-key (kbd "M-i") `previous-line)
(global-set-key (kbd "M-k") `next-line)
;;show parren mode settings
(show-paren-mode t)
(setq show-paren-style `expression)
;;Electric-modes settings
(electric-pair-mode 1)
(electric-indent-mode -1)
(setq electric-pair-pairs `( 
			    (?\" . ?\")
			    (?\{ . ?\})
			    (?\< . ?\>)
))
;;Indent settings
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)
;;(setq-default standart-indent 4)
;;(global-set-key (kbd "RET") `newline-and-indent)

;;lua-mode enabling
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
