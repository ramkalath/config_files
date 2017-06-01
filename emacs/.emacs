(load "/home/ram/.emacs.d/themes/gotham/gotham-theme.el")
(add-to-list 'load-path "~/.emacs.d/lisp/shell-pop")
(require 'shell-pop)

(global-linum-mode t)
(setq inhibit-startup-screen t)

(set-face-attribute 'default nil :height 100)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-parameter nil 'fullscreen 'fullboth)
;; (set-frame-height (selected-frame) 48))


(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'save-buffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(shell-pop-default-directory "~/")
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-size 30)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "top"))

(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'focus-out-hook 'save-buffer)
