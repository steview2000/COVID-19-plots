


# COVID-19-plots

Here is some regularly updated analysis of the COVID-19 outbreak.

Data from: https://github.com/CSSEGISandData/COVID-19

 *UPDATED: Tue 31 Mar 2020 09:17:36 AM CEST*

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
|germany |9.04 days|
|italy |15.53 days|
|korea |76.18 days|
|spain |7.41 days|
|uk |5.37 days|
|us |4.85 days|


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
|germany| 101951 +/- 5289| 1228.3 +/- 63.7|
|italy| 128842 +/- 2027| 2147.4 +/- 33.8|
|korea| 8909 +/- 91| 115.7 +/- 1.2|
|spain| 138627 +/- 5660| 2949.5 +/- 120.4|
|uk| 54931 +/- 5607| 819.9 +/- 83.7|
|us| 264682 +/- 7159| 807.0 +/- 21.8|


## Another fit

As pointed out, the logisitc function represents the data well only, when no interventions are
taken place, or under a complete shutdown. However, it is likely that certain societies decide to
accept a slow, constant increase of cases, small enough for the health systems to deal with. Many
countries, including South Korea show a slow linear increase of the accumulated infections.
Therefore, we also try a fit of the function: I(t) = (a+b*t)/(1+exp(-c*t)) 

![Logist-linear](logistic-linear.png)

