(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'evil)
(evil-mode 1)

(define-key global-map (kbd "RET") 'newline-and-indent)

(electric-pair-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t)
 '(show-paren-mode t))

 ;; from http://stackoverflow.com/questions/23792526/indentation-inside-brackets-and-not-beside-closing-bracket-in-emacs
 '(c-hanging-braces-alist (quote ((substatement-open . (after)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ac-config-default)

(global-linum-mode)

;; tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(require 'nodejs-repl)

(load-theme 'suscolors t)

;; (add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

;; evil-nerd-commenter: Use , to comment a line
;; (you can also do things like ",i(" also)
(evilnc-default-hotkeys)
