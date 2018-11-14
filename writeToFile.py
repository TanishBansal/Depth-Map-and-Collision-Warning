import os 
i = len([f for f in os.listdir(r"/home/tanish27bansal/monodepth/Images/Raw") if f[0] != '.'])
print(i)
os.chdir(r"/home/tanish27bansal/monodepth/utils/filenames/")
f= open("list.txt","w+")
x = 1
for x in range(1 ,i+1):
    f.write("Images/Raw/my_image"+str(x)+".jpg\n")
f.close()
 