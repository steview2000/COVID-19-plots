iter      chisq       delta/lim  lambda   L6            k6            x06          

After 18 iterations the fit converged.
final sum of squares of residuals : 2.6493e+10
rel. change during last iteration : -3.53687e-06

degrees of freedom    (FIT_NDF)                        : 63
rms of residuals      (FIT_STDFIT) = sqrt(WSSR/ndf)    : 20506.7
variance of residuals (reduced chisquare) = WSSR/ndf   : 4.20524e+08

Final set of parameters            Asymptotic Standard Error
=======================            ==========================
L6              = 1.1009e+06       +/- 2.026e+04    (1.84%)
k6              = 0.132787         +/- 0.003799     (2.861%)
x06             = 81.1271          +/- 0.3856       (0.4753%)

correlation matrix of the fit parameters:
                L6     k6     x06    
L6              1.000 
k6             -0.831  1.000 
x06             0.944 -0.796  1.000 
"/dev/fd/63" line 146: Cannot open script file 'multi.gnu'

# COVID-19-plots

Here is some regularly updated analysis of the COVID-19 outbreak.

Data from: https://github.com/CSSEGISandData/COVID-19

 *UPDATED: Thu 30 Apr 2020 09:16:22 AM CEST*

Data are provided for number of the number of _cumulated infected_, _recovered_ and _deceased_ patients.

## Currently infected

Let's first have a look at the currently sick people, i.e., the cumulated infected people minus the
deaths and recovered patients. This number is certainly important for the health systems and thus we
normalise them by the population. Not that this normalisation is still not sufficient, e.g., when
the infections mainly occur in a rather small area of a countr. We plot the number of normalised by the population of ad given country (in person per millions - ppm).

![Currently sick](plots/curr-sick.png)


## The growth rate of infection

We first consider the number of infected people. With a constant infection rate and an infinite
reservoir of _infectable_ people. This number should grow initially nearly exponentially without
proper countermeasures. We plot the data on a linear x-axis and a logarithmic y-axis. In this way an exponential growth of the infections shows up as straight lines. 

![Exponential development](plots/poly-exp-fit.png)

We see in the top figure, the infection data for 6 different countries. Most of them do not show
straight lines over the entire range. We calculate the relative infection rate from smoothed and
interpolated infection data in order to remove the scatter of the data. 

_doubling_table

*Please not that I have removed the logistic fits, as they are at this point of the pandemic not
very useful. The logistic curve only models the pandemic well when no measures
are taken. The measures that were taken and the change of the restrictions makes a good long term
projection impossible and we therefore refrain from doing so.*
