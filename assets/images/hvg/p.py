from PIL import Image

img = Image.open('g3.png')
#img = img.convert("RGBA")
#datas = img.getdata()
pix = img.load()

xx,yy=img.size
print (xx)
print (yy)
#for x in range(int(xx/2)-30,int(xx/2)+30):
#	for y in range(int(yy/2)-30,int(yy/2)+30):
#		#print (pix[x,y])
#		pix[x,y]=(255, 255, 255,0)
#		#print (pix[x,y])
#img.save('qq.png')

for x in range(0,int(xx/2)):
    s = 1.75 * x
    for y in range(int(s),224):
        #print(y)
        pix[x,y]=(255, 255, 255,0)
        pix[255-x,y]=(255, 255, 255,0)
img.save('qq.png')
