module main.

% Basic definition.

kind t_ty type.
type int t_ty. /* 32-bit signed integer. */
type long t_ty. /* 64-bit signed integer. */
type string t_ty. /* UTF-8 string. */

type pointer t_ty -> t_ty.  /* pointer type. (*T) */

type function t_ty -> t_ty -> t_ty.  /* function type. */

% parameter storage class as type constructor.

type ref t_ty -> t_ty.  /* ref T (T -> ref_T) */
type scope t_ty -> t_ty.  /* scope T */

% built-in traits.

type isSame t_ty -> t_ty -> o.
isSame int int.
isSame long long.
isSame string string.
isSame (pointer T1) (pointer T2) :- isSame T1 T2.
isSame (function ArgTy1 RetTy1) (function ArgTy2 RetTy2) :-
       isSame ArgTy1 ArgTy2, isSame RetTy1 RetTy2.

type isIntegral t_ty -> o.
isIntegral int.
isIntegral long.
