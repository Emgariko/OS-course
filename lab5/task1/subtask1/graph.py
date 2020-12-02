import matplotlib as mpl
import numpy as np
import matplotlib.pyplot as plt
import math

LEN = 169

free_data = open("free.txt", "r")
used_data = open("used.txt", "r")
swapf_data = open("swapmem_free.txt", "r")
swapu_data = open("swapmem_used.txt", "r")

dpi = 80
fig = plt.figure(dpi = dpi, figsize = (512 / dpi, 384 / dpi) )
mpl.rcParams.update({'font.size': 10})

plt.title('Data')
plt.xlabel('time, sec')
plt.ylabel('Data usage, MiB')

free_vals = list(map(lambda element: float(element.replace(",", ".")), free_data.read().split("\n")[:-1]))
used_vals = list(map(lambda element: float(element.replace(",", ".")), used_data.read().split("\n")[:-1]))
swapf_vals = list(map(lambda element: float(element.replace(",", ".")), swapf_data.read().split("\n")[:-1]))
swapu_vals = list(map(lambda element: float(element.replace(",", ".")), swapu_data.read().split("\n")[:-1]))
xs = np.arange(0, len(free_vals), 1)

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
