import matplotlib as mpl
import numpy as np
import matplotlib.pyplot as plt
import math

used_data = open("used_process.txt", "r")

LEN = 169

dpi = 80
fig = plt.figure(dpi = dpi, figsize = (512 / dpi, 384 / dpi) )
mpl.rcParams.update({'font.size': 10})


plt.title('Data')
plt.xlabel('time, sec')
plt.ylabel('Used data of process in %')

used_vals = list(map(lambda element: float(element.replace(",", ".")), used_data.read().split("\n")[:-1]))
while (len(used_vals) != LEN):
    used_vals.append(0.0)
xs = np.arange(0, len(used_vals), 1)


plt.plot(xs, used_vals, color = 'red', linestyle = 'solid',
         label = 'used')

plt.legend(loc = 'upper right')
plt.show()
fig.savefig('process_data.png')
