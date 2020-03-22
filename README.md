# COVID-19-plots

Here is some regularly updated analysis of the COVID-19 outbreak.

The data are from: https://github.com/CSSEGISandData/COVID-19

**UPDATED:  Sat 21 Mar 2020 09:52:32 PM CET**

## The growth rate of infection

Data are provided for number of the number of _cumulated infected_, _recovered_ and _deceased_ patients.
We first consider the number of infected people. With a constant infection rate and an infinite
reservoir of infectable people,  this number should grow nearly exponentially. Therefore, we plot
the data on a linear x-axis and a logarithmic y-axis. In this way an exponential growth of the
infections shows up as straight lines. 

![Exponential development](plot-1.png)

We see in the top figure, the infection data for 6 different countries. Most of them do not show
straight lines over the entire range. The relative infection rate can be calculated by dividing the
daily increase by the number of infections. However, as the data scatter, also these numbers scatter
significantly and trends are difficult to grasp. Therefore, we fit polynomials of 4th order to the
logarithm of the infections. The 1st derivative of these polynomials are the mark the effective
infection rates and are plotted as solid lines in the lower plot.


![Logistic Curve](plot-3.png)
