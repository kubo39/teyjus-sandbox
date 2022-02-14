sig main.

% Basic definition.

kind t_ty type.
type int t_ty. /* 32-bit signed integer. */
type long t_ty. /* 64-bit signed integer. */
type float t_ty. /* 32-bit floating point. */
type string t_ty. /* UTF-8 string. */

type pointer t_ty -> t_ty.  /* pointer type. (*T) */

type const t_ty -> t_ty.  /* const type. (const T) */

type function t_ty -> t_ty -> t_ty.  /* function type. */

% Struct.

kind t_struct type.
kind t_ident type.

type ident string -> t_ident.

type struct t_ident -> (list t_ty) -> t_ty.

% parameter storage class as type constructor.

type ref t_ty -> t_ty.  /* ref T (T -> ref_T) */
type scope t_ty -> t_ty.  /* scope T */

% built-in traits.

type isSame t_ty -> t_ty -> o.
type isIntegral t_ty -> o.
type isFloating t_ty -> o.
type isArithmetic t_ty -> o.

% is expression.

type isExpression1 t_ty -> o. /* is(int) */
type isExpression2 t_ty -> t_ty -> o. /* is(T : int) */
type isExpression3 t_ty -> t_ty -> o. /* is(T == int) */
