;; -*- Emacs-Lisp -*-

;; Time-stamp: <2015-06-02 15:34:10 Tuesday by ahei>

(defun woman-settings ()
  "Settings for `woman-mode'."
  (setq woman-use-own-frame nil)
  (setq woman-fill-column 100)

  (defun woman-mode-hook-settings ()
    "Settings for `woman-mode'."
    (setq truncate-lines nil))

  (am-add-hooks 'woman-mode-hook 'woman-mode-hook-settings)
  ;; 只增加英文的man路径
  (setq woman-manpath
        (or (woman-parse-colon-path (getenv "MANPATH"))
            '("/usr/man" "/usr/share/man" "/usr/local/man"))))

(eal-define-keys
 'woman-mode-map
 `(("t"     sb-toggle-keep-buffer)
   ("M-n"   nil)
   ("w"     scroll-down)
   ("v"     set-mark-command)))

(eval-after-load "woman"
  '(woman-settings))

(provide 'woman-settings)
