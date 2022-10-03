;;; doom-config --- Config settings for doom emacs
;;; Commentary:

(setq
    user-full-name "navilan"
    user-mail-address "navilan@folds.in"
)


(setq doom-font (font-spec :family "PragmataPro Mono Liga" :size 24)
      doom-theme 'doom-tokyo-night
      doom-big-font (font-spec :family "PragmataPro Mono Liga" :size 28)
      doom-variable-pitch-font (font-spec :family "PragmataPro Mono Liga" :size 20)
      doom-unicode-font (font-spec :family "PragmataPro Mono Liga")
      doom-serif-font (font-spec :family "PragmataPro Mono Liga" :size 20 :weight 'bold)
      twittering-allow-insecure-server-cert t
      twittering-icon-mode t
      twittering-use-icon-storage t
      twittering-initial-timeline-spec-string '(":home")
)

(after! doom-modeline
      doom-modeline-enable-word-count t
      doom-modeline-continuous-word-count-modes '(mardown-mode gfm-mode org-mode text-mode)
  )


(after! org
        (org-babel-do-load-languages 'org-babel-load-languages
                                '((jq . t)))
  )


(provide 'config)
;;; config.el ends here
