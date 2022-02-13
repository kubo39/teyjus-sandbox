module main.

kind t_ty type.
type int t_ty. /* 32-bit signed integer. */
type long t_ty. /* 64-bit signed integer. */

type isSame t_ty -> t_ty -> o.
isSame int int.
isSame long long.

type isIntegral t_ty -> o.
isIntegral int.
isIntegral long.
