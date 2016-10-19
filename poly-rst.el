(defcustom pm-poly/rst
  ;; fixme: should probably be pm-polymode-multi
  (pm-polymode-one "rst"
                 :hostmode 'pm-host/rst
                 :innermode 'pm-inner/fundamental)
  "RST typical configuration"
  :group 'polymodes
  :type 'object)

(defcustom pm-host/rst
  (pm-bchunkmode "rst"
                 :mode 'rst-mode)
  "RST host chunkmode"
  :group 'hostmodes
  :type 'object)


(defcustom pm-poly/rst+R
  (clone pm-poly/rst "rst+R" :innermode 'pm-inner/rst+R)
  "RST + R configuration"
  :group 'polymodes
  :type 'object)

(defcustom  pm-inner/rst+R
  (pm-hbtchunkmode "rst+R"
                   :mode 'R-mode
                   :head-reg "^\\.\\.[ ]*{[rR].*}$"
                   :tail-reg "^\\.\\. \\.\\.[\w]*$")
  "RST KnitR innermode."
  :group 'innermodes
  :type 'object)

;;;###autoload (autoload 'poly-rst+r-mode "poly-R")
(define-polymode poly-rst+r-mode pm-poly/rst+R)


;;; RST
(add-to-list 'auto-mode-alist '("\\.rst" . poly-rst-mode))


;;; R related modes
(add-to-list 'auto-mode-alist '("\\.Rrst" . poly-rst+r-mode))
