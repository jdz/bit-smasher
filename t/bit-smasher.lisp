;;;; file: t/bit-smasher.lisp

(in-package :cl-user)

(defpackage bit-smasher-test
  (:use cl bit-smasher prove))

(in-package :bit-smasher-test)

;; NOTE: To run this test file, execute `(asdf:test-system :bit-smasher)' in your Lisp.

(plan 4)

(deftest sanity-check
  (pass "PROVE is loaded and ready to go.")
  (ok (= 1 1)
      "Numeric equality: (= 1 1) => T.")
  (is (+ 1 1)
      2
      "Addition: (+ 1 1) => 2.")
  (is (* 2 2)
      4
      "Multiplication: (* 2 2) => 4."))

;; Bit-Vector Arithmetic Test

(deftest arithmetic
  (is (bit+ #*0010 #*1000)
      #*00001010
      :test #'equal
      "Sum of two bit-vectors.")
  (is (bit- #*1000 #*0010)
      #*00000110
      :test #'equal
      "Difference of two bit-vectors.")
  (is (bit* #*1000 #*0010)
      #*00010000
      :test #'equal
      "Product of two bit-vectors.")
  (is (bit/ #*1000 #*0010)
      #*00000100
      :test #'equal
      "Quotient of two bit-vectors.")
  (is (bit-floor #*1000 #*0010)
      #*00000100
      :test #'equal
      "Floor-Division of two bit-vectors.")
  (is (bit-ceiling #*1000 #*0010)
      #*00000100
      :test #'equal
      "Ceiling-Division of two bit-vectors.")
  (is (<< #*0010 2)
      #*00001000
      :test #'equal
      "Left-shift Bit-Vector by two bits.")
  (is (>> #*1000 2)
      #*00000010
      :test #'equal
      "Right-shift Bit-Vector by two bits."))

;; Conversion test

(deftest conversion
  (is (hex<- (expt 10 64))
      "184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000"
      "Integer to Hex-String conversion.")
  (is (bits<- (expt 10 64))
      #*000110000100111100000011111010010011111111111001111101001101101010100111100101111110110101101110001110001110110101100100101111110110101000011111000000010000000000000000000000000000000000000000000000000000000000000000
      "Integer to Bit-Vector conversion.")
  (ok (equalp (octets<- (expt 10 64))
              #(24 79 3 233 63 249 244 218 167 151 237 110 56 237 100 191 106 31 1 0 0 0 0 0 0 0 0))
      "Integer to Octets conversion.")
  (is (int<- (bits<- (expt 10 64)))
      (expt 10 64)
      "Bit-Vector to Integer conversion.")
  (ok (string-equal(hex<- (bits<- (expt 10 64)))
                   (hex<- (expt 10 64)))
      "Bit-Vector to Hex-String conversion.")
  (ok (equalp (octets<- (bits<- (expt 10 64)))
              (octets<- (expt 10 64)))
      "Bit-Vector to Octets conversion."))

;; Two's Complement Test

(deftest twos-complement
  (ok (twos-complement-p 0)
      "0 is Two's Complement.")
  (ok (not (twos-complement-p 1))
      "1 is not Two's Complement.")
  (ok (twos-complement-p 2)
      "2 is Two's Complement."))

(run-test-all)

;; EOF
