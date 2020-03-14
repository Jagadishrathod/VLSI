from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

x =[138,140,145,136,129,133,138]
y =[76,75,88,89,95,82,73]
z =[38.2,39.2,38.6,39.8,37.9,38.3,38.4]



ax.scatter(x, y, z, c='r', marker='o')

ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')

plt.show()
