;;; I am abondoning OO approach for now and will write this function
;;; as much as I can directly.
(defun give-all-EC-lines (polyomino reg-width reg-height)
  "A function, given a polyomino and the size of a rectangular region,
   gives all lines for all orientations (inluding flipping) and positions
   of that polymino in that region."
  (let (all-polyos (all-orientations polyo))
    (dolist (p all-polyos)
      (print-all-lines p reg-width reg-height))))

;; Begin print-all-lines and friends

(defun print-all-lines (p reg-width reg-height)
  "A function, given a polyomino and a rectangular region (as width and height),
   returns a matrix suitable for exact cover formulation.
   The actual code is not going to use this presentation (see Knuth).
   I will either modify this, or use this output as an intermediate step."
  (let ((p-width (length (car p)))
	(p-height (length p)))
    (if (or (> p-width reg-width) (> p-height reg-height)) ; FIXME strictly speaking this is not enough, perhaps the polyomino fits when rotated, will fix this later. Returning nil will suffice for now.
	(print "polyomino does not fit into region")
	(let ((n-empty-lines (- reg-width p-width)))
	  (dotimes (i (1+ n-empty-lines)
		      ;; put i empty lines before
		      ;; put lines with polyo
	  ;; put n-i empty lines after


;; End print-all-lines and friends

;; Begin all-orientations and friends
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
  I am still not sure how this works. Copied it from:
  https://stackoverflow.com/questions/3513128/transposing-lists-in-common-lisp
  This is similar to the example on p61 of PCL. Here is an explanation:
  If polyo is the example given above, the apply part is equivalent to
  (apply #'mapcar (list (a b) (c d) (e f))) which is equivalent to
  (mapcar list (a b) (c d) (e f)) which picks up the element from the
  two-element lists and puts them together as lists.
  This is a bit read-only for me, but it works very well and I have
  the feeling that this is the Lisp way to do this, so I'll keep it."
  (reverse (apply #'mapcar #'list polyo)))

(defun flip-polyo (polyo)
  "A function, given a polyomino as a list of lists, return a flipped
   polyomino. For example, given ((a b)  it returns ((b a) 
                                  (c d)              (d c)
                                  (e f))             (f e))           ."
  (loop for row in polyo
	collect (reverse row)))

(defun do-nothing (polyo)
  ((lambda (x) x) polyo))

(defparameter *polyo1* '((a b)
			 (c d)			 
			 (e f)))

(defparameter *tet-polyo1* '((0 1)
			     (1 1)			 
			     (0 1)))

;; End all-orientations and friends

  
  
