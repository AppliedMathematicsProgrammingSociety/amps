# Interpolation Demo using Python

This notebook demonstrates how to use `scipy.interpolate` for linear, quadratic, and cubic interpolation. We'll also visualize the results with Matplotlib.

---

## Importing Required Libraries

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d
```

---

## Defining Data Points

The data points we will interpolate are:

```python
x = np.array([1, 5, 6, 8, 10, 15])
y = np.array([2, 9, 1, 8, 5, 25])
```

### Visualizing the Data Points

```python
plt.plot(x, y, "o", label="Data points")
plt.grid()
plt.legend()
plt.show()
```

---

## Generating Interpolation Functions

To create smooth curves, we interpolate the data using three methods: linear, quadratic, and cubic.

```python
# Generating a dense range of x-coordinates
x_coord = np.linspace(np.min(x), np.max(x), 100 * len(x))

# Creating interpolation functions
y_coord1 = interp1d(x, y, kind="linear")
y_coord2 = interp1d(x, y, kind="quadratic")
y_coord3 = interp1d(x, y, kind="cubic")
```

---

## Plotting the Interpolations

We now plot the original data points along with the interpolated curves.

```python
plt.plot(x, y, "o", label="Data points")
plt.plot(x_coord, y_coord1(x_coord), "r", label="Linear")
plt.plot(x_coord, y_coord2(x_coord), "g", label="Quadratic")
plt.plot(x_coord, y_coord3(x_coord), "b", label="Cubic")

plt.legend()
plt.grid()
plt.show()
```
![image](https://github.com/user-attachments/assets/594a0912-9082-4356-9d76-ccd66f4656b3)

---

## Observations

1. **Linear Interpolation**: Produces straight-line segments between data points.
2. **Quadratic Interpolation**: Creates a smooth curve but may introduce more variation.
3. **Cubic Interpolation**: Produces an even smoother curve, often used for high-quality visualizations.



## Author

 [@NayeemulHasan](https://www.github.com/nayeemulhasan0)

