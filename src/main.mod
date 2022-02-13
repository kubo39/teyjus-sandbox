module main.

% Basic definition.

kind t_ty type.
type int t_ty. /* 32-bit signed integer. */
type long t_ty. /* 64-bit signed integer. */
type string t_ty. /* UTF-8 string. */

type pointer t_ty -> t_ty.  /* pointer type. (*T) */

% parameter storage class as type constructor.

type ref t_ty -> t_ty.  /* ref T (T -> ref_T) */
type scope t_ty -> t_ty.  /* scope T */

% built-in traits.

type isSame t_ty -> t_ty -> o.
isSame int int.
isSame long long.
isSame string string.
isSame (pointer T1) (pointer T2) :- isSame T1 T2.

type isIntegral t_ty -> o.
isIntegral int.
isIntegral long.
