module main.

kind t_ty type.
type int t_ty. /* 32-bit signed integer. */
type long t_ty. /* 64-bit signed integer. */
type string t_ty. /* UTF-8 string. */

% parameter storage class as type constructor.

type ref t_ty -> t_ty.  /* ref T (T -> ref_T) */
type scope t_ty -> t_ty.  /* scope T */

% built-in traits.

type isSame t_ty -> t_ty -> o.
isSame int int.
isSame long long.
isSame string string.
isSame (ref T1) (ref T2) :- isSame T1 T2.

type isIntegral t_ty -> o.
isIntegral int.
isIntegral long.
