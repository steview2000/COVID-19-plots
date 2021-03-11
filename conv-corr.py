import numpy as np
import signal
import PyGnuplot as gp

x=np.linspace(0,100,2000)
y=np.sin(0.3*x)+np.random.rand(2000)

flt = np.array([0.05,0.2,0.5,0.2,0.05])

ycr = np.correlate(y,flt,"same")
ycn = np.convolve(y,flt,"same")
gp.plot([x,y],[x,ycr],'title \"correl\" w l ls 1',[x,ycn],'title \"conv\" w l ls 2')

