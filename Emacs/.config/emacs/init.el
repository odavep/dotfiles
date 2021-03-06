;;; init.el --- My custom init.el that starts my Emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Aryadev Chavali

;; Author: Aryadev Chavali <aryadev@aryadevchavali.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;; Code:

;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t
      use-package-enable-imenu-support t
      use-package-always-demand nil
      use-package-always-defer nil
      use-package-hook-name-suffix nil
      use-package-compute-statistics t)

(straight-use-package 'use-package)

;;; Load literate

;; Setup directories and constants
(defconst +literate/org-files (list (concat user-emacs-directory "config.org")))
(defconst +literate/output-files
  (mapcar #'(lambda (x) (replace-regexp-in-string ".org" ".el" x)) +literate/org-files))

(defun +literate/load-config ()
  "Load all files in +literate/output-files."
  (mapc #'(lambda (x) (load-file x)) +literate/output-files))

(defun +literate/org-files-exist ()
  "Checks if output files exist, for compilation purposes."
  (require 'cl-lib)
  (if (< 1 (length +literate/output-files))
      (cl-reduce #'(lambda (x y) (and x y)) (mapc #'file-exists-p +literate/output-files)
                 :initial-value t)
    (file-exists-p (car +literate/output-files))))

(autoload #'org-babel-tangle-file "ob-tangle")
(defun +literate/compile-config ()
  "Compile all files in +literate/org-files via org-babel-tangle."
  (mapc #'org-babel-tangle-file +literate/org-files))

;; Killing Emacs hook
(add-hook
 'kill-emacs-hook
 #'+literate/compile-config)

(unless (+literate/org-files-exist)
  (+literate/compile-config))

(+literate/load-config)

(when (daemonp)
  (require 'general)
  (require 'evil)
  (require 'notmuch)
  (require 'company)
  (require 'org)
  (require 'eglot))

(setq gc-cons-threshold 100000000)

(provide 'init)
;;; init.el ends here
