


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/color-theme/")
;;;; CC-mode配置  http://cc-mode.sourceforge.net/
(require 'cc-mode)
;;(require 'color-theme)
(load-theme 'wombat)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)
(global-linum-mode t)
(show-paren-mode t)
(column-number-mode t)
(setq backup-by-copying t)
(set-default-font "Input 12")

;;;;我的C/C++语言编辑策略
(defun my-c-mode-common-hook()
  (c-set-style "K&R")
  (setq c-basic-offset 4)
  ;;(setq tab-width 4 indent-tabs-mode nil)
  (setq tab-width 4)
  (setq frame-title-format "emacs@%f")
  (setq inhibit-startup-message t)
  (standard-display-ascii ?\t "~   ")
  ;;; hungry-delete and auto-newline
  ;;(c-toggle-auto-hungry-state 1)
  ;;按键定义
  ;; (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  ;;(define-key c-mode-base-map [(f7)] 'compile)
  ;;(define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  ;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
  ;;(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  ;;(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

  ;;预处理设置
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(ecb-layout-window-sizes
   (quote
    (("left8"
      (ecb-directories-buffer-name 0.1368421052631579 . 0.24528301886792453)
      (ecb-sources-buffer-name 0.1368421052631579 . 0.22641509433962265)
      (ecb-methods-buffer-name 0.1368421052631579 . 0.2641509433962264)
      (ecb-history-buffer-name 0.1368421052631579 . 0.1320754716981132)))))
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (ecb racket-mode)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'window-setup-hook 'toggle-frame-maximized t)


(require 'ecb)
;;(require 'ecb-autoloads)

(when (require 'ecb nil 'noerror)
  (setq ecb-version-check nil)
  (setq ecb-tip-of-the-day nil)
  (setq ecb-auto-compatibility-check nil)
  (setq ecb-primary-secondary-mouse-buttons 'mouse-1--C-mouse-1))

(global-set-key (kbd "C-c e") 'ecb-goto-window-edit-last)
(global-set-key (kbd "C-c s") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c d") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c h") 'ecb-goto-window-history)
(global-set-key (kbd "C-c r") 'ecb-redraw-layout)
(global-set-key (kbd "C-.") 'cscope-find-global-definition-no-prompting)
(global-set-key (kbd "C-,") 'cscope-pop-mark)


;; copy region or whole line
(global-set-key "\M-w"
(lambda ()
  (interactive)
  (if mark-active
      (kill-ring-save (region-beginning)
      (region-end))
    (progn
     (kill-ring-save (line-beginning-position)
     (line-end-position))
     (message "copied line")))))
        
;; kill region or whole line
(global-set-key "\C-w"
(lambda ()
  (interactive)
  (if mark-active
      (kill-region (region-beginning)
   (region-end))
    (progn
     (kill-region (line-beginning-position)
  (line-end-position))
     (message "killed line")))))

(require 'package)
(add-to-list
   'package-archives 
   '("melpa" . "http://melpa.org/packages/"))
