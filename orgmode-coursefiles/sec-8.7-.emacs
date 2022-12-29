
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier 10 Pitch" :foundry "bitstream" :slant normal :weight normal :height 143 :width normal)))))

(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "<f6>") 'org-capture)

(require 'org-install)
(require 'org-capture)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(delete-selection-mode nil)
 '(diary-list-entries-hook
   (quote
    (diary-include-other-diary-files diary-sort-entries)))
  '(org-agenda-custom-commands
   (quote
    (
     ("A" . "Agendas")
     ("AT" "Daily overview"
      ((tags-todo "URGENT"
		  ((org-agenda-overriding-header "Urgent Tasks")))
       (tags-todo "RADAR"
		  ((org-agenda-overriding-header "On my radar")))
       (tags-todo "PHONE+TODO=\"NEXT\""
		  ((org-agenda-overriding-header "Phone Calls")))
       (tags-todo "Depth=\"Deep\"/NEXT"
                  ((org-agenda-overriding-header "Next Actions requiring deep work")))
       (agenda ""
	       ((org-agenda-overriding-header "Heute")
		(org-agenda-span 1)
		(org-agenda-sorting-strategy
		 (quote
		  (time-up priority-down)))))
      nil nil))
     ("AW" "Weekly overview" agenda ""
      ((org-agenda-overriding-header "Weekly overview")))
     ("AM" "Monthly overview" agenda ""
      ((org-agenda-overriding-header "Monthly overview"))
       (org-agenda-span
	(quote month))
       (org-deadline-warning-days 0)
       (org-agenda-sorting-strategy
	(quote
	 (time-up priority-down tag-up))))
     ("W" . "Weekly Review Helper")
     ("Wn" "New tasks" tags "NEW"
      ((org-agenda-overriding-header "NEW Tasks")))
     ("Wd" "Check DELEGATED tasks" todo "DELEGATED"
      ((org-agenda-overriding-header "DELEGATED tasks")))
     ("Ww" "Check WAITING tasks" todo "WAITING"
      ((org-agenda-overriding-header "WAITING tasks")))
     ("Ws" "Check SOMEDAY tasks" todo "SOMEDAY"
      ((org-agenda-overriding-header "SOMEDAY tasks")))
     ("Wf" "Check finished tasks" todo "DONE|CANCELLED|FORWARDED"
      ((org-agenda-overriding-header "Finished tasks")))
     ("WP" "Planing ToDos (unscheduled) only" todo "TODO|NEXT"
      ((org-agenda-overriding-header "Planungsübersicht")
       (org-agenda-skip-function
	(quote
	 (org-agenda-skip-entry-if
	  (quote scheduled)
	  (quote deadline)))))))
    ))
 '(org-agenda-files
   (quote
    ("~/org/work.org" "~/org/private.org" "~/org/mylife.org")))
 '(org-agenda-include-diary t)
 '(org-attach-use-inheritance t)
 '(org-babel-load-languages (quote ((emacs-lisp . t) (dot . t) (shell . t))))
 '(org-capture-templates 
   (quote (

     ("G" "Define a goal" entry (file+headline "~/org/capture.org" "Capture") (file "~/org/tpl-goal.txt") :empty-lines-after 2)

     ("N" "NEXT entry" entry (file+headline "~/org/capture.org" "Capture") (file "~/org/tpl-next.txt") :empty-lines-before 1) 

     ("T" "TODO entry" entry (file+headline "~/org/capture.org" "Capture") (file "~/org/tpl-todo.txt") :empty-lines-before 1)

     ("W" "WAITING entry" entry (file+headline "~/org/capture.org" "Capture") (file "~/org/tpl-waiting.txt") :empty-lines-before 1) 

     ("S" "SOMEDAY entry" entry (file+headline "~/org/capture.org" "Capture") (file "~/org/tpl-someday.txt") :empty-lines-before 1)

     ("P" "PROJ entry" entry (file+headline "~/org/capture.org" "Capture") (file "~/org/tpl-proj.txt") :empty-lines-before 1)

     
     ("B" "Book on the to-read-list" entry (file+headline "~/org/private.org" "Books to read") (file "~/org/tpl-book.txt") :empty-lines-after 2)

     
     ("p" "Create a daily plan") 

     ("pP" "Daily plan private" plain (file+olp+datetree "~/org/plan-free.org") (file "~/org/tpl-dailyplan.txt") :immediate-finish t)
     
     ("pW" "Daily plan work" plain (file+olp+datetree "~/org/plan-work.org") (file "~/org/tpl-dailyplan.txt") :immediate-finish t)

     ("j" "Journal entry")
     ("jP" "Journal entry private privat" entry (file+olp+datetree "~/org/journal-privat.org") "** %^{Heading}") 
      ("jW" "Journal entry work " entry (file+olp+datetree "~/org/journal-work.org") "** %^{Heading}") 
      
)))


 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends (quote (ascii beamer html icalendar latex odt)))
 '(org-log-into-drawer "LOGBOOK")
 '(org-log-reschedule (quote time))
 '(org-modules
   (quote
    (ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m)))
 '(org-publish-project-alist
   (quote
    (("web" :base-directory "~/web/" :publishing-directory "~/public_html" :publishing-function org-html-publish-to-html :section-numbers nil :with-toc nil))))
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(org-refile-use-outline-path (quote file))
 '(org-track-ordered-property-with-tag t)
 '(org-use-property-inheritance t))

(defun org-focus-private() "Set focus on private things."
       (interactive)
       (setq org-agenda-files '("~/org/private.org")))

(defun org-focus-work() "Set focus on work things."
       (interactive)
       (setq org-agenda-files '("~/org/work.org")))

(defun org-focus-all() "Set focus on all things."
       (interactive)
       (setq org-agenda-files '("~/org/work.org"
				"~/org/private.org")))

(defun my/copy-idlink-to-clipboard() "Copy an ID link with the
headline to killring, if no ID is there then create a new unique
ID.  This function works only in org-mode or org-agenda buffers. 

The purpose of this function is to easily construct id:-links to 
org-mode items. If its assigned to a key it saves you marking the
text and copying to the killring."
       (interactive)
       (when (eq major-mode 'org-agenda-mode) ;if we are in agenda mode we switch to orgmode
	 (org-agenda-show)
	 (org-agenda-goto))       
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
	 (setq mytmphead (nth 4 (org-heading-components)))
         (setq mytmpid (funcall 'org-id-get-create))
	 (setq mytmplink (format "[[id:%s][%s]]" mytmpid mytmphead))
	 (kill-new mytmplink)
	 (message "Copied %s to killring (clipboard)" mytmplink)
       ))

(global-set-key (kbd "<f5>") 'my/copy-idlink-to-clipboard)

(defun org-reset-checkbox-state-maybe ()
  "Reset all checkboxes in an entry if the `RESET_CHECK_BOXES' property is set"
  (interactive "*")
  (if (org-entry-get (point) "RESET_CHECK_BOXES")
      (org-reset-checkbox-state-subtree)))

(defun org-checklist ()
  (when (member org-state org-done-keywords) ;; org-state dynamically bound in org.el/org-todo
    (org-reset-checkbox-state-maybe)))

(add-hook 'org-after-todo-state-change-hook 'org-checklist)

