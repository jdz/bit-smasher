;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: BIT-SMASHER; Base: 10 -*-
;;;; utils.lisp

;;;; Copyright (c) 2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :bit-smasher)

(defun wide-bit-length (n)
  "Return the maximum number of bits required to represent an integer, bit-vector, octet-vector, or hex-string value N."
  (cond ((typep n 'integer)
         (length (int->bits n)))
        ((typep n 'bit-vector)
         (length (int->bits (bits->int n))))
        ((or (typep n '(vector (unsigned-byte 8)))
             (typep n '(simple-array (unsigned-byte 8) (*))))
         (length (octets->bits n)))
        ((typep n 'string)
         (length (hex->bits n)))
        (t (error "Type of value N not recognized."))))

(defun min-bit-length (n)
  "Return the minimum number of bits required to represent an integer, bit-vector, octet-vector, or hex-string value N."
  (cond ((typep n 'integer)
         (integer-length n))
        ((typep n 'bit-vector)
         (integer-length (bits->int n)))
        ((or (typep n '(vector (unsigned-byte 8)))
             (typep n '(simple-array (unsigned-byte 8) (*))))
         (integer-length (octets->int n)))
        ((typep n 'string)
         (integer-length (hex->int n)))
        (t (error "Type of value N not recognized."))))

(defun twos-complement-p (n)
  "Test an integer, bit-vector, hex-string to see if it obeys the two's complement rule."
  (= (mod (min-bit-length n) 2) 0))

;; EOF