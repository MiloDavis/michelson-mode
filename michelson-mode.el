;; Keymap
(progn
  (defvar michelson-mode-map nil
	"Keymap for Michelson major mode.")
  
  (setq michelson-mode-map (make-sparse-keymap)))

;; File extensions
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.tez\\'" . michelson-mode))
(add-to-list 'auto-mode-alist '("\\.tz\\'" . michelson-mode))

;; Highlighting
(defconst michelson-font-lock
  (list
   '("\\b\[A-Z\]+\\b" . font-lock-builtin-face))
  "Minimal highlighting expressions for Michelson mode.")
(setq font-lock-defaults t)

(define-derived-mode michelson-mode prog-mode "Michelson mode"
  (setq font-lock-defaults '(michelson-font-lock)))

(add-hook 'michelson-mode-hook
          (lambda ()
            (set (make-local-variable 'comment-start) "# ")))


(provide 'michelson-mode)
