# exact-covers
creating exact cover matrices for polyomino problems, as described by Knuth
in his article "Dancing Links".


a rectangular region is just two numbers, (n m), n is x width, m is y width

a polyomino is a list such as (2 3 (0 1) (1 1) (0 1))

we get all possible configurations with paddding.

the result will be a list of lines. e.g., for a region of (4 5) and
the polyomino above, we start with
((0 1 0 0  1 1 0 0  0 1 0 0  0 0 0 0)
 (0 0 1 0  0 1 1 0  0 0 1 0  0 0 0 0)
 (0 0 0 1  0 0 1 1  0 0 0 1  0 0 0 0)
 (0 0 0 0  0 1 0 0  1 1 0 0  0 1 0 0) etc. ) the spaces in the list is
just for readability of course (and I am not sure they will show up
in markdown).

I'll try to use this as an oppurtunity to use classes in Common Lisp.
