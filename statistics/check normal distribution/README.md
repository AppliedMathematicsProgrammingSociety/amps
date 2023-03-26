# Checking Normal Distribution

### Algorithm :
1. Define the dataset as a list of numbers.
2. Create a histogram of the dataset using *matplotlib*.
3. Define the *bin width* for the **histogram.**
4. Calculate the bins based on the minimum and maximum values of the dataset and the bin width.
5. Plot the **histogram** using the defined bins.
6. Calculate the *mean* and *standard deviation* of the dataset using *numpy*.
7. Calculate the range of values within one, two, and three standard deviations of the mean.
8. Calculate the percentage of data within each range.
9. Check if the percentage of data within one, two, and three standard deviations of the mean is less than *68%, 95%, and 99.7%*, respectively.
10. If the percentage of data within one, two, and three standard deviations of the mean is less than the respective thresholds, then the dataset does not follow a normal distribution.
11. If the dataset does not follow a normal distribution, print "does not follows the Normal distribution."
12. If the dataset follows a normal distribution, print "follows the Normal distribution."

### Code description :
This code snippet checks whether a given dataset follows a *Normal distribution* by using the **histogram** and the **empirical rule**. The data variable holds the dataset which is a list of numbers. The code generates a histogram of the dataset using *matplotlib* and checks whether the distribution is normal.

The next section uses the **empirical rule** to calculate the mean and *standard deviation* of the dataset. The empirical rule is then used to determine the percentage of data within one, two, and three standard deviations of the mean.

If the percentage of data within one, two, and three standard deviations of the mean is less than *68%, 95%, and 99.7%*, respectively, then the dataset does not follow a normal distribution.

The code then prints the result whether the dataset follows a normal distribution or not. If it does, it prints "follows the Normal distribution," and if it does not, it prints "does not follows the Normal distribution."

### Sample run :
![graph_checkNormal jpeg](https://user-images.githubusercontent.com/124142616/227764729-185d2913-c875-4135-9747-dde93589f667.png)
![run_checkNormal jpeg](https://user-images.githubusercontent.com/124142616/227764881-55d20588-23f7-4c6d-8214-b205fdf46b6e.png)
