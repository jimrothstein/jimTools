# 511_find_minimum.py — Explanation for Beginners

The file explained line by line:

```python
"""..."""                          # docstring: describes what the script does

def f(x):
    return 6 * (x - 2) ** 2        # the function; ** is power, ^ is XOR in Python
```

**Parameters** (same as the R version):
- `h = 0.001` — step for the numerical derivative
- `ada = 0.01` — learning rate

**Setup:**
- `random.seed(42)` — makes the random starting point reproducible
- `x0 = random.uniform(-5, 5)` — random start between -5 and 5 (R's `runif(1, -5, 5)`)
- `x = x0` — current position; `rows = []` — list to collect history

**The loop** (R's `for` becomes Python's `for ... in range(...)`):

```python
for i in range(1, n + 1):
```

- `range(1, n + 1)` gives 1, 2, ..., 5000 (the `+1` is needed because range stops *before* the end)
- `grad = (f(x + h) - f(x - h)) / (2 * h)` — central-difference gradient, identical to R
- `step_size = ada * grad`
- `x_new = x - step_size`
- `rows.append((i, x, f(x), grad, step_size))` — save a row (R's `add_row`)
- `x = x_new`
- `if abs(step_size) < 1e-6: break` — stop early once movement is tiny

**Printing:** a header, then each row formatted with `f"{x:14.6f}"` (14 chars wide, 6 decimals — R-style alignment), then the final line.

Key beginner differences from R: `**` not `^`, `def` not `<-`, indentation instead of `{}`/curly braces, and `range()` instead of `1:n`.
