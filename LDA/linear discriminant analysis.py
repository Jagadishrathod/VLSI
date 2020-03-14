import numpy as np
import os
import math
import time
start_time = time.time()
v1,v2,v3=np.loadtxt(
    'Patients.txt',
    skiprows=1,
    unpack=True
)
p1,p2,p3=np.loadtxt(
    'Non-Patients.txt',
    skiprows=1,
    unpack=True
)
print(v1)
print(v2)
print(v3)
print(p1)
print(p2)
print(p3)
x=len(v1)
y=len(p2)
ap1=0
ap2=0
ap3=0
av1=0
av2=0
av3=0
for i in range (0,y,1):
    cmd = './add +x='+str(int(ap1))+' +y='+str(int(p1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    ap1=int(k)
    f.close()
    cmd = './add +x='+str(int(ap2))+' +y='+str(int(p2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    ap2=int(k)
    f.close()
    cmd = './add +x='+str(int(ap3))+' +y='+str(int(p3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    ap3=int(k)
    f.close()

ap1=ap1/y
ap2=ap2/y
ap3=ap3/y
print(ap1)
print(ap2)
print(ap3)

for i in range (0,x,1):
    cmd = './add +x='+str(int(av1))+' +y='+str(int(v1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    av1=int(k)
    f.close()
    cmd = './add +x='+str(int(av2))+' +y='+str(int(v2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    av2=int(k)
    f.close()
    cmd = './add +x='+str(int(av3))+' +y='+str(int(v3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    av3=int(k)
    f.close()
av1=av1/x
av2=av2/x
av3=av3/x
print(av1)
print(av2)
print(av3)
g1=((av1*x)+(ap1*y))/(x+y)
cmd = './wall +x='+str(int(av1))+' +y='+str(int(x))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
a1=int(k)
f.close()
cmd = './wall +x='+str(int(ap1))+' +y='+str(int(y))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
a2=int(k)
f.close()
cmd = './add +x='+str(int(x))+' +y='+str(int(y))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
b=int(k)
f.close()
cmd = './add +x='+str(int(a1))+' +y='+str(int(a2))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
g1=int(k)
f.close()

b1=g1/b

cmd = './wall +x='+str(int(av2))+' +y='+str(int(x))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
a3=int(k)
f.close()
cmd = './wall +x='+str(int(ap2))+' +y='+str(int(y))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
a4=int(k)
f.close()
cmd = './add +x='+str(int(a3))+' +y='+str(int(a4))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
g2=int(k)
f.close()

b2=g2/b

cmd = './wall +x='+str(int(av3))+' +y='+str(int(x))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
a5=int(k)
f.close()
cmd = './wall +x='+str(int(ap3))+' +y='+str(int(y))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
a6=int(k)
f.close()

g3=a5+a6

cmd = './add +x='+str(int(a5))+' +y='+str(int(a6))
os.system(cmd)
f = open('output.txt','r')
k = f.read()
g3=int(k)
f.close()

b3=g3/b

print(b1)
print(b2)
print(b3)

cv1=[]
cv2=[]
cv3=[]
cp1=[]
cp2=[]
cp3=[]
for i  in range(0,x,1):
    cv1.append(v1[i]-g1)
    cv2.append(v2[i]-g2)
    cv3.append(v3[i]-g3)
print(cv1)
print(cv2)
print(cv3)
for i  in range(0,y,1):
    cp1.append(p1[i]-g1)
    cp2.append(p2[i]-g2)
    cp3.append(p3[i]-g3)
print(cp1)
print(cp2)
print(cp3)
c11=[0,0,0]
c12=[0,0,0]
c13=[0,0,0]
for i in range(0,x,1):
    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a7=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[0]))+' +y='+str(int(a7))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a8=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[1]))+' +y='+str(int(a8))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a9=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[2]))+' +y='+str(int(a9))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[2]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a10=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[0]))+' +y='+str(int(a10))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a11=int(k)
    f.close()
    cmd = './add +x='+str(int(c12[1]))+' +y='+str(int(a11))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a12=int(k)
    f.close()
    cmd = './add +x='+str(int(c12[2]))+' +y='+str(int(a12))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[2]=int(k)
    f.close()
    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a13=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[0]))+' +y='+str(int(a13))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a14=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[1]))+' +y='+str(int(a14))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a15=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[2]))+' +y='+str(int(a15))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[2]=int(k)
    f.close()

c11[0]=c11[0]/x
c11[1]=c11[1]/x
c11[2]=c11[2]/x
c12[0]=c12[0]/x
c12[1]=c12[1]/x
c12[2]=c12[2]/x
c13[0]=c13[0]/x
c13[1]=c13[1]/x
c13[2]=c13[2]/x
print(c11)
print(c12)
print(c13)

