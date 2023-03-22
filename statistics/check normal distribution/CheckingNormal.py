# Using Histogram

print("\n Checking by using Histogram\n\n")

import matplotlib.pyplot as plt
import numpy as np

data = [2, 2, 3, 3, 3, 4, 6, 7, 8, 9, 9, 9]

bin_width = 1
bins = range(min(data), max(data) + bin_width, bin_width)

plt.hist(data, bins=bins)
plt.show()

print("From the histogram we can say that the ",data," does not follows the Normal distribution.\n\n")

# Varifying using empirical rule (68-95-99.7)

print("Varifying using empirical rule\n\n")

mean = np.mean(data)
std = np.std(data)

print(F"Mean: {mean}")
print(F"Standard deviation: {std}\n")

oneStd = (mean - std, mean + std)
twoStd = (mean - 2*std, mean + 2*std)
threeStd = (mean - 3*std, mean + 3*std)

within_oneStd = len([x for x in data if x >= oneStd[0] and x <= oneStd[1]])
within_twoStd = len([x for x in data if x >= twoStd[0] and x <= twoStd[1]])
within_threeStd = len([x for x in data if x >= threeStd[0] and x <= threeStd[1]])

print(f"Percentage of data within one standard deviation of the mean: {within_oneStd / len(data) * 100}%")
print(f"Percentage of data within two standard deviation of the mean: {within_twoStd / len(data) * 100}%")
print(f"Percentage of data within three standard deviation of the mean: {within_threeStd / len(data) * 100}%")

if within_oneStd >= 0.68 and within_twoStd >= 0.95 and within_threeStd >= 0.997:
    print(data, "follows the Normal distribution")
else:
    print(data, "does not follows the Normal distribution")