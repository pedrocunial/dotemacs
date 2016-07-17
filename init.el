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
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(server-mode t)
 '(show-paren-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))

 ;; from http://stackoverflow.com/questions/23792526/indentation-inside-brackets-and-not-beside-closing-bracket-in-emacs
 '(c-hanging-braces-alist (quote ((substatement-open . (after)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ac-config-default)

;; (global-linum-mode)

;; tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(require 'nodejs-repl)

(load-theme 'suscolors t)

;; (add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

;; evil-nerd-commenter: Use , to comment a line
;; (you can also do things like ",,9j" also)
(evilnc-default-hotkeys)

;; change surrounds (use cs"' to change "hello world" to 'hello world')
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Relative line numbers
;; It may conflict with linum, soo make sure you only have one of those on
(defun relative-abs-line-numbers-format (offset)
  "The default formatting function.
Return the absolute value of OFFSET, converted to string."
  (if (= 0 offset)
      (number-to-string (line-number-at-pos))
      (number-to-string (abs offset))))

(global-relative-line-numbers-mode)
(setq relative-line-numbers-format 'relative-abs-line-numbers-format)

(require 'indent-guide)
(indent-guide-global-mode)
(setq indent-guide-recursive t)

(set-default-font "Inconsolata-16")

;; semantic mode, i don't quite get the use of this, soo i'm declaring it
;; as initially off, but i may change my mind, soo keeping this here
(setq semantic-mode nil)
