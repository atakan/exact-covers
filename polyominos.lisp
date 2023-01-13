;(defclass polyomino ()
;  ((width :initarg :width)
;   (height :initarg :height)
;   (shape :initform nil))
;  (:documentation "A simple polyomino class."))


;(defparameter *b* #2a((0 1)
;		      (1 1)
;		      (0 1)))

;(defparameter *c* ("01"
;		   "11"
;		   "01"))

;(defclass polyomino ()
;  ((shape :initform nil
;	  :initarg :shape))
;  (:documentation "A simple polyomino class."))

;(defun make-polyomino (shape)
;  (make-instance 'polyomino :shape shape))

;(defclass region ()
;  ((width :initarg :width)
;   (height :initarg :height)
;   (shape :initform nil)))

;(defmethod initialize-instance :after ((reg region) &key)
;  "Note that the initialization is a bit weird and arbitrary. We create
;   vectors of size :width and put :height of these together in another
;   vector."
;  (let ((w (slot-value reg 'width))
;	(h (slot-value reg 'height)))
;    (setf (slot-value reg 'shape)
;	  (loop for i from 0 to h
;		collect (loop for j from 0 to w collect 0)))))


;;; I am abondonin OO approach for now and will write this function
;;; as much as I can directly.
(defun give-all-EC-lines (polyomino reg-width reg-height)
  "A function, given a polyomino and the size of a rectangular region,
   gives all lines for all orientations (inluding flipping) and positions
   of that polymino in that region."
  (let (all-polyos (all-orientations polyo))
    (dolist (p all-polyos)
      (print-all-lines p reg-width reg-height))))

(defmacro change-and-add-to (lst op)
  "This takes a list and an operation. Applies the op to the first element
   of the list and appends that to the beginning of the list.
   Note: It actually does modify the list, it does not simply return
   the resulting list."
  `(setf ,lst (cons (,op (car ,lst)) ,lst)))

(defun all-orientations (polyo)
  "A function, given a polyomino (as a list [of lists]), returns the list of
   all (unique) orientions of that polyomino."
  (let ((polyo-list (list polyo))) ; start with the original
    (change-and-add-to polyo-list rotate-polyo) ; add rot1 to beginning
    (change-and-add-to polyo-list rotate-polyo) ; add rot2 to beginning
    (change-and-add-to polyo-list rotate-polyo) ; add rot3 to beginning
    (change-and-add-to polyo-list flip-polyo) ; add flip1-r3 to beg
    (change-and-add-to polyo-list rotate-polyo) ; add flip2-r3 to beg
    (change-and-add-to polyo-list rotate-polyo) ; add flip3-r3 to beg
    (change-and-add-to polyo-list rotate-polyo) ; add flip4-r3 to beg
    (remove-duplicates polyo-list :test 'equal)))

(defun rotate-polyo (polyo)
  "A function, given a polyomino as a list of lists, return a rotated
   polyomino. For example, given ((a b)  it returns ((b d f) 
                                  (c d)              (a c e))
                                  (e f))                             .
  At the moment, it does nothing."
  ((lambda (x) x) polyo))

(defun flip-polyo (polyo)
  "A function, given a polyomino as a list of lists, return a flipped
   polyomino. For example, given ((a b)  it returns ((b a) 
                                  (c d)              (d c)
                                  (e f))             (f e))           .
  At the moment, it does nothing."
					;  ((lambda (x) x) polyo))
  (loop for row in polyo
	collect (reverse row)))

(defparameter *polyo1* '((a b)
			 (c d)			 
			 (e f))
  
