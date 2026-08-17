# jimTools

## Decisions
- 2026-08-05: Created `R/510_find_minimum.qmd` — gradient descent demo on `f(x) = 6(x-2)^2` building iteration history as a tibble row-by-row via `add_row()`. Why: learning/teaching exercise for numerical minimization.
- 2026-08-05: Use central-difference numerical gradient `(f(x+h)-f(x-h))/(2h)` with `h = 0.001`, adaptive step size `ada`. Why: no analytic gradient needed.
- 2026-08-05: Start `x0` randomly via `runif(1, -5, 5)` with `set.seed(42)` for reproducibility.
- 2026-08-05: Set `ada = 0.01` (not `1/12`). Why: user preference for a visible, slower convergence; `1/12` is optimal and converges in 2 iters.
- 2026-08-05: Column names `N`, `x`, `fx`, `grad`, `step_size`; convergence break when `abs(step_size) < 1e-6`. Why: clear naming; fixed a rename bug (`step` → `step_size`).

## Current state
`R/510_find_minimum.qmd` is complete and verified: converges in 99 iterations (x0 = 4.148, ada = 0.01) to x = 2.000007. Iteration count is estimated by `k = log(tol/(12·ada·|x0-2|)) / log(|1-12·ada|)`.

## Paths chosen
- Gradient descent with finite-difference gradient + fixed adaptive step (`ada`), per-iteration tibble via `add_row()`.
