
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

# A histogram plots of the types of users by gender.

library(ggplot2)

qplot(x = User.Type, data = ny,
      xlab = 'Type of subscribers',
      ylab = 'Number of subscribers',
      color = I('red'), fill = I('blue')) +
  facet_wrap(~Gender)





## There more male subscribers than females, and the are more customers who did not specify their gender than both males and females.
### Question 2

**What is the summary data of the trip durations by gender?**
qplot(x = Gender, y = Trip.Duration, data = subset(chi, !is.na(Gender)),
      geom = 'boxplot',
      xlab = "Gender",
      ylab = "Trip Duration",
      ylim = c(0,1000))


## Gender neutral clients have a higher median value than both males and females, while females have a higher median that males. For both females and males 75% of their trip durations are below 750 seconds, while for those who are gender neutral is below 875.

by(chi$Trip.Duration, chi$Gender, summary)

ggplot(aes(x=Birth.Year, y=Trip.Duration), data=ny) +
 xlim(1975,2005) + ylim(0,5000) +
  geom_point(alpha=0.05, position = position_jitter(h=0), color='green' ) +
  coord_trans(y='sqrt') +
  geom_line(stat = 'summary', fun.y=mean)

## The average trip duration between the birth years 1975 and 2000 is below a thousand secounds. Clients between the birth years 1980 and 1995 have relative longer trip durations than clients in other years.



by(ny$Trip.Duration, ny$Birth.Year, summary)

system('python -m nbconvert Explore_bikeshare_data.ipynb')
