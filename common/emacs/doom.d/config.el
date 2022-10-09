;;; doom-config --- Config settings for doom emacs
;;; Commentary:

(setq
    user-full-name "navilan"
    user-mail-address "navilan@folds.in"
)


(setq doom-font (font-spec :family "PragmataPro Mono Liga" :size 24)
      doom-theme 'doom-one
      doom-big-font (font-spec :family "PragmataPro Mono Liga" :size 28)
      doom-variable-pitch-font (font-spec :family "PragmataPro Mono Liga" :size 20)
      doom-unicode-font (font-spec :family "PragmataPro Mono Liga")
      doom-serif-font (font-spec :family "PragmataPro Mono Liga" :size 20 :weight 'bold)
)

(when (window-system)
  ;; SF Mono: https://medium.com/@deepak.gulati/using-sf-mono-in-emacs-6712c45b2a6d
  ;; SF Pro:  https://developer.apple.com/
  (when (member "SF Mono" (font-family-list))
    (set-face-attribute 'default nil :family "SF Mono" :height 180))
  (when (member "SF Pro" (font-family-list))
    (set-face-attribute 'variable-pitch nil :family "SF Pro" :height 180)))


(setq confirm-kill-emacs nil

 )

(after! doom-modeline
      doom-modeline-enable-word-count t
      doom-modeline-continuous-word-count-modes '(mardown-mode gfm-mode org-mode text-mode)
  )



(after! org
        (org-babel-do-load-languages 'org-babel-load-languages
                                '((jq . t)))
  )

(add-to-list 'default-frame-alist '(undecorated . t))



(provide 'config)
;;; config.el ends here
