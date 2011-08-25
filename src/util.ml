open Bigarray

(* construct an empty bigarray of identical size/kind/layout *)
let clone_bigarray arr =
  Array3.create
    (Array3.kind arr)
    (Array3.layout arr)
    (Array3.dim1 arr)
    (Array3.dim2 arr)
    (Array3.dim3 arr)

(* clone and copy the contents of a bigarray *)
let copy_bigarray arr =
  let cp = clone_bigarray arr in
    Array3.blit arr cp;
    cp


(* A range operator *)
let (--) i j = 
  let rec aux n acc =
    if n < i then acc else aux (n-1) (n :: acc)
  in aux (j-1) []


exception Wtf of string
