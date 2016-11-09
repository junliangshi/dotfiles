;;; packages.el --- my-private-layer Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq my-private-layer-packages
    '(
      ;; package names go here
      ag
      wgrep
      wgrep-ag
      wgrep-helm
      rtags
      highlight-symbol
      (doxymacs :location local)
      (keyfreq :location local)
      ))

;; For each package, define a function my-private-layer/init-<package-name>
;;
(defun my-private-layer/init-ag ()
   (use-package ag
    :defer t))
(defun my-private-layer/init-wgrep ()
  (use-package wgrep
   :defer t))
(defun my-private-layer/init-wgrep-ag ()
  (use-package wgrep-ag
   :defer t))
(defun my-private-layer/init-wgrep-helm ()
  (use-package wgrep-helm
   :defer t))

(defun my-private-layer/init-highlight-symbol ()
  (use-package highlight-symbol
    :commands (highlight-symbol highlight-symbol-query-replace)
    :defer t
    :init
    (spacemacs/set-leader-keys "oo" 'highlight-symbol)
    (spacemacs/set-leader-keys "or" 'highlight-symbol-query-replace)))

(defun my-private-layer/init-rtags ()
  (use-package rtags))

(defun my-private-layer/post-init-rtags ()
    (setq company-rtags-begin-after-member-access nil)
     (setq rtags-completions-enabled t)

     (defun use-rtags (&optional useFileManager)
       (and (rtags-executable-find "rc")
            (cond ((not (gtags-get-rootpath)) t)
                  ((and (not (eq major-mode 'c++-mode))
                        (not (eq major-mode 'c-mode))) (rtags-has-filemanager))
                  (useFileManager (rtags-has-filemanager))
                  (t (rtags-is-indexed)))))

     (defun tags-find-symbol-at-point (&optional prefix)
       (interactive "P")
       (if (and (not (rtags-find-symbol-at-point prefix)) rtags-last-request-not-indexed)
           (helm-gtags-find-tag)))

     (defun tags-find-references-at-point (&optional prefix)
       (interactive "P")
       (if (and (not (rtags-find-references-at-point prefix)) rtags-last-request-not-indexed)
           (helm-gtags-find-rtag)))

     (defun tags-find-symbol ()
       (interactive)
       (call-interactively (if (use-rtags) 'rtags-find-symbol 'helm-gtags-find-symbol)))

     (defun tags-find-references ()
       (interactive)
       (call-interactively (if (use-rtags) 'rtags-find-references 'helm-gtags-find-rtag)))

     (defun tags-find-file ()
       (interactive)
       (call-interactively (if (use-rtags t) 'rtags-find-file 'helm-gtags-find-files)))

     (defun tags-imenu ()
       (interactive)
       (call-interactively (if (use-rtags t) 'rtags-imenu 'idomenu)))

     (dolist (mode '(c-mode c++-mode))
       (evil-leader/set-key-for-mode mode
         "m g ." 'rtags-find-symbol-at-point
         "m g ," 'rtags-find-references-at-point
         "m g v" 'rtags-find-virtuals-at-point
         "m g V" 'rtags-print-enum-value-at-point
         "m g /" 'rtags-find-all-references-at-point
         "m g Y" 'rtags-cycle-overlays-on-screen
         "m g >" 'rtags-find-symbol
         "m g <" 'rtags-find-references
         "m g [" 'rtags-location-stack-back
         "m g ]" 'rtags-location-stack-forward
         "m g D" 'rtags-diagnostics
         "m g G" 'rtags-guess-function-at-point
         "m g p" 'rtags-set-current-project
         "m g P" 'rtags-print-dependencies
         "m g e" 'rtags-reparse-file
         "m g E" 'rtags-preprocess-file
         "m g R" 'rtags-rename-symbol
         "m g M" 'rtags-symbol-info
         "m g S" 'rtags-display-summary
         "m g O" 'rtags-goto-offset
         "m g ;" 'rtags-find-file
         "m g F" 'rtags-fixit
         "m g L" 'rtags-copy-and-print-current-location
         "m g X" 'rtags-fix-fixit-at-point
         "m g B" 'rtags-show-rtags-buffer
         "m g I" 'rtags-imenu
         "m g T" 'rtags-taglist
         "m g h" 'rtags-print-class-hierarchy
         "m g a" 'rtags-print-source-arguments))

     (rtags-enable-standard-keybindings)
     (define-key c-mode-base-map (kbd "M-.") (function tags-find-symbol-at-point))
     (define-key c-mode-base-map (kbd "M-,") (function tags-find-references-at-point))
     (define-key c-mode-base-map (kbd "M-;") (function tags-find-file))
     (define-key c-mode-base-map (kbd "C-.") (function tags-find-symbol))
     (define-key c-mode-base-map (kbd "C-,") (function tags-find-references))
     (define-key c-mode-base-map (kbd "C-<") (function rtags-find-virtuals-at-point))
     (define-key c-mode-base-map (kbd "M-i") (function tags-imenu))

     (define-key global-map (kbd "M-.") (function tags-find-symbol-at-point))
     (define-key global-map (kbd "M-,") (function tags-find-references-at-point))
     (define-key global-map (kbd "M-;") (function tags-find-file))
     (define-key global-map (kbd "C-.") (function tags-find-symbol))
     (define-key global-map (kbd "C-,") (function tags-find-references))
     (define-key global-map (kbd "C-<") (function rtags-find-virtuals-at-point))
     (define-key global-map (kbd "M-i") (function tags-imenu)))

(defun my-private-layer/init-keyfreq ()
  (use-package keyfreq
    :defer t
    :init
    :commands keyfreq-mode
    ))

(defun my-private-layer/init-doxymacs()
  (use-package doxymacs
    :defer t
    :diminish doxymacs-mode
    :commands doxymacs-mode
    :init
    (add-hook 'c-mode-common-hook 'doxymacs-mode)
    (defconst doxymacs-my-file-comment-template
      '("/**" > n
        " * " (doxymacs-doxygen-command-char) "file      "
        (if (buffer-file-name)
            (file-name-nondirectory (buffer-file-name))
          "") > n
          " * " (doxymacs-doxygen-command-char) "author    "
          (user-full-name) > n
          " * " (doxymacs-doxygen-command-char) "date      "
          (current-time-string) > n
          " * " (doxymacs-doxygen-command-char) "copyright "
          "(c) 2016 ASML US. All right reserved." > n
          " *" > n
          " * " (doxymacs-doxygen-command-char) "brief     "
          (p "Brief description of this file: ") > n
          " */" >)
      "Default my template for file documentation.")
    (defconst doxymacs-my-function-comment-template
      '((let ((next-func (doxymacs-find-next-func)))
          (if next-func
              (list
               'l
               "/**" '> 'n
               " * " 'p '> 'n
               (doxymacs-parm-tempo-element (cdr (assoc 'args next-func)))
               (unless (string-match
                        (regexp-quote (cdr (assoc 'return next-func)))
                        doxymacs-void-types)
                 '(l " * " (doxymacs-doxygen-command-char)
                     "return " (p "Returns: ") > n))
               " */" '>)
            (progn
              (error "Can't find next function declaration.")
              nil))))
      "Default my-style template for function documentation.")
    (defconst doxymacs-my-blank-multiline-comment-template
      '("/**" > n "* " p > n "*/" >)
      "Default my-style template for a blank multiline doxygen comment.")
    (defconst doxymacs-my-blank-singleline-comment-template
      '("/** " p " */" >)
      "Default my-style template for a blank singleline doxygen comment.")
    (custom-set-variables
     '(doxymacs-file-comment-template doxymacs-my-file-comment-template)
     '(doxymacs-function-comment-template doxymacs-my-function-comment-template)
     '(doxymacs-blank-multiline-comment-template doxymacs-my-blank-multiline-comment-template)
     '(doxymacs-blank-singleline-comment-template doxymacs-my-blank-singleline-comment-template))
    :config
    ;; Enable all my custom templates
    (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
    ;; (define-key evil-insert-state-map (kbd "C-h") 'tempo-backward-mark)
    ;; (define-key evil-insert-state-map (kbd "C-l") 'tempo-forward-mark)
    (add-hook 'c++-mode-hook (lambda ()
                               (define-key evil-insert-state-local-map
                                 (kbd "RET") 'my-doxgen-return)))
    ))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
