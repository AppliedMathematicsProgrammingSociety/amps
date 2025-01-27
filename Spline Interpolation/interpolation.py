import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

x=np.array([1,5,6,8,10,15])
y=np.array([2,9,1,8,5,25])

x_coord=np.linspace(np.min(x),np.max(x),100*len(x))
y_coord1=interp1d(x,y, kind="linear")
y_coord2=interp1d(x,y, kind="quadratic")
y_coord3=interp1d(x,y, kind="cubic")

plt.plot(x,y,"o")
plt.plot(x_coord,y_coord1(x_coord),"r",label="Linear")
plt.plot(x_coord,y_coord2(x_coord),"g",label="Quadratic")
plt.plot(x_coord,y_coord3(x_coord),"b",label="Cubic")
plt.legend({"Data points","Linear","Quadratic", "Cubic"})
plt.grid()
plt.show()

