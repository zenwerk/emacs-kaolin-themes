;;; kaolin-themes-treemacs.el --- treemacs customization for Kaolin themes -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(unless (require 'all-the-icons nil t)
  (error "Kaolin treemacs theme requires the all-the-icons package."))

(defgroup kaolin-treemacs nil
  "Settings for Kaolin's treemacs theme."
  :group 'kaolin-themes)

(defcustom kaolin-themes-treemacs-hl-line t
  "Remap hl-line face for treemacs, uses distinct foreground and default background."
  :type 'boolean
  :group 'kaolin-treemacs)

(defcustom kaolin-themes-treemacs-icons t
  "Use predefined icons for Kaolin themes from the all-the-icons package."
  :type 'boolean
  :group 'kaolin-treemacs)

(defcustom kaolin-themes-treemacs-line-spacing 1
  "Line-spacing for treemacs buffer."
  :type 'number
  :group 'kaolin-treemacs)

(defun kaolin-treemacs--remove-fringes ()
  "Remove fringes in treemacs window."
  (when (display-graphic-p)
    (setq left-fringe-width 0)
    (setq right-fringe-width 0)))

(defun kaolin-treemacs--remove-modeline ()
  "Disable mode-line in treemacs buffer "
  (setq mode-line-format nil))

;; TODO: remap hl-line after load-theme
(defun kaolin-treemacs--remap-hl-line ()
  "Remap hl-line face."
  (face-remap-add-relative 'hl-line `(:background ,(face-background 'default) :foreground ,(face-foreground 'lazy-highlight))))

(defun kaolin-treemacs--hook ()
  (setq line-spacing kaolin-themes-treemacs-line-spacing
        tab-width 1))

(with-eval-after-load 'treemacs
  (add-hook 'treemacs-mode-hook #'kaolin-treemacs--hook)
  (add-hook 'treemacs-mode-hook #'kaolin-treemacs--remove-fringes)
  (advice-add 'treemacs-select-window :after #'kaolin-treemacs--remove-fringes)
  (add-hook 'treemacs-mode-hook #'kaolin-treemacs--remove-modeline)

  (when kaolin-themes-treemacs-hl-line
    (add-hook 'treemacs-mode-hook #'kaolin-treemacs--remap-hl-line))

  (setq treemacs-indentation 1
        treemacs-indentation-string "  ")


  (when kaolin-themes-treemacs-icons
    (setq treemacs-icons-hash (make-hash-table :size 200 :test #'equal)
          treemacs-icon-fallback (format "%s " (all-the-icons-faicon "file-text-o"))
          treemacs-icon-text treemacs-icon-fallback)

    (setq treemacs-icon-root-png
          (format " %s " (all-the-icons-octicon "repo" :v-adjust -0.2 :height 1.4
                                                 :face 'font-lock-variable-name-face))

          treemacs-icon-open-png
          (format "%s " (all-the-icons-material "folder_open" :v-adjust -0.2 :height 1 'font-lock-doc-face))

          treemacs-icon-closed-png
          (format "%s " (all-the-icons-material "folder" :v-adjust -0.2 :height 1))

          treemacs-icon-tag-open-png
          (all-the-icons-faicon "chevron-down" :v-adjust 0.1)

          treemacs-icon-tag-closed-png
          (all-the-icons-faicon "location-arrow" :v-adjust 0.1)

          treemacs-icon-tag-node-open-png
          (format "%s " (all-the-icons-faicon "chevron-down"  :height 0.75 :face 'font-lock-keyword-face))

          treemacs-icon-tag-node-closed-png
          (format "%s " (all-the-icons-faicon "location-arrow" :height 0.9  :face 'font-lock-keyword-face))

          treemacs-icon-tag-leaf-png
          (format "%s " (all-the-icons-faicon "tag" :height 0.9 :face 'font-lock-type-face))
          )

    ;; Icons for filetypes with Color
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".cs") "cs")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".css") "css")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".git") "gitignore")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".html") "html" "htm")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".java") "java")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".js") "js")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".ts") "ts")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".py") "py")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".rs") "rs")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".hs") "hs")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".c") "c")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".cpp") "cpp" "C" "cc")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".rb") "rb")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".scala") "scala")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".ex") "ex")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".exs") "exs")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".erl") "hrl")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".hrl") "hrl")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".clj") "clj")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".cljs") "cljs")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".el") "el" "elc")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".org") "org")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".jl") "jl")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".ml") "ml")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".mli") "mli")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".cl") "lisp")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".php") "php")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".md") "md" "markdown")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".sh") "sh")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".zsh") "zsh")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".jsx") "jsx")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file ".vue") "vue")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file "Makefile") "Makefile")
    (treemacs-define-custom-icon (all-the-icons-icon-for-file "Dockerfile") "Dockerfile")
    ;; Icons with no color
    (treemacs-define-custom-icon (all-the-icons-fileicon "go") "go")
    (treemacs-define-custom-icon (all-the-icons-fileicon "cabal") "cabal")
    (treemacs-define-custom-icon (all-the-icons-fileicon "kotlin") "kt" "kts")
    (treemacs-define-custom-icon (all-the-icons-fileicon "hy") "hy")
    (treemacs-define-custom-icon (all-the-icons-fileicon "typescript") "ts")
    (treemacs-define-custom-icon (all-the-icons-fileicon "nimrod") "nim" "nims")
    (treemacs-define-custom-icon (all-the-icons-fileicon "perl6") "pm6")
    (treemacs-define-custom-icon (all-the-icons-fileicon "tex") "tex")
    (treemacs-define-custom-icon (all-the-icons-fileicon "rst") "rst")
    (treemacs-define-custom-icon (all-the-icons-octicon "file-pdf") "pdf")
    (treemacs-define-custom-icon (all-the-icons-octicon "database") "sql")
    (treemacs-define-custom-icon (all-the-icons-material "style") "styles")


    (treemacs-define-custom-icon (all-the-icons-octicon "file-media")
                                 "jpg" "jpeg" "png" "gif" "ico" "tif" "tiff" "svg" "bmp"
                                 "psd" "ai" "eps" "indd" "mov" "avi" "mp4" "webm" "mkv"
                                 "wav" "mp3" "ogg" "midi")

    (treemacs-define-custom-icon (all-the-icons-faicon "file-text-o")
                                 "rst" "log" "txt" "CONTRIBUTE" "LICENSE" "README" "CHANGELOG")

    (treemacs-define-custom-icon (all-the-icons-faicon "cogs")
                                 "conf" "cfg" "yaml" "yml" "json" "xml" "toml" "cson" "ini")

    (treemacs-define-custom-icon (all-the-icons-octicon "code")
                                 "tpl" "erb" "mustache" "twig" "ejs" "mk" "haml" "pug" "jade")

    (treemacs-define-custom-icon (all-the-icons-octicon "file-zip")
                                 "zip" "xz" "tar" "7z" "rar")
  ))


(provide 'kaolin-themes-treemacs)
;;; kaolin-themes-treemacs.el ends here
