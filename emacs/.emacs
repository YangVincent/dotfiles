
; stop showing the menu/tool/scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ido has useful autocomplete 
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Change the load path to this + all the defaults (viewable with C-h v load-path RET)
;; (add-to-list 'load-path "~/.emacs.d/lisp")

;; (require 'evil)
;; (evil-mode 1)
;; broken in emacs24?? (add-to-list 'package-archives '("melpa", "https://melpa.org/packages/") t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)


;; Re-enable tabbing: https://stackoverflow.com/questions/22878668/emacs-org-mode-evil-mode-tab-key-not-working
;; (setq evil-want-C-i-jump nil)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; Show everything at start
(setq org-startup-folded nil)
;; Use system paste
(fset 'evil-visual-update-x-selection 'ignore)


(require 'evil)
(evil-mode 1)
(evil-define-key 'normal org-mode-map
  (kbd "TAB") 'org-cycle
  ">" 'org-shiftmetaright
  "<" 'org-shiftmetaleft)



;; Turn on key-chord to map chords
(require 'key-chord)
(key-chord-mode 1)

;; Use key-chord to bind jk to escape in evil
(key-chord-define evil-normal-state-map "jk" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)

;; (setq evil-emacs-state-cursor '("red" box))
;; (setq evil-normal-state-cursor '("green" box))
;; (setq evil-visual-state-cursor '("orange" box))
;; (setq evil-insert-state-cursor '("red" bar))
;; (setq evil-replace-state-cursor '("red" bar))
;; (setq evil-operator-state-cursor '("red" hollow))

;; Xclip works only with XMing Server on. Windows subsystem doesn't have X11 support by default.
;; bash $Display is :0
;; This allows us to use xclip to copy/paste.
(xclip-mode 1)

;; Settings for org-evil
(require 'org-evil)
;; Change O and o for org-evil so they function correctly in lists
(evil-define-minor-mode-key 'normal 'org-evil-list-mode
  "<" 'org-evil-list-outdent-item-tree
  ">" 'org-evil-list-indent-item-tree
  "O" 'org-evil-list-open-item-above
  "o" 'org-evil-list-open-item-below)
;; Change o and O for org-evil so they function correctly in headings
(evil-define-minor-mode-key 'normal 'org-evil-heading-mode
  "<" 'org-evil-promote
  ">" 'org-evil-demote
  "O" 'org-evil-heading-open-sibling-above
  "o" 'org-evil-heading-open-sibling-below)


;; Linum-relative (relative line numbering!)
;; show line numbers
(global-linum-mode 1)
(require 'linum-relative)
;; (linum-on)
(linum-relative-on)
(setq linum-format "%d ")

;; ;; Better org-mode return: http://kitchingroup.cheme.cmu.edu/blog/2017/04/09/A-better-return-in-org-mode/
;; (require 'org-inlinetask)
;; 
;; (defun scimax/org-return (&optional ignore)
;;   "Add new list item, heading or table row with RET.
;; A double return on an empty element deletes it.
;; Use a prefix arg to get regular RET. "
;;   (interactive "P")
;;   (if ignore
;;       (org-return)
;;     (cond
;; 
;;      ((eq 'line-break (car (org-element-context)))
;;       (org-return-indent))
;; 
;;      ;; Open links like usual, unless point is at the end of a line.
;;      ;; and if at beginning of line, just press enter.
;;      ((or (and (eq 'link (car (org-element-context))) (not (eolp)))
;;           (bolp))
;;       (org-return))
;; 
;;      ;; It doesn't make sense to add headings in inline tasks. Thanks Anders
;;      ;; Johansson!
;;      ((org-inlinetask-in-task-p)
;;       (org-return))
;; 
;;      ;; checkboxes too
;;      ((org-at-item-checkbox-p)
;;       (org-insert-todo-heading nil))
;; 
;;      ;; lists end with two blank lines, so we need to make sure we are also not
;;      ;; at the beginning of a line to avoid a loop where a new entry gets
;;      ;; created with only one blank line.
;;      ((org-in-item-p)
;;       (if (save-excursion (beginning-of-line) (org-element-property :contents-begin (org-element-context)))
;;           (org-insert-heading)
;;         (beginning-of-line)
;;         (delete-region (line-beginning-position) (line-end-position))
;;         (org-return)))
;; 
;;      ;; org-heading
;;      ((org-at-heading-p)
;;       (if (not (string= "" (org-element-property :title (org-element-context))))
;;           (progn (org-end-of-meta-data)
;;                  (org-insert-heading-respect-content)
;;                  (outline-show-entry))
;;         (beginning-of-line)
;;         (setf (buffer-substring
;;                (line-beginning-position) (line-end-position)) "")))
;; 
;;      ;; tables
;;      ((org-at-table-p)
;;       (if (-any?
;;            (lambda (x) (not (string= "" x)))
;;            (nth
;;             (- (org-table-current-dline) 1)
;;             (org-table-to-lisp)))
;;           (org-return)
;;         ;; empty row
;;         (beginning-of-line)
;;         (setf (buffer-substring
;;                (line-beginning-position) (line-end-position)) "")
;;         (org-return)))
;; 
;;      ;; fall-through case
;;      (t
;;       (org-return)))))
;; 
;; 
;; (define-key org-mode-map (kbd "RET")
;;   'scimax/org-return)

