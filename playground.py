import numpy as np
import matplotlib.pyplot as plt



r = np.linspace(1,5,100)
theta = np.linspace(0,2*np.pi,360)

radius_matrix, theta_matrix = np.meshgrid(r,theta)

X = radius_matrix * np.cos(theta_matrix)
Y = radius_matrix * np.sin(theta_matrix)

ax = plt.subplot(111, polar=True)
ax.plot(theta_matrix, radius_matrix, color='r', ls='none', marker='.')