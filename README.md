


# COVID-19-plots

Here is some regularly updated analysis of the COVID-19 outbreak.

Data from: https://github.com/CSSEGISandData/COVID-19

 *UPDATED: Tue 24 Mar 2020 11:47:21 AM CET*

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
logarithm of the infections. The 1st derivative of these polynomials mark the effective
infection rates and are plotted as solid lines in the lower plot. Note, one should not overinterpret
the data, since small fluctuations in the data get picked up by the fits and thus show unreal
trends. However, one can clearly see, how the infection rates in Italy decrease albeit slowly,
steadily.

*Infection rates doubled in :*
|Country | days until doubling of infections| 
| --- | --- |
|germany: |8.57 days|
|italy: |13.19 days|
|korea: |23.31 days|
|spain: |5.19 days|
|uk: |8.22 days|
|us: |1.84 days|



## Logisitc function
The number of infected agents during a pandemic often follow a [logistic function](https://en.wikipedia.org/wiki/Logistic_function).
The number of infected agents increases initially exponentially, as long as most of the population
is not infected yet. When the infection rate increases, it will be more difficult for the virus to
find fresh (not infected) hosts and the slope of the curve decreases. The curve reaches its
inflection point when roughly half of the population is infected and after finally reaches
asymptotically a constant value, i.e., uninfected hosts are so rare that the virus can no longer
spread. 

The COVID-19 pandemic is however different, as the infection rates are not so much controlled by the
progress of the infections, but rather by the measures the societies are taken to slow down the
outbreak. Nevertheless, fitting a logisitic function to the data might help to detect changes in the
spreading rate and hence whether measures are working.

![Logistic Curve](plot-3.png)

*Max expected total infections:*
|Country | total | in persons per million | 
| --- | ---- | ---- | 
|germany| 43837 | 528.2| 
|italy| 115854 | 1930.9| 
|korea| 7811 | 101.4| 
|spain| 70589 | 1501.9| 
|uk| 16954 | 51.7| 
|us| 143869 | 438.6| 