c11=[0,0,0]
c12=[0,0,0]
c13=[0,0,0]
for i in range(0,x,1):
   
    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q7=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[0]))+' +y='+str(int(q7))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q8=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[1]))+' +y='+str(int(q8))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q9=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[2]))+' +y='+str(int(q9))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[2]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q10=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[0]))+' +y='+str(int(q10))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q11=int(k)
    f.close()
    cmd = './add +x='+str(int(c12[1]))+' +y='+str(int(q11))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q12=int(k)
    f.close()
    cmd = './add +x='+str(int(c12[2]))+' +y='+str(int(q12))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[2]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q13=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[0]))+' +y='+str(int(q13))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a14=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[1]))+' +y='+str(int(a14))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q15=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[2]))+' +y='+str(int(q15))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[2]=int(k)
    f.close()
    
c11[0]=c11[0]/x
c11[1]=c11[1]/x
c11[2]=c11[2]/x
c12[0]=c12[0]/x
c12[1]=c12[1]/x
c12[2]=c12[2]/x
c13[0]=c13[0]/x
c13[1]=c13[1]/x
c13[2]=c13[2]/x
print(c11)
print(c12)
print(c13)

c11=[0,0,0]
c12=[0,0,0]
c13=[0,0,0]
for i in range(0,x,1):
    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q7=int(k)
    f.close()

    cmd = './add +x='+str(int(c11[0]))+' +y='+str(int(q7))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q8=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[1]))+' +y='+str(int(q8))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv1[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q9=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[2]))+' +y='+str(int(q9))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c11[2]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q10=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[0]))+' +y='+str(int(q10))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q11=int(k)
    f.close()
    cmd = './add +x='+str(int(c12[1]))+' +y='+str(int(q11))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv2[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q12=int(k)
    f.close()
    cmd = './add +x='+str(int(c12[2]))+' +y='+str(int(q12))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c12[2]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q13=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[0]))+' +y='+str(int(q13))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a14=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[1]))+' +y='+str(int(a14))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cv3[i]))+' +y='+str(int(cv3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q15=int(k)
    f.close()
    cmd = './add +x='+str(int(c13[2]))+' +y='+str(int(q15))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c13[2]=int(k)
    f.close()

c11[0]=c11[0]/x
c11[1]=c11[1]/x
c11[2]=c11[2]/x
c12[0]=c12[0]/x
c12[1]=c12[1]/x
c12[2]=c12[2]/x
c13[0]=c13[0]/x
c13[1]=c13[1]/x
c13[2]=c13[2]/x
print(c11)
print(c12)
print(c13)

c21=[0,0,0]
c22=[0,0,0]
c23=[0,0,0]
for i in range(0,y,1):
    cmd = './wall +x='+str(int(cp1[i]))+' +y='+str(int(cp1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q7=int(k)
    f.close()
    cmd = './add +x='+str(int(c21[0]))+' +y='+str(int(q7))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c21[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cp1[i]))+' +y='+str(int(cp2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q8=int(k)
    f.close()
    cmd = './add +x='+str(int(c21[1]))+' +y='+str(int(q8))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c21[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cp1[i]))+' +y='+str(int(cp3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q9=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[2]))+' +y='+str(int(q9))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c21[2]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cp2[i]))+' +y='+str(int(cp1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q10=int(k)
    f.close()
    cmd = './add +x='+str(int(c11[0]))+' +y='+str(int(q10))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c22[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cp2[i]))+' +y='+str(int(cp2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q11=int(k)
    f.close()
    cmd = './add +x='+str(int(c22[1]))+' +y='+str(int(q11))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c22[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cp2[i]))+' +y='+str(int(cp3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q12=int(k)
    f.close()
    cmd = './add +x='+str(int(c22[2]))+' +y='+str(int(q12))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c22[2]=int(k)
    f.close()
    cmd = './wall +x='+str(int(cp3[i]))+' +y='+str(int(cp1[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q13=int(k)
    f.close()
    cmd = './add +x='+str(int(c23[0]))+' +y='+str(int(q13))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c23[0]=int(k)
    f.close()
    
    cmd = './wall +x='+str(int(cp3[i]))+' +y='+str(int(cp2[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    a14=int(k)
    f.close()
    cmd = './add +x='+str(int(c23[1]))+' +y='+str(int(a14))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c23[1]=int(k)
    f.close()

    cmd = './wall +x='+str(int(cp3[i]))+' +y='+str(int(cp3[i]))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    q15=int(k)
    f.close()
    cmd = './add +x='+str(int(c23[2]))+' +y='+str(int(q15))
    os.system(cmd)
    f = open('output.txt','r')
    k = f.read()
    c23[2]=int(k)
    f.close()
c21[0]=c21[0]/y
c21[1]=c21[1]/y
c21[2]=c21[2]/y
c22[0]=c22[0]/y
c22[1]=c22[1]/y
c22[2]=c22[2]/y
c23[0]=c23[0]/y
c23[1]=c23[1]/y
c23[2]=c23[2]/y
print(c21)
print(c22)
print(c23)
c1=[0,0,0]
c2=[0,0,0]
c3=[0,0,0]

for i in range(0,3,1):
    
	c1[0]=((x/(x+y))*c11[0])+((y/(x+y))*c21[0])   
	c1[1] = ((x / (x + y)) * c11[1]) + ((y / (x + y)) * c21[1])
	c1[2] = ((x / (x + y)) * c11[2]) + ((y / (x + y)) * c21[2])
	c2[0] = ((x / (x + y)) * c12[0]) + ((y / (x + y)) * c22[0])
	c2[1] = ((x / (x + y)) * c12[1]) + ((y / (x + y)) * c22[1])
	c2[2] = ((x / (x + y)) * c12[2]) + ((y / (x + y)) * c22[2])
	c3[0] = ((x / (x + y)) * c13[0]) + ((y / (x + y)) * c23[0])
	c3[1] = ((x / (x + y)) * c13[1]) + ((y / (x + y)) * c23[1])
	c3[2] = ((x / (x + y)) * c13[2]) + ((y / (x + y)) * c23[2])

print(c1)
print(c2)
print(c3)
q=[0,0,0]
q[0]=float(input("enter patients bp:"))
q[1]=float(input("enter patients pulse:"))
q[2]=float(input("enter patients temp:"))

print(q)
f1=0
ci1=[0,0,0]
ci2=[0,0,0]
ci3=[0,0,0]
det=(c1[0]*((c2[1]*c3[2])-(c2[2]*c3[1])))-(c1[1]*((c2[0]*c3[2])-(c2[2]*c3[0])))+(c1[2]*((c2[0]*c3[1])-(c3[0]*c2[1])))
print(det)
ci1[0]=(c2[1]*c3[2])-(c2[2]*c3[1])
ci1[1]=0-((c2[0]*c3[2])-(c2[2]*c3[0]))
ci1[2]=(c2[0]*c3[1])-(c2[1]*c3[0])
ci2[0]=0-((c1[1]*c3[2])-(c1[2]*c3[1]))
ci2[1]=(c1[0]*c3[2])-(c1[2]*c3[0])
ci2[2]=0-((c1[0]*c3[1])-(c1[1]*c3[0]))
ci3[0]=(c1[1]*c2[2])-(c1[2]*c2[1])
ci3[1]=0-((c1[0]*c2[2])-(c1[2]*c2[0]))
ci3[2]=(c1[0]*c2[1])-(c1[1]*c2[0])
temp=ci1[1]
ci1[1]=ci2[0]
ci2[0]=temp
temp=0
temp=ci1[2]
ci1[2]=ci3[0]
ci3[0]=temp
temp=0
temp=ci2[2]
ci2[2]=ci3[1]
ci3[1]=temp

ci1[0]=ci1[0]/det
ci1[1]=ci1[1]/det
ci1[2]=ci1[2]/det
ci2[0]=ci2[0]/det
ci2[1]=ci2[1]/det
ci2[2]=ci2[2]/det
ci3[0]=ci3[0]/det
ci3[1]=ci3[1]/det
ci3[2]=ci3[2]/det
print(ci1)
print(ci2)
print(ci3)
v=[0,0,0]

v[0]=(av1*ci1[0])+(av2*ci2[0])+(av3*ci3[0])
v[1] = (av1 * ci1[1]) + (av2 * ci2[1]) + (av3 * ci3[1])
v[2] = (av1 * ci1[2]) + (av2 * ci2[2]) + (av3 * ci3[2])


p=(v[0]*q[0])+(v[1]*q[1])+(v[2]*q[2])
f=(v[0]*av1)+(v[1]*av2)+(v[2]*av3)
print(p)
print(f)

f1=p-(0.5*f)+np.log(x/(x+y))
print(f1)
v1=[0,0,0]
v1[0]=(ap1*ci1[0])+(ap2*ci2[0])+(ap3*ci3[0])
v1[1]=(ap1*ci1[1])+(ap2*ci2[1])+(ap3*ci3[1])
v1[2]=(ap1*ci1[2])+(ap2*ci2[2])+(ap3*ci3[2])

l=(v1[0]*q[0])+(v1[1]*q[1])+(v1[2]*q[2])
m=(v1[0]*ap1)+(v1[1]*ap2)+(v1[2]*ap3)
print(l)
print(m)
f2=l-(0.5*m)+np.log(y/(x+y))
print(f1)
print(f2)
if(f1>f2):
    print("person is having chances of getting disease ")
else:
    print("person is less chances to get disease")

print("--- %s seconds ---" % (time.time() - start_time))
