#TANZEEM AHMED
#AMTH06
#N=100 RANDOM WALK SIMULATION OF BROWNIAN MOTION 

import numpy as np
import matplotlib.pyplot as plt
import random

def randomwalk(n):
    x, y = 0, 0

    timestops = np.arange(n + 1)
    positions = [y]

    directions = ["UP", "DOWN"]
    for i in range(1, n + 1):

        walk = random.choice(directions)
        if walk == "UP":
            y += 1
        elif walk == "DOWN":
            y -= 1        

        positions.append(y)

    return timestops, positions

randomplot1 = randomwalk(100)
randomplot2 = randomwalk(100)
randomplot3 = randomwalk(100)
randomplot4 = randomwalk(100)

plt.title("Brownian Motion Approximated by Random Walk n=100")

plt.plot(randomplot1[0], randomplot1[1], 'r-', label="Brownian Motion Walk 1")
plt.plot(randomplot2[0], randomplot2[-1], 'b-', label="Brownian Motion Walk 2")
plt.plot(randomplot3[0], randomplot3[1], 'y-', label="Brownian Motion Walk 3")
plt.plot(randomplot4[0], randomplot4[-1], 'g-', label="Brownian Motion Walk 4")

plt.xlabel('t')
plt.ylabel('B(t)')
plt.show()
