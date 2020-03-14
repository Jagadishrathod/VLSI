from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

x =[110,115,98,120,118,102,106,111]
y =[62,63,62,65,68,58,65,57]
z =[37.1,37.2,36.8,37,37.1,37.3,36.9,37]



ax.scatter(x, y, z, c='r', marker='o')

ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')

plt.show()
