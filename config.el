(setq doom-font (font-spec :family "0xProto Nerd Font" :size 15))
(setq doom-theme 'doom-nord)

(add-to-list 'default-frame-alist '(alpha-background . 100))

(setq org-directory "~/Sync/org")
(setq org-agenda-files '("~/Sync/org/agenda.org"))

(defun org-agenda-open-hook ()
  (olivetti-mode))

(add-hook 'org-agenda-mode-hook 'org-agenda-open-hook)

(setq org-agenda-span 1
      org-agenda-start-day "+0d"
      org-agenda-skip-timestamp-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-done t
      org-agenda-skip-scheduled-if-deadline-is-shown t
      org-agenda-skip-timestamp-if-deadline-is-shown t)

(setq org-agenda-current-time-string "")
(setq org-agenda-time-grid '((daily) () "" ""))
(setq org-agenda-hide-tags-regexp ".*")

(require 'elfeed-goodies)
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)

;; Auto update feeds
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

(use-package! elcord
  :ensure t)

(use-package! emms
  :config
   (emms-all)
   (setq emms-player-list '(emms-player-mpd))
   (setq emms-seek-seconds 5)
   (setq emms-info-functions '(emms-info-mpd))
   (setq emms-source-file-default-directory "~/Music")
   (setq emms-player-mpd-server-name "0.0.0.0")
   (setq emms-player-mpd-server-port "6600")
   (setq emms-player-mpd-music-directory "~/Music")
   :bind
    ("<XF86AudioPrev>" . emms-previous)
    ("<XF86AudioNext>" . emms-next)
    ("<XF86AudioPlay>" . emms-pause)
    ("<XF86AudioStop>" . emms-stop))

(setq mpc-host "0.0.0.0:6600")

(defun mpd/update-database ()
  "Updates the MPD database synchronously."
  (interactive)
  (call-process "mpc" nil nil nil "update")
  (message "MPD Database Updated!"))
;;(global-set-key (kbd "s-m u") 'mpd/update-database)

(setq org-roam-directory "~/Sync/org/roam")

(use-package! websocket)

(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(with-eval-after-load 'org (global-org-modern-mode))
