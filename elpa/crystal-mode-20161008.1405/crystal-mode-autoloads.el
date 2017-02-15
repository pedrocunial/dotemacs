;;; crystal-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "crystal-mode" "crystal-mode.el" (22621 52290
;;;;;;  85055 48000))
;;; Generated autoloads from crystal-mode.el

(autoload 'crystal-mode "crystal-mode" "\
Major mode for editing Crystal code.

\\{crystal-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons (purecopy (concat "\\(?:\\." "cr" "\\)\\'")) 'crystal-mode))

(dolist (name (list "crystal")) (add-to-list 'interpreter-mode-alist (cons (purecopy name) 'crystal-mode)))

;;;***

;;;### (autoloads nil nil ("crystal-flycheck.el" "crystal-mode-pkg.el")
;;;;;;  (22621 52290 125054 229000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; crystal-mode-autoloads.el ends here
