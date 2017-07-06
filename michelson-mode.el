;; Keymap
(progn
  (defvar michelson-mode-map nil
	"Keymap for Michelson major mode.")
  
  (setq michelson-mode-map (make-sparse-keymap)))

;; File extensions
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.tez\\'" . michelson-mode))
(add-to-list 'auto-mode-alist '("\\.tz\\'" . michelson-mode))

(defconst michelson-command-list
  '("DROP"
	"DUP"
	"SWAP"
	"PUSH"
	"SOME"
	"NONE"
	"IF_NONE"
	"PAIR"
	"CAR"
	"CDR"
	"LEFT"
	"RIGHT"
	"IF_LEFT"
	"NIL"
	"CONS"
	"IF_CONS"
	"EMPTY_SET"
	"EMPTY_MAP"
	"MAP"
	"REDUCE"
	"MEM"
	"GET"
	"UPDATE"
	"IF"
	"LOOP"
	"LAMBDA"
	"EXEC"
	"DIP"
	"FAIL"
	"NOP"
	"CONCAT"
	"ADD"
	"SUB"
	"MUL"
	"DIV"
	"ABS"
	"NEG"
	"MOD"
	"LSL"
	"LSR"
	"OR"
	"AND"
	"XOR"
	"NOT"
	"COMPARE"
	"EQ"
	"NEQ"
	"LT"
	"GT"
	"LE"
	"GE"
	"CAST"
	"CHECKED_ABS"
	"CHECKED_NEG"
	"CHECKED_ADD"
	"CHECKED_SUB"
	"CHECKED_MUL"
	"CHECKED_CAST"
	"FLOOR"
	"CEIL"
	"INF"
	"NAN"
	"ISNAN"
	"NANAN"
	"MANAGER"
	"TRANSFER_TOKENS"
	"CREATE_ACCOUNT"
	"CREATE_CONTRACT"
	"NOW"
	"AMOUNT"
	"BALANCE"
	"CHECK_SIGNATURE"
	"H"
	"STEPS_TO_QUOTA"
	"SOURCE"
	"CADR"
	"CADDR"))

;; Highlighting
(defconst michelson-font-lock
  `((,(regexp-opt michelson-command-list 'words) . font-lock-builtin-face)
	(,(regexp-opt
	   '("string" "bool" "unit" "list" "pair" "option" "or" "set" "map")
	   'words)
	 . font-lock-type-face)
	("u?int\\(8\\|16\\|32\\|64\\)" . font-lock-type-face)
	(,(regexp-opt '("parameter" "return" "storage" "code") 'words)
	 . font-lock-keyword-face)
	("#.\*" . font-lock-comment-face))
  "Minimal highlighting expressions for Michelson mode.")
(setq font-lock-defaults t)

(define-derived-mode michelson-mode prog-mode "Michelson mode"
  (setq font-lock-defaults '(michelson-font-lock)))

(add-hook 'michelson-mode-hook
          (lambda ()
            (set (make-local-variable 'comment-start) "# ")))


(provide 'michelson-mode)
