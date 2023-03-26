# Using Histogram

print("\n Checking by using Histogram-\n")

import matplotlib.pyplot as plt
import numpy as np

data = [2, 2, 3, 3, 3, 4, 6, 7, 8, 9, 9, 9]

bin_width = 1
bins = range(min(data), max(data) + bin_width, bin_width)

plt.hist(data, bins=bins)
plt.show()

print(data, " does not follows the Normal distribution.\n")

# Verifying using empirical rule (68-95-99.7)

print("Verifying using empirical rule-\n")

mean = np.mean(data)
std = np.std(data)

print(f"Mean: {mean}")
print(f"Standard deviation: {std}\n")

oneStd = (mean - std, mean + std)
twoStd = (mean - 2 * std, mean + 2 * std)
threeStd = (mean - 3 * std, mean + 3 * std)

within_oneStd = len([x for x in data if oneStd[0] <= x <= oneStd[1]]) / len(data)
within_twoStd = len([x for x in data if twoStd[0] <= x <= twoStd[1]]) / len(data)
within_threeStd = len([x for x in data if threeStd[0] <= x <= threeStd[1]]) / len(data)

print(f"Percentage of data within one standard deviation of the mean: {within_oneStd * 100}%")
print(f"Percentage of data within two standard deviation of the mean: {within_twoStd * 100}%")
print(f"Percentage of data within three standard deviation of the mean: {within_threeStd * 100}%\n")

if within_oneStd < 0.68 or within_twoStd < 0.95 or within_threeStd < 0.997:
    print(data, "does not follows the Normal distribution.")
else:
    print(data, "follows the Normal distribution")

    
 # Muhammad Sazzad Abrar Saad - 26/03/2023
