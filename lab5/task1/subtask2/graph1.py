import matplotlib as mpl
import numpy as np
import matplotlib.pyplot as plt
import math

used_data = open("used_process.txt", "r")
used_data1 = open("used_process1.txt", "r")

LEN = 70

dpi = 80
fig = plt.figure(dpi = dpi, figsize = (512 / dpi, 384 / dpi) )
mpl.rcParams.update({'font.size': 10})

plt.title('Data')
plt.xlabel('time, sec')
plt.ylabel('Used data of process in %')

used_vals = list(map(lambda element: float(element.replace(",", ".")), used_data.read().split("\n")[:-1]))
used_vals1 = list(map(lambda element: float(element.replace(",", ".")), used_data1.read().split("\n")[:-1]))

while (len(used_vals) != LEN):
    used_vals.append(0.0)
while (len(used_vals1) != LEN):
    used_vals1.append(0.0)
xs = np.arange(0, len(used_vals), 1)


plt.plot(xs, used_vals, color = 'red', linestyle = 'solid',
         label = 'mem.bash used')
plt.plot(xs, used_vals1, color = 'orange', linestyle = 'solid',
         label = 'mem2.bash used')

plt.legend(loc = 'upper right')
plt.show()
fig.savefig('process_data.png')
