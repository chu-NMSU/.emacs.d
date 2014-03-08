;;load path
(setq load-path(cons "~/.emacs.d" load-path))

;;emacs speaks R
(add-to-list 'load-path "~/.emacs.d/ess-12.09-2/lisp")
;;emacs jdee
(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp")
;; emacs cedet
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu


(set-default-font "DejaVu Sans Mono-18")

(setq inhibit-startup-message 1)

(setq scroll-margin 3 scroll-conservatively 10000)
(setq default-fill-column 80)

(setq visual-line-mode 1)

(transient-mark-mode t)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(display-time)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;;支持外部数据粘贴
(setq x-select-enable-clipboard t)
;;可以复制外界文字进来
(set-clipboard-coding-system 'ctext)
;;不生成临时文件
(setq-default make-backup-files nil)
;高亮显示成对括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;只渲染当前屏幕语法高亮，加快显示速度
(setq font-lock-maximum-decoration t)
;;non blinking cursor
(blink-cursor-mode 0)
;; disable menubar
;;(menu-bar-mode -1)
;; disable toolbar
;;(tool-bar-mode -1)
;;(ns-toggle-toolbar)

;;hide scroll bar
(if window-system
    (scroll-bar-mode -1)
  (menu-bar-mode -1)
  )
(if window-system
    (tool-bar-mode -1)
    )

;;主题插件
;; (require 'color-theme)			
;; (color-theme-initialize)
;;(color-theme-matrix)
;; tron theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (if window-system
;;     (load-theme 'tron t))
;;(load-theme 'tron t)

;; linum mode always on
;;(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;;拼写检查
(setq-default ispell-program-name "/usr/bin/aspell")

;;org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;latex 配置
(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list ;;'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))
;; auctex configure
;;LaTex commond create pdf directly.
;;(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;; (load "auctex-autoloads.el" nil t t)
;; (load "preview.el" nil t t)

;;change $ key binding in latex mode, so press $ will insert a pair of $.
(electric-pair-mode)
(add-hook 'LaTeX-mode-hook
          '(lambda ()
	     (define-key LaTeX-mode-map (kbd "$") 'self-insert-command)))


;; remember last time editing position
(setq save-place-file "~/.emacs.d/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)                          ;; get the package

;; Add the texlive bin path to Environment Variable PATH within Emacs.
;; Environment variables within Emacs may be different from real Max OS.
;; (setenv "PATH"
;;   (concat
;;    "/usr/bin/:/usr/local/bin:/usr/local/texlive/2012/bin/universal-darwin:/opt/local/bin" 
;;    (getenv "PATH")
;;   )
;; )

;; (setq exec-path
;;       (append exec-path
;; 	      '("/usr/bin" "/usr/local/bin" "/usr/local/texlive/2012/bin/universal-darwin" "/opt/local/bin")))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; ESS
(load "~/.emacs.d/ess-12.09-2/lisp/ess-site.el")

;;; Commentary:
;; Use this mode for editing files in the dot-language (www.graphviz.org and
;; http://www.research.att.com/sw/tools/graphviz/).
;;
;; To use graphviz-dot-mode, add 
(load-file "~/.emacs.d/graphviz-dot-mode.el")
;; to your .emacs or ~/.xemacs/init.el
;;
;; The graphviz-dot-mode will do font locking, indentation, preview of graphs
;; and eases compilation/error location. There is support for both GNU Emacs
;; and XEmacs.
;;
;; Font locking is automatic, indentation uses the same commands as
;; other modes, tab, M-j and C-M-q. Insertion of comments uses the
;; same commands as other modes, M-; . You can compile a file using
;; M-x compile or C-c c, after that M-x next-error will also work.
;; There is support for viewing an generated image with C-c p.

;; jdee
(load "jde")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("86e74c4c42677b593d1fab0a548606e7ef740433529b40232774fbb6bc22c048" "96d22c5b839a7088ca1c982b7517c7ecf8018a184be594b0f4fdc4e7dd8faae7" default)))
 '(jde-enable-abbrev-mode t)
 '(jde-javadoc-gen-destination-directory "doc")
 '(python-indent-offset 4)
 '(safe-local-variable-values (quote ((whitespace-style face tabs spaces trailing lines space-before-tab::space newline indentation::space empty space-after-tab::space space-mark tab-mark newline-mark)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (if window-system
;;       (set-frame-size (selected-frame) 100 43))

;; (set-frame-position (selected-frame) 770 0)

;;背景透明
(setq alpha-list '((90 0) (70 0)))  ;;当前窗口和非当前窗口时透明度分别为90 80
(defun loop-alpha ()
    (interactive)
    (let ((h (car alpha-list)))
        ((lambda (a ab)
             (set-frame-parameter (selected-frame) 'alpha (list a ab))
             (add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
         (car h) (car (cdr h)))
        (setq alpha-list (cdr (append alpha-list (list h))))))
(global-set-key [f12] 'loop-alpha)  ;;全局绑定F12键为Emacs半透明功能键

(setq ring-bell-function 'ignore)

;; maxframe function
;; https://github.com/rmm5t/maxframe.el
;; to maximize a frame, M-x maximize-frame
;; (require 'maxframe)
;;(add-hook 'window-setup-hook 'maximize-frame t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; server mode
(server-start)

(defun server-shutdown()
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )
