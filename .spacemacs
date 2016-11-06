;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     git
     markdown
     org
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     ycmd
     gtags
     semantic
     syntax-checking
     python
     go
     java
     javascript
     latex
     ruby
     ruby-on-rails
     sql
     swift
     html
     lua
     php
     helm
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     version-control
     command-log
     deft
     spell-checking
     ranger
     themes-megapack
     my-private-layer
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(eshell-prompt-extras vi-tilde-fringe auto-highlight-symbol popwin)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light
                         tangotango
                         zenburn
                         hc-zenburn
                         sanityinc-tomorrow-eighties
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq exec-path-from-shell-check-startup-files nil)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; do not ask me when loading my .dir-local.el file
  ;; (put 'my_dummy_local_var 'safe-local-variable (lambda (xx) t))
  ;; (add-to-list 'projectile-other-file-alist '("html" "js"))
  ;; (add-to-list 'projectile-other-file-alist '("js" "html"))
  ;; (setq evil-move-cursor-back nil)
  (setq-default git-magit-status-fullscreen t)
  (setq powerline-default-separator 'nil)
  (spaceline-compile)

  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)

  (setq create-lockfiles nil)

  (setq-default fill-column 100)
  ;; set different value for main mode
  ;; (add-hook 'mail-mode-hook (lambda () (setq fill-column 72)))
  ;; (add-hook 'python-mode-hook (lambda () (setq fill-column 79)))
  (setq column-enforce-column 101)
  (spacemacs/toggle-highlight-long-lines-globally-on)
  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)

  (setq deft-directory "~/org")
  (setq projectile-enable-caching t)
  (global-set-key (kbd "C-c e") 'iedit-mode)

  ;; (setq ahs-default-range 'ahs-range-display)
  (spacemacs/set-leader-keys "oh" 'hlt-highlight-symbol)
  (spacemacs/set-leader-keys "ou" 'hlt-unhighlight-symbol)
  (global-set-key (kbd "C-c hh") 'hlt-highlight-symbol)
  (global-set-key (kbd "C-c hu") 'hlt-unhighlight-symbol)

  ;; ws-butler-mode
  (add-hook 'c-mode-common-hook 'ws-butler-mode)
  (add-hook 'python-mode-hook 'ws-butler-mode)
  (add-hook 'cython-mode-hook 'ws-butler-mode)

  ;; semantic
  ;; (add-hook 'semantic-mode-hook 'global-semantic-idle-local-symbol-highlight-mode)
  (add-hook 'semantic-mode-hook 'global-semantic-highlight-func-mode)

  ;; org mode
  (with-eval-after-load 'org
    (setq org-directory "~/org")
    (setq org-clock-into-drawer t)
    (setq org-clock-idle-time 15)
    ;; open agenda view in current window
    (setq org-agenda-window-setup (quote current-window))
    ;; only show deadline if scheduled and deadline are duplicate items
    (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
    ;; do not show tasks scheduled or has deadlines in normal todo list
    (setq org-agenda-todo-ignore-deadlines (quote all))
    (setq org-agenda-todo-ignore-scheduled (quote all))
    ;; cannot change parent to done, if sub item is not done
    (setq org-enforce-todo-dependencies t)
    ;; auto log
    (setq org-log-done (quote time))
    (setq org-log-redeadline (quote time))
    (setq org-log-reschedule (quote time))
    (setq org-agenda-show-inherited-tags 'always)
    ;; (setq org-clock-continuously t)
    (setq org-agenda-custom-commands
          '(("w" . "work items")
            ("ww" "Work Agenda & All TODOs"
             ((agenda "" ((org-agenda-files (list (concat org-directory "/work.org")))))
              (alltodo "" ((org-agenda-files (list (concat org-directory "/work.org")))
                           (org-agenda-sorting-strategy '(todo-state-up))))
              (alltodo "" ((org-agenda-files (list (concat org-directory "/refile.org")))))))
            ("wn" "Work Next Items" todo "+WORK+TODO=\"NEXT\"")
            ("wa" "All Work Items" tags-todo "WORK")
            ("p" . "personal items")
            ("pp" "Personal Agenda & All TODOs"
             ((agenda "" ((org-agenda-files (list (concat org-directory "/gtd.org")))))
              (alltodo "" ((org-agenda-files (list (concat org-directory "/gtd.org")))
                           (org-agenda-sorting-strategy '(todo-state-up))))
              (alltodo "" ((org-agenda-files (list (concat org-directory "/refile.org")))))))
            ("pn" "Personal Next Items" tags "-WORK+TODO=\"NEXT\"")
            ("pa" "All personal Items" tags-todo "-WORK")
            ("r" "Refile Items" alltodo "" ((org-agenda-files (list (concat org-directory "/refile.org")))))
            ("j" "Agenda & All TODOs" ((agenda "") (alltodo "")))))
    (setq org-agenda-files (list (concat org-directory "/gtd.org")
                                 (concat org-directory "/work.org")
                                 (concat org-directory "/refile.org")
                                 (concat org-directory "/someday.org")))
    (setq org-refile-targets '((nil :maxlevel . 9)
                               (org-agenda-files :maxlevel . 9)))
    (setq org-outline-path-complete-in-steps nil) ; use helm to complete
    (setq org-agenda-repeating-timestamp-show-all nil)
    (setq org-refile-use-outline-path 'file)
    (setq org-refile-allow-creating-parent-nodes `confirm)
    (setq org-todo-keywords '((sequence "STARTED(s)" "NEXT(n)" "TODO(t)"
                                        "HOLD(h)" "WAITING(w)" "|" "CANCELED(c)"
                                        "DONE(d)")))
    (setq org-tag-alist '((:startgroup)
                          ("@STORE" . ?s)
                          ("@WORK" . ?w)
                          ("@HOME" . ?H)
                          ("@COMPUTER" . ?C)
                          (:endgroup)
                          ("WORK" . ?W)
                          ("SHOPPING" . ?S)
                          ("NOTE" . ?n)))
    (setq org-use-fast-todo-selection t)
    (setq org-capture-templates '(("t" "Create a new task"
                                   entry
                                   (file+headline "refile.org" "Tasks")
                                   "* TODO %?\n%U\n%a\n"
                                   :clock-in t
                                   :clock-resume t)
                                  ("n" "Create note"
                                   entry
                                   (file "notes.org")
                                   "* %? :NOTE:\n%U\n%a\n"
                                   :clock-in t
                                   :clock-resume t)
                                  ("j" "Create journal"
                                   entry
                                   (file+datetree "journal.org")
                                   "* %?\n%U\n"
                                   :clock-in t
                                   :clock-resume t))))
  ;; ycmd setting
  ;; (set-variable 'ycmd-server-command
  ;;               '("python" "/home/jshi/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"
  ;;                 "--log" "info"))
  (set-variable 'ycmd-server-command
                '("python" "/home/jshi/bin64/ycmd.10.09.2016/ycmd/ycmd"
                  "--log" "info" "--keep_logfiles"))
  (set-variable 'ycmd-extra-conf-whitelist
                '("/n/filer3b/home/dev/jshi/code_work/code_git/branch10/*"))
  ;;(add-hook 'python-mode-hook 'ycmd-mode)
  (add-hook 'ruby-mode-hook 'ycmd-mode)
  (add-hook 'php-mode-hook 'ycmd-mode)
  (add-hook 'go-mode-hook 'ycmd-mode)
  ;; ggtags setting
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
  (defun my-hook-ggtags-mode ()
    ;; define my ggtags keybinds
    (evil-define-key 'normal ggtags-mode-map (kbd ", t t") 'ggtags-find-tag-dwim)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t d") 'ggtags-find-definition)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t r") 'ggtags-find-reference)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t o") 'ggtags-find-other-symbol)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t f") 'ggtags-find-tag-regexp)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t s") 'ggtags-save-to-register)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t /") 'ggtags-view-search-history)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t h") 'ggtags-view-tag-history)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t ]") 'ggtags-next-mark)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t [") 'ggtags-prev-mark)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t p") 'previous-error)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t n") 'next-error)
    (evil-define-key 'normal ggtags-mode-map (kbd ", t m") 'pop-tag-mark)

    (define-key ggtags-mode-map (kbd "C-c t t") 'ggtags-find-tag-dwim)
    (define-key ggtags-mode-map (kbd "C-c t d") 'ggtags-find-definition)
    (define-key ggtags-mode-map (kbd "C-c t r") 'ggtags-find-reference)
    (define-key ggtags-mode-map (kbd "C-c t o") 'ggtags-find-other-symbol)
    (define-key ggtags-mode-map (kbd "C-c t f") 'ggtags-find-tag-regexp)
    (define-key ggtags-mode-map (kbd "C-c t s") 'ggtags-save-to-register)
    (define-key ggtags-mode-map (kbd "C-c t /") 'ggtags-view-search-history)
    (define-key ggtags-mode-map (kbd "C-c t h") 'ggtags-view-tag-history)
    (define-key ggtags-mode-map (kbd "C-c t ]") 'ggtags-next-mark)
    (define-key ggtags-mode-map (kbd "C-c t [") 'ggtags-prev-mark)
    (define-key ggtags-mode-map (kbd "C-c t p") 'previous-error)
    (define-key ggtags-mode-map (kbd "C-c t n") 'next-error)
    (define-key ggtags-mode-map (kbd "C-c t m") 'pop-tag-mark))
  (add-hook 'ggtags-mode-hook 'my-hook-ggtags-mode)
  ;; turn on ansi color interpretation in compilation buffer
  (require 'ansi-color)
  (defun colorize-compilation-buffer ()
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min)
                                  (point-max))))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
  ;; code style for cc-mode
  (c-add-style "brion_code_style"
               '("gnu"
                 (c-basic-offset . 4) ; Guessed value
                 (c-offsets-alist (arglist-intro . +) ; Guessed value
                                  (block-close . 0) ; Guessed value
                                  (brace-list-close . 0) ; Guessed value
                                  (brace-list-entry . 0) ; Guessed value
                                  (brace-list-intro . +) ; Guessed value
                                  (class-close . 0) ; Guessed value
                                  (defun-block-intro . +) ; Guessed value
                                  (defun-close . 0) ; Guessed value
                                  (inclass . +) ; Guessed value
                                  (innamespace . 0) ; Guessed value
                                  (label . 0) ; Guessed value
                                  (member-init-cont . 0) ; Guessed value
                                  (member-init-intro . +) ; Guessed value
                                  (namespace-close . 0) ; Guessed value
                                  (statement . 0) ; Guessed value
                                  (statement-block-intro . +) ; Guessed value
                                  (statement-cont . +) ; Guessed value
                                  (substatement . 0) ; Guessed value
                                  (substatement-open . 0) ; Guessed value
                                  (topmost-intro . 0) ; Guessed value
                                  (topmost-intro-cont . 0) ; Guessed value
                                  (access-label . -)
                                  (annotation-top-cont . 0)
                                  (annotation-var-cont . +)
                                  (arglist-close . c-lineup-close-paren)
                                  (arglist-cont c-lineup-gcc-asm-reg 0)
                                  (arglist-cont-nonempty . +)
                                  (block-open . 0)
                                  (brace-entry-open . 0)
                                  (brace-list-open . 0)
                                  (c . c-lineup-C-comments)
                                  (case-label . 0)
                                  (catch-clause . 0)
                                  (class-open . 0)
                                  (comment-intro . c-lineup-comment)
                                  (composition-close . 0)
                                  (composition-open . 0)
                                  (cpp-define-intro c-lineup-cpp-define +)
                                  (cpp-macro . -1000)
                                  (cpp-macro-cont . +)
                                  (defun-open . 0)
                                  (do-while-closure . 0)
                                  (else-clause . 0)
                                  (extern-lang-close . 0)
                                  (extern-lang-open . 0)
                                  (friend . 0)
                                  (func-decl-cont . +)
                                  (incomposition . +)
                                  (inexpr-class . +)
                                  (inexpr-statement . +)
                                  (inextern-lang . +)
                                  (inher-cont . c-lineup-multi-inher)
                                  (inher-intro . +)
                                  (inlambda . c-lineup-inexpr-block)
                                  (inline-close . 0)
                                  (inline-open . 0)
                                  (inmodule . +)
                                  (knr-argdecl . 0)
                                  (knr-argdecl-intro . +)
                                  (lambda-intro-cont . +)
                                  (module-close . 0)
                                  (module-open . 0)
                                  (namespace-open . 0)
                                  (objc-method-args-cont . c-lineup-ObjC-method-args)
                                  (objc-method-call-cont c-lineup-ObjC-method-call-colons
                                                         c-lineup-ObjC-method-call +)
                                  (objc-method-intro . [0])
                                  (statement-case-intro . +)
                                  (statement-case-open . 0)
                                  (stream-op . c-lineup-streamop)
                                  (string . -1000)
                                  (substatement-label . 2)
                                  (template-args-cont c-lineup-template-args
                                                      +))))
  (setq c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          (other . "brion_code_style")))
  ;; flycheck
  (with-eval-after-load 'flycheck
    (flycheck-define-checker brion_cpplint
      "cpplint check for brion code style"
      :command ("python" "/n/filer3b/home/dev/jshi/code_work/code_git/branch10/BCTools/cpplint/cpplint.py"
                source-original):error-patterns
                ((warning line-start
                          (file-name)
                          "\("
                          line
                          "\):"
                          (message)
                          line-end))
                :modes (c-mode c++-mode))
    (add-to-list 'flycheck-checkers 'brion_cpplint
                 'append))
  (with-eval-after-load 'flycheck-ycmd
    (flycheck-add-next-checker 'ycmd
                               '(error . brion_cpplint)))
  ;; yasnippet
  ;; (eval-after-load 'company
  ;;   '(add-to-list
  ;;     'company-backends '(company-rtags company-yasnippet)))
  ;; (eval-after-load 'yasnippet
  ;;   '(progn
  ;;      (define-key yas-keymap (kbd "C-/") 'yas-next-field-or-maybe-expand)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-ask-about-save nil)
 '(compilation-save-buffers-predicate (quote ignore))
 '(evil-symbol-word-search t)
 '(evil-want-fine-undo nil)
 '(ggtags-auto-jump-to-match nil)
 '(ggtags-find-tag-hook nil)
 '(ggtags-sort-by-nearness t)
 '(ggtags-update-on-save nil)
 '(ibuffer-expert t)
 '(org-hide-emphasis-markers t)
 '(package-selected-packages
   (quote
    (zonokai-theme zenburn-theme zen-and-art-theme yapfify xterm-color ws-butler window-numbering which-key wgrep-helm wgrep-ag web-mode web-beautify volatile-highlights uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit swift-mode sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance stekene-theme srefactor sql-indent spacemacs-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rtags rspec-mode robe reverse-theme restart-emacs rbenv ranger rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme projectile-rails professional-theme popwin planet-theme pip-requirements phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme paradox orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags gandalf-theme flyspell-correct-helm flycheck-ycmd flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump drupal-mode dracula-theme django-theme disaster diff-hl deft define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-ycmd company-web company-tern company-statistics company-go company-emacs-eclim company-c-headers company-auctex company-anaconda command-log-mode column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmake-mode clues-theme clean-aindent-mode clang-format chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent ag afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(projectile-other-file-alist
   (quote
    (("cpp" "h" "hpp" "ipp")
     ("ipp" "h" "hpp" "cpp")
     ("hpp" "h" "ipp" "cpp" "cc")
     ("cxx" "h" "hxx" "ixx")
     ("ixx" "h" "hxx" "cxx")
     ("hxx" "h" "ixx" "cxx")
     ("c" "h")
     ("m" "h")
     ("mm" "h")
     ("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm")
     ("cc" "h" "hh" "hpp")
     ("hh" "cc")
     ("vert" "frag")
     ("frag" "vert")
     (nil "lock" "gpg")
     ("lock" "")
     ("gpg" ""))))
 '(require-final-newline t)
 '(safe-local-variable-values
   (quote
    ((eval progn
           (when buffer-file-name
             (let
                 (root_path)
               (setq root_path
                     (locate-dominating-file buffer-file-name ".dir-locals.el"))
               (when
                   (or
                    (not
                     (boundp
                      (quote tachyon_code_root_path)))
                    (not
                     (equal root_path tachyon_code_root_path)))
                 (setq tachyon_code_root_path root_path)
                 (setq helm-make-executable "my_make")
                 (defun cpplint_current_file nil
                   (interactive)
                   (cd tachyon_code_root_path)
                   (compile
                    (concat "python BCTools/cpplint/cpplint.py "
                            (buffer-file-name))))
                 (defun cppcheck_current_file nil
                   (interactive)
                   (cd tachyon_code_root_path)
                   (compile
                    (concat "python BCTools/reviewboard/cppcheck.py -f "
                            (buffer-file-name))))
                 (defun switch_to_compile_static nil "switch to compile command to build static verion"
                        (interactive)
                        (setq compile-command "my_make -C build_root")
                        (setq-default helm-make-build-dir "build_root"))
                 (switch_to_compile_static)
                 (defun switch_to_compile_dynamic nil "switch to compile command to build dynamic verion"
                        (interactive)
                        (setq compile-command "my_make -C dll_debug_build_root")
                        (setq-default helm-make-build-dir "dll_debug_build_root")))))))))
 '(solarized-use-variable-pitch nil)
 '(wdired-allow-to-change-permissions t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(org-level-1 ((t (:inherit default :foreground "#cb4b16" :weight bold :height 1.3))))
 '(org-level-2 ((t (:inherit default :foreground "#859900" :weight bold :height 1.2))))
 '(org-level-3 ((t (:inherit default :foreground "#268bd2" :weight bold :height 1.15))))
 '(org-level-4 ((t (:inherit default :foreground "#b58900" :weight bold :height 1.1))))
 '(org-level-5 ((t (:inherit default :foreground "#2aa198" :weight bold))))
 '(org-level-6 ((t (:inherit default :foreground "#859900" :weight bold))))
 '(powerline-active2 ((t (:background "#eee8d5" :foreground "#839496" :box nil))))
 '(powerline-inactive2 ((t (:background "#fdf6e3" :foreground "#93a1a1" :box nil))))
 '(show-paren-match ((t (:background "#B5923E" :foreground "#d33682" :weight bold))))
 '(sp-show-pair-match-face ((t (:background "#B5923E" :foreground "#d33682" :weight bold)))))
