import os
import cv2
import numpy as np
#qe=os.environ["bo"]
w=np.load(r"/home/tanish27bansal/monodepth/Output/disparities_pp.npy")
i=1
s=0
q=1
f=open(r"/home/tanish27bansal/monodepth/darknet/r.txt","r+")
x=[]
yy=[]
t=[]
d=0
g=r"/home/tanish27bansal/monodepth/ImagesNormal/Raw/"
qe = len([f for f in os.listdir(r"/home/tanish27bansal/monodepth/ImagesNormal/Raw/") if f[0] != '.'])
for y in range(1,qe):
    f.seek(s, 0)
    while True:
        b=f.read(i)
        x.append(b)
        if b == "$":
            p=f.tell() 
            break

    s=p+1    
    #print(p)
    x.pop()    
#print(x)
    g1=g+"my_image"+str(y)+".jpg"
    j=cv2.imread(g1)
    new=j
    r=open(r"/home/tanish27bansal/monodepth/darknet/ultimate2.txt","w")
    str1=''.join(x)
    #print(str1)
    r.write(str1)
    r.close()
    r1=open(r"/home/tanish27bansal/monodepth/darknet/ultimate2.txt","r")
    #num_line=sum(1 for line in (r1))
    #print (num_line)
    
    for line in (r1):
        print("done")
        z=line.split("\t")
        yy.append(z)
    for c in range(len(yy)):
        #print("hoe")
        a=int(yy[c][1])
        b=int(yy[c][2])
        car=(721*0.54)/(w[c][b][a]*1242*1.762)
        #print (yy[c][0],car)
        new=cv2.putText(j,yy[c][0]+"="+str(car),(50,30*(c+1)),cv2.FONT_HERSHEY_TRIPLEX,.8,(0,255,255))
        
        t.append(car)
        
    for element in range(len(t)):
        if t[element]<=4:
            d=373
    if d==373:
        new=cv2.putText(j,"COLLISION WARNING!",(310,30),cv2.FONT_HERSHEY_COMPLEX_SMALL,1.5,(0,0,256))
        d=0
    yy.clear()
    t.clear()
    filename="/home/tanish27bansal/monodepth/darknet/collisions/"+"collisions"+str(y)+".jpg"
    cv2.imwrite(filename,new)
    x.clear()    
    r1.close()   
    
    
    

f.close()
#l=f.readline(delimiter='~')

#print(l)
#print(f.read())