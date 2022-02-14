module main.

% Basic definition.

kind t_ty type.

type int t_ty. /* 32-bit signed integer. */
type long t_ty. /* 64-bit signed integer. */
type float t_ty. /* 32-bit floating point. */
type string t_ty. /* UTF-8 string. */

type pointer t_ty -> t_ty.  /* pointer type. (*T) */

type const t_ty -> t_ty.  /* const type. (const T) */

type function t_ty -> t_ty -> t_ty.  /* function type. */

% parameter storage class as type constructor.

type ref t_ty -> t_ty.  /* ref T (T -> ref_T) */
type scope t_ty -> t_ty.  /* scope T */

% Struct.

kind t_struct type.
kind t_ident type.

type ident string -> t_ident.
type struct t_ident -> (list t_ty) -> t_ty.

% built-in traits.

type isSame t_ty -> t_ty -> o.

isSame int int.
isSame long long.
isSame string string.
isSame (pointer T) (pointer T).
isSame (const T) (const T).
isSame (function ArgTy RetTy) (function ArgTy RetTy).

% ?- isSame (struct (ident "A") [int, int]) (struct (ident "A") [int, int]).
isSame (struct Ident Field) (struct Ident Field).

type isIntegral t_ty -> o.
isIntegral int.
isIntegral long.

type isFloating t_ty -> o.
isFloating float.

type isArithmetic t_ty -> o.
isArithmetic T :- isIntegral T.
isArithmetic T :- isFloating T.
