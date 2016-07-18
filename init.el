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
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("a164837cd2821475e1099911f356ed0d7bd730f13fa36907895f96a719e5ac3e" "c0dd5017b9f1928f1f337110c2da10a20f76da0a5b14bb1fec0f243c4eb224d4" "97d039a52cfb190f4fd677f02f7d03cf7dbd353e08ac8a0cb991223b135ac4e6" default)))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(rainbow-identifiers-cie-l*a*b*-lightness 70)
 '(rainbow-identifiers-cie-l*a*b*-saturation 20)
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

(load-theme 'gruvbox t)

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
;; UPDATE: Looks like I was a useful plugin after-all, I might give it a try
(setq semantic-mode t)

(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

;; Define default JS indentation for 2 spaces instead of 4
(setq js-indent-level 2)

;; Rainbow Delimiters (Parenthesis, brackets etc will have different
;; color based on their "level")
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; NeoTree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(add-hook 'neotree-mode-hook
        (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
;; This block makes soo that NeoTree will always open on the current file as
;; the default node
;; (setq neo-smart-open t)

;; Hiding tool-bar (top bar)
(tool-bar-mode -1)
