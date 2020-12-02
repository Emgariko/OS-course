#import numpy as np
#from matplotlib import pyplot as plt

#fig, ax = plt.subplots()

 #Данные, которые хотим отобразить:
#x1 = 10*np.random.rand(100)    #  координаты 'x'
#y1 = 10*np.random.rand(100)    #  координаты 'y'

#ax.scatter(x1, y1)    #  метод, отображающий данные в виде точек
                       #на плоскости

#ax.set(title='Случайные точки')    #  метод, размещающий заголовок
                                        #над "Axes"
    
#plt.show()




#X = [590,540,740,130,810,300,320,230,470,620,770,250]
#Y = [32,36,39,52,61,72,77,75,68,57,48,48]

#plt.scatter(X,Y)



#plt.show()





import matplotlib as mpl
import numpy as np
import matplotlib.pyplot as plt
import math

LEN = 180

free_data = open("free.txt", "r")
used_data = open("used.txt", "r")
swapf_data = open("swapmem_free.txt", "r")
swapu_data = open("swapmem_used.txt", "r")

dpi = 80
fig = plt.figure(dpi = dpi, figsize = (512 / dpi, 384 / dpi) )
mpl.rcParams.update({'font.size': 10})

#plt.axis([0, 10, -1.5, 1.5])

plt.title('Data')
plt.xlabel('time, sec')
plt.ylabel('Data usage, MiB')

free_vals = list(map(lambda element: float(element.replace(",", ".")), free_data.read().split("\n")[:-1]))
#print(free_vals)
#print(free_vals)
used_vals = list(map(lambda element: float(element.replace(",", ".")), used_data.read().split("\n")[:-1]))
#print(used_vals)
swapf_vals = list(map(lambda element: float(element.replace(",", ".")), swapf_data.read().split("\n")[:-1]))
xs = np.arange(0, len(free_vals), 1)
swapu_vals = list(map(lambda element: float(element.replace(",", ".")), swapu_data.read().split("\n")[:-1]))

plt.plot(xs, free_vals, color = 'blue', linestyle = 'solid',
         label = 'free')
plt.plot(xs, used_vals, color = 'red', linestyle = 'solid',
         label = 'used')
plt.plot(xs, swapf_vals, color = 'cyan', linestyle = 'dashed',
         label = 'swap_free')
plt.plot(xs, swapu_vals, color = 'orange', linestyle = 'dashed',
         label = 'swap_used')

plt.legend(loc = 'lower left')
plt.show()
fig.savefig('data.png')
