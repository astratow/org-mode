
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
 '(org-agenda-custom-commands
   (quote
    (("A" "Agenda and all NEXT phone calls"
      ((agenda ""
	       ((org-agenda-span
		 (quote day))))
       (tags-todo "PHONE+TODO=\"NEXT\"" nil))
      nil))))
 '(org-agenda-files
   (quote
    ("~/org/work.org" "~/org/private.org" "~/org/mylife.org")))
 '(org-attach-use-inheritance t)
 '(org-capture-templates
   (quote
    (("p" "Private templates")
     ("pt" "TODO entry" entry
      (file+headline "~/org/private.org" "Capture")
      (file "~/org/tpl-todo.txt"))
     ("pj" "Journal entry" entry
      (file+olp+datetree "~/org/journal.org")
      "* %U - %^{Activity}")
     ("pb" "Add book to read" entry
      (file+headline "~/org/private.org" "Books to read")
      (file "~/org/tpl-book.txt")
      :empty-lines-after 2))))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends (quote (ascii beamer html icalendar latex odt)))
 '(org-log-into-drawer "CLOCKING")
 '(org-log-reschedule (quote time))
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




(defun my/copy-id-to-clipboard() "Copy the ID property value
to killring, if no ID is there then create a new unique ID.
This function works only in org-mode buffers.
The purpose of this function is to easily construct id:-links to
org-mode items. If its assigned to a key it saves you marking the
text and copying to the killring."
(interactive)
(when (eq major-mode 'org-mode) ; do this only in org-mode buffers
(setq mytmpid (funcall 'org-id-get-create))
(kill-new mytmpid)
(message "Copied %s to killring (clipboard)" mytmpid)
))
(global-set-key (kbd "<f5>") 'my/copy-id-to-clipboard)
