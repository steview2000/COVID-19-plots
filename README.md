


# COVID-19-plots

Here is some regularly updated analysis of the COVID-19 outbreak.

Data from: https://github.com/CSSEGISandData/COVID-19

 *UPDATED: Sat 04 Apr 2020 12:52:22 PM CEST*

Data are provided for number of the number of _cumulated infected_, _recovered_ and _deceased_ patients.

## Currently infected

Let's first have a look at the currently sick people, i.e., the cumulated infected people minus the
deaths and recovered patients. This number is certainly important for the health systems and thus we
normalise them by the population. Not that this normalisation is still not sufficient, e.g., when
the infections mainly occur in a rather small area of a countr. We plot the number of normalised by the population of ad given country (in person per millions - ppm).

![Currently sick](curr-sick.png)


## The growth rate of infection

We first consider the number of infected people. With a constant infection rate and an infinite
reservoir of _infectable_ people. This number should grow initially nearly exponentially without
proper countermeasures. We plot the data on a linear x-axis and a logarithmic y-axis. In this way an exponential growth of the infections shows up as straight lines. 

![Exponential development](poly-exp-fit.png)

We see in the top figure, the infection data for 6 different countries. Most of them do not show
straight lines over the entire range. We calculate the relative infection rate from smoothed and
interpolated infection data in order to remove the scatter of the data. 

*Infection rates doubled in :*
|Country | days until doubling of infections| 
| --- | --- |
|germany |9.16 days|
|italy |17.44 days|
|spain |10.64 days|
|france |9.27 days|
|sweden |6.84 days|
|us |5.50 days|


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

![Logistic Curve](logistic-curve.png)

Top: Data with logistic curve fits. 
Bottom: The derivative of the logistic curve (i.e., the daily increases) as lines, and the real
increases as data points.

*Max expected total infections:*
|Country | total | in persons per million | 
| --- | ---- | ---- |
|germany| 116418 +/- 3431| 1402.6 +/- 41.3|
|italy| 136558 +/- 1502| 2276.0 +/- 25.0|
|spain| 152826 +/- 2831| 3251.6 +/- 60.2|
|france| 101689 +/- 4162| 1517.7 +/- 62.1|
|sweden| 27950 +/- 13065| 2795.1 +/- 1306.5|
|us| 428269 +/- 16309| 1305.7 +/- 49.7|


## Another fit

As pointed out, the logisitc function represents the data well only, when no interventions are
taken place, or under a complete shutdown. However, it is likely that certain societies decide to
accept a slow, constant increase of cases, small enough for the health systems to deal with. Many
countries, including South Korea show a slow linear increase of the accumulated infections.
Therefore, we also try a fit of the function: I(t) = (a+b*t)/(1+exp(-c*t)) 

![Logist-linear](logistic-linear.png)

