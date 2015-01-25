An Overview of 2012 US Presidental Election by Popular Vote
========================================================
author: Xinran Liu
date: Jan 25, 2015

Outline
========================================================

This Shiny app displays the 2012 US presidental election results across 50 states:

 
 - with interactive map 
 
 - created by function **gvisGeoChart** in  **googleVis** package 
 
A Sample of Dataset
========================================================





```r
head(elect_state)
```

```
       State Total_Votes   Obama  Romney
1     Alaska      220596   91696  121234
2    Alabama     2064699  793620 1252453
3   Arkansas     1062831  391953  643717
4    Arizona     2041519  900081 1107130
5 California    10538656 6241648 4046524
6   Colorado     2419698 1238490 1125391
```


Who Wins Which State?
========================================================

- Choose colors for Obama and Ronmey from the first two selection bars on left-hand side of the page.

- Each State will be displayed in color representing the winning candidate:
 
 -Candidate 1:Obama       
 -Candidate 2:Romney

Overview for Obama/Romney
========================================================

- The third bar provides options of viewing results by *popular vote cast* or *approval rating* . 
 

- You can also move point cousor on map, detailed information of each state will show up dynamically.
