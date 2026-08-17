"""Find minimum of f(x) = 6 * (x - 2)^2 via gradient descent.

Mirrors R/510_find_minimum.qmd: numerical gradient (central differences),
adaptive learning rate, iteration history printed like a tibble.
Pure Python, no numpy.
"""

import random


def f(x):
    return 6 * (x - 2) ** 2


h = 0.001
ada = 0.01

random.seed(42)
x0 = random.uniform(-5, 5)
n = 5000

x = x0
rows = []

for i in range(1, n + 1):
    grad = (f(x + h) - f(x - h)) / (2 * h)
    step_size = ada * grad
    x_new = x - step_size

    rows.append((i, x, f(x), grad, step_size))

    x = x_new

    if abs(step_size) < 1e-6:
        break

widths = [3, 14, 18, 14, 14]
print("    N             x                fx           grad       step_size")
print("-" * sum(widths) + "-----")
for i, xi, fxi, g, s in rows:
    print(f"{i:4d} {xi:14.6f} {fxi:18.6f} {g:14.6f} {s:14.6f}")

print()
print(f"final x = {x:.6f}  f(x) = {f(x):.6f}  after {len(rows)} iterations")
