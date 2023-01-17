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
