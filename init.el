(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;; EVIL-MODE ;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'evil)
(evil-mode 1)

;; Global evil keys for customizations
(global-evil-leader-mode)

;; Evil org-mode
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(require 'evil-org)

;; evil-nerd-commenter: Use , to comment a line
;; (you can also do things like ",,9j" also)
(evilnc-default-hotkeys)

;; change surrounds (use cs"' to change "hello world" to 'hello world')
(require 'evil-surround)
(global-evil-surround-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;; EVIL-MODE ;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; X-clipboard-manager
(setq x-select-enable-clipboard-manager nil)

;; Smart-Indent
(electric-indent-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
(auto-fill-mode 1)

;; Auto-pairing (parens, brackets etc)
(electric-pair-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; smartparens ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'smartparens)
;; (require 'smartparens-config)
;; (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
;; (smartparens-global-mode t)
;; (defun my-open-block-c-mode (id action context)
;;   (when (eq action 'insert)
;;     (newline)
;;     (newline)
;;     (indent-according-to-mode)
;;     (previous-line)
;;     (indent-according-to-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; smartparens ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Line wrapping globally (vim-esque)
(global-visual-line-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-auto-complete t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("a164837cd2821475e1099911f356ed0d7bd730f13fa36907895f96a719e5ac3e" "c0dd5017b9f1928f1f337110c2da10a20f76da0a5b14bb1fec0f243c4eb224d4" "97d039a52cfb190f4fd677f02f7d03cf7dbd353e08ac8a0cb991223b135ac4e6" default)))
 '(eldoc-echo-area-use-multiline-p t)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(elpy-rpc-python-command "python3")
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(python-shell-interpreter "ipython3")
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

;; Auto-complete
(ac-config-default)

;; (global-linum-mode)

;; tabs and indent style
(setq indent-tabs-mode nil)
(add-hook 'c-mode-common-hook
	  (lambda () (setq indent-tabs-mode t)))
(setq-default indent-tabs-mode nil)

(require 'nodejs-repl)

;; Theme
(load-theme 'gruvbox t)
;; (load-theme 'zenburn t)
;; (load-theme 'suscolors t)

;; (add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))

;; Relative line numbers
;; It may conflict with linum, soo make sure you only have one of those on
(defun relative-abs-line-numbers-format (offset)
  "The default formatting function.
Return the absolute value of OFFSET, converted to string."
  (if (= 0 offset)
      (number-to-string (line-number-at-pos))
      (number-to-string (abs offset))))

(global-relative-line-numbers-mode)
(setq relative-line-numbers-format
      'relative-abs-line-numbers-format)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; Indentation Guidelines ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-mode 'fill)

;; (require 'indent-guide)
;; (indent-guide-global-mode)
;; (setq indent-guide-recursive t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; Indentation Guidelines ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; FONTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun font-exists-p (font)
  "Check if a given font exists"
  (if (null (x-list-fonts font))
      nil
    t))

;; Checking if we have inconsolata-g avaliable, if so, we set it
;; as our default font, otherwise, we'll check if we have the regular
;; inconsolata, if soo that will be our font.
;; If none of the conditions are met, we'll keep the systems original font
(if (font-exists-p "Inconsolata-g")
    (set-default-font "Inconsolata-g-14")
  (if (font-exists-p "Inconsolata")
      (set-default-font "Inconsolata-16")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; FONTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; semantic mode, i don't quite get the use of this, soo i'm declaring it
;; as initially off, but i may change my mind, soo keeping this here
;; UPDATE: Looks like I was a useful plugin after-all, I might give it a try
(setq semantic-mode t)

;; Makes variables and other stuff colorful and dumblooking, may be a bit
;; annoying, personally, I can't use it for more than a week without getting
;; tired / overly annoyed by it
;; (add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

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

;; Less brutal scroll-step (Emacs defaults scrolling half screen)
;; whenever your cursor hits the bottom of the screen
(setq scroll-step 1 
      scroll-conservatively 10000)

;; Shortcut for refreshing init.el
(global-set-key (kbd "C-r")
                '(lambda() (interactive)
                   (load-file "~/.emacs.d/init.el")))

;; TOP SECRET SHORTCUT
(global-set-key (kbd "C-x t e t r i s") 'tetris)

;; Hiding tool-bar (top bar)
(tool-bar-mode -1)

;; Hide scroll-bar
(scroll-bar-mode -1)

;; Python import checker
(defun mp-add-python-keys()
  (local-set-key (kbd "C-c i") 'py-import-check))
(add-hook 'python-mode-hook 'mp-add-python-keys)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;; Org-mode ;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable org-mode
(require 'org)

;; Org-mode UTF-8 bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Workflow states for Kanban like states in org-mode
;; the (!) serves for adding timestamps
(setq org-todo-keywords
      '((sequence "TODO" "DOING(!)" "DONE(!)")))

;; Hide done items
(defun org-fold-all-done-entries()
  "Close/fold all entries marked DONE."
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (while (outline-previous-heading)
      (when (org-entry-is-done-p)
        (hide-entry)))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;; Org-mode ;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;; Undo-Tree ;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable undo-tree
(global-undo-tree-mode 1)

;; Set C-z to seeing the tree
(global-set-key (kbd "C-z") 'undo-tree-visualize)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;; Undo-Tree ;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;; powerline ;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Default config for evil mode
(require 'powerline)
(powerline-center-evil-theme)

(setq powerline-default-separator 'arrow)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;; powerline ;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; web-mode;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (setq web-mode-enable-auto-pairing t)
;; auto-closing tags
(eval-after-load "web-mode"
  '(setq web-mode-tag-auto-close-style 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; web-mode;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; magit ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;https://github.com/justbur/evil-magit;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'evil-magit)

;; open a magit buffer showing currents status
(global-set-key (kbd "C-x g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; magit ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;https://github.com/justbur/evil-magit;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; Python ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
	     '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)

;; elpy
(require 'elpy)
(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")

(defun prelude-personal-python-mode-defaults ()
  "Personal defaults for Python programming."
  ;; Enable elpy mode
  (elpy-mode)
  ;; Jedibackend
  ;; (add-hook 'python-mode-hook 'jedi:setup)
  ;; (setq jedi:complete-on-dot t)
  (setq elpy-rpc-python-command "python3") 
  ;; (python-shell-interpreter "ipython3")
  (company-quickhelp-mode)
  ;; Fixing keybidings
  ;; Snippet expansion
  (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
  ;; Simultaneos editing (kinda like Sublime's C-d)
  (define-key global-map (kbd "C-c d") 'iedit-mode)
)

(setq prelude-personal-python-mode-hook 'prelude-personal-python-mode-defaults)

(add-hook 'python-mode-hook (lambda ()
                              (run-hooks 'prelude-personal-python-mode-hook)))



;; Smart tabs - Disabled since it's not pep8 default
(add-hook 'python-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice python-indent-line-1 python-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; Python ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; C ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Smart tabs (C && C++)
(add-hook 'c-mode-hook 'smart-tabs-mode-enable)
(add-hook 'c++-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; C ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; JavaScript ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Smart tabs
(add-hook 'js2-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice js2-indent-line js2-basic-offset)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; JavaScript ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Init smart-tabs
(setq-default tab-width 4)
(setq cua-auto-tabify-rectangles nil)
(smart-tabs-insinuate 'c 'c++ 'java 'javascript)
