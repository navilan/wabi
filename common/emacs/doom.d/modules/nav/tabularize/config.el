;;; https://raw.githubusercontent.com/stephen-hannam/.dotfiles/6c9e7ddf598a1c78a81797c73cb93b45afcea6de/.new-emacs.d/lib/tabularize.el
;;; tabularize.el --- equivalent to the Vim plugin that I love and use every day

;;; Code:


;; TODO Add keybindings
;; TODO Add parameterization for with space without space

(defun get-text-block-positions (char)
  "Return a vector [begin end] of text block,
 Return a vector [begin end] that's the begin and end positions of text block the cursor is in.
Text block is group of lines separated by blank lines.
Adapted from code @ URL `http://ergoemacs.org/emacs/elisp_get_text_block.html'"
  (interactive)
  (let* ($op $b1 $b2 $p1 $p2)
    (setq $op (point))
    (save-excursion
      (if (re-search-backward "\n[ \t]*\n" nil "move")
          (progn (re-search-forward "\n[ \t]*\n")
                 (setq $b1 (point)))
        (setq $b1 (point)))
      (if (re-search-forward "\n[ \t]*\n" nil "move")
          (progn (re-search-backward "\n[ \t]*\n")
                 (setq $b2 (point)))
        (setq $b2 (point)))
      (goto-char $op)
      (if (re-search-backward (format "^[^%s]+$" char) $b1 "move")
          (progn (re-search-forward (format "^[^%s]+$" char))
                 (setq $p1 (point)))
        (setq $p1 (point))))
      (if (re-search-forward (format "^[^%s]+$" char) $b2 "move")
          (progn (re-search-backward (format "^[^%s]+$" char))
                 (setq $p2 (point)))
        (setq $p2 (point)))
      (goto-char $op)
    (vector $p1 $p2)))

;;;###autoload
(defun align-to-colon ()
  "Align region to colon : signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions ":"))
    (align-regexp (aref $ps  0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) ":") 1 0)))

;;;###autoload
(defun align-to-open-paren ()
  "Align region to ( signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions "("))
    (align-regexp (aref $ps  0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) "(") 1 0)))

;;;###autoload
(defun align-to-open-bracket ()
  "Align region to [ signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions "["))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) "[") 1 0)))

;;;###autoload
(defun align-to-period ()
  "Align region to period . signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions "."))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) ".") 1 0)))

;;;###autoload
(defun align-to-comma-before ()
  "Align region to comma , signs; will move commas into columns"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions ","))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) ",") 1 0)))


;;;###autoload
(defun align-to-comma-after ()
  "Align region to comma , signs; leaves commas in place"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions ","))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx "," (group (zero-or-more (syntax whitespace))) ) 1 0)))


;;;###autoload
(defun align-to-semi-before ()
  "Align region to semicolon ; signs; will move semicolon into columns"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions ";"))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) ";") 1 1 1)))


;;;###autoload
(defun align-to-semi-after ()
  "Align region to comma , signs; leaves semicolons in place"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions ";"))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx ";" (group (zero-or-more (syntax whitespace))) ) 1 1 1)))

;;;###autoload
(defun align-to-equals ()
  "Align region to equal = signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions "="))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) "=") 1 0)))

;;;###autoload
(defun align-to-hash ()
  "Align region to hash => signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions "=>"))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) "=>") 1 0)))

;;;###autoload
(defun align-to-non-blocking-assign ()
  "Align region to hash <= signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions "<="))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) "<=") 1 0)))

;;;###autoload
(defun align-to-single-quote ()
  "Align region to hash <= signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions "'"))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) "'") 1 0)))

;;;###autoload
(defun align-to-double-quote ()
  "Align region to hash <= signs"
  (interactive)
  (let ($ps)
    (setq $ps (get-text-block-positions "\""))
    (align-regexp (aref $ps 0) (aref $ps 1)
                  (rx (group (zero-or-more (syntax whitespace))) "\"") 1 0)))

(provide 'tabularize)

;;; tabularize.el ends here
