;;; org-blueprint.el --- Framework for writing novels -*- lexical-binding: 't -*-

;; Copyright (C) 2023 Jacob Stannix

;; Author: Jacob Stannix
;; Version: 0.0.1
;; Package-Requires: ((org "9.5.5"))

;;; Commentary:

;; This package provides a minor mode to make outlining books
;; easier.

;;;###autoload
(define-minor-mode org-blueprint-mode
  "Toggle Org Blueprint Mode."
  :init-value nil
  :lighter " Blueprint")

(defgroup org-blueprint nil "Customization options for org blueprint")

(defcustom org-blueprint-file-name "Blueprint.org"
  :type 'string
  :require 'org-blueprint-mode
  :group 'org-blueprint)

(defun org-blueprint--make-heading-table ()
  "Places the text from the start of the headind to it's end into
  a table"

  (with-current-buffer (current-buffer)
    (let ((start-line (+ (line-number-at-pos (org-entry-beginning-position) 't) 1))
	   (end-line (- (line-number-at-pos (org-entry-end-position) 't) 1))
	   )
      (beginning-of-line)
      (goto-line start-line)
      (rectangle-mark-mode 1)
      (goto-line end-line)
      (end-of-line)
      (delete-extract-rectangle (region-beginning) (region-end))
      (insert "|")
      (beginning-of-line)
      (org-cycle)
;;      (forward-char)
      (org-table-paste-rectangle)
      )))
