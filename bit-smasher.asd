;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: BIT-SMASHER; Base: 10 -*-
;;;; bit-smasher.asd

;;;; Copyright (c) 2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :cl-user)

(defpackage bit-smasher-asd
  (:use :cl :asdf)
  (:export #:*bit-smasher-version*))

(in-package :bit-smasher-asd)

(defvar *bit-smasher-version* "1.0.0")

(defsystem #:bit-smasher
  :serial t
  :description ""
  :version #.*bit-smasher-version*
  :author "\"the Phoeron\" Colin J.E. Lupton <sysop@thephoeron.com>"
  :license "MIT"
  :depends-on (:cl-base58
               :cl-base64
               :ironclad)
  :components ((:file "packages")
               (:file "core")
               (:file "conversion")
               (:file "arithmetic")
               (:file "utils")
               (:file "bit-smasher")))
;; EOF
