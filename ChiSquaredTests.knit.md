---
title: "Chi-squared Tests"
---

<script type="text/javascript">
 function showhide(id) {
    var e = document.getElementById(id);
    e.style.display = (e.style.display == 'block') ? 'none' : 'block';
 }
</script>




----

Association testing for two qualitative variables with at least two levels to each variable. 

----

### Chi-squared Test of Independence {.tabset .tabset-pills .tabset-fade}

<table>
<tr>
<td style="vertical-align:top;width:20%;">
<div style="float:left;width:125px;" align=center>
<img src="./Images/QualYQualX.png" width=58px;>
</div>
</td>
<td style="vertical-align:top;width:80%;">

#### Overview

A method of comparing observed counts to the expected counts in a contingency table to decide if two qualitative variables are associated (alternative hypothesis) or are independent, i.e., not associated (null hypothesis).

Typically, all expected counts are required to be 5 or greater for the test to be appropriate. However, the test is still appropriate if all expected counts are at least 1 and the average of the expected counts is at least 5.

----


#### R Instructions

**Console** Help Command: `?chisq.test()`

##### To Run the Test

`chisq.test(x)`

`x` must be a table or a matrix.


###### To Make a Table

If you have a data set that you want to turn into a table, use the table command.      
      
<a href="javascript:showhide('table')">
<div class="hoverchunk">
<span class="tooltipr">
x
  <span class="tooltiprtext">The name of your created table to go in the `chisq.test()` code.</span>
</span><span class="tooltipr">
&nbsp;<-&nbsp;
  <span class="tooltiprtext">This is the "left arrow" assignment operator that stores the results of your `table()` code into `x`.</span>
</span><span class="tooltipr">
table(
  <span class="tooltiprtext">table is an R function used to tabulate how many times each value occrus in a given dataset.</span>
</span><span class="tooltipr">
Dataset\$FirstVariable,
  <span class="tooltiprtext">Use your dataset to call in a row variable.</span>
</span><span class="tooltipr">
&nbsp;Dataset\$SecondVariable)
  <span class="tooltiprtext">Use your dataset to call in a column variable.</span>
</span>
</div>
</a>    
    
<div id="table" style="display:none;">


``` r
x <- table(mtcars$am, mtcars$cyl)
pander(x)
```


---------------------
 &nbsp;   4   6   8  
-------- --- --- ----
 **0**    3   4   12 

 **1**    8   3   2  
---------------------

``` r
#Rename rows and columns of your table:
rownames(x) <- c("Automatic", "Manual")
colnames(x) <- c("4 cyl", "6 cyl", "8 cyl")
pander(x)
```


---------------------------------------
    &nbsp;       4 cyl   6 cyl   8 cyl 
--------------- ------- ------- -------
 **Automatic**     3       4      12   

  **Manual**       8       3       2   
---------------------------------------

</div>
<span style="font-size:.8em;">*Click open the example code above for details on how to rename rows and columns in a table.*</span>

<br/>

###### To Make a Matrix

If you have tally counts of your observations, enter them into RStudio using a matrix.
      
<a href="javascript:showhide('matrix1')">
<div class="hoverchunk">
<span class="tooltipr">
x
  <span class="tooltiprtext">The name of your created matrix to go in the `chisq.test()` code.</span>
</span><span class="tooltipr">
&nbsp;<-&nbsp;
  <span class="tooltiprtext">This is the "left arrow" assignment operator that stores the results of your `cbind()` code into `x`.</span>
</span><span class="tooltipr">
cbind(
  <span class="tooltiprtext">cbind stands for"column bind" and is a function that joins together different c() vectors to make them become columns of a table.</span>
</span><span class="tooltipr">
\`Farm 1\` = 
  <span class="tooltiprtext">The name of the first column you  want in the matrix. To include spaces in the name, use the back-ticks \` and \`.</span>
</span><span class="tooltipr">
&nbsp;c(Pigs = 10, Cats = 5, Dogs = 28, Roosters = 3),
  <span class="tooltiprtext">Specify each of the values by name in a c(...) function to be stored in your first column, in this case, `Farm 1`.</span>
</span><span class="tooltipr">
&nbsp;\`Farm 2\` = 
  <span class="tooltiprtext">The name of the second column you  want in the matrix.</span>
</span><span class="tooltipr">
&nbsp;c(Pigs = 15, Cats = 3, Dogs = 8, Roosters = 1)
  <span class="tooltiprtext">Each new column must contain entries for each named element. Technically, you can leave off the names in all but the first column as only the names from the first column will be used.</span>
</span><br/><span class="tooltipr">
pander(x)
  <span class="tooltiprtext">Print the matrix to the screen using pander(...).</span>
</span>
</div>
</a>

<div id="matrix1" style="display:none;">


--------------------------------
    &nbsp;      Farm 1   Farm 2 
-------------- -------- --------
   **Pigs**       10       15   

   **Cats**       5        3    

   **Dogs**       28       8    

 **Roosters**     3        1    
--------------------------------

</div>

Or, notice how you could rbind instead with slightly different results...
      
<a href="javascript:showhide('matrix2')">
<div class="hoverchunk">
<span class="tooltipr">
x
  <span class="tooltiprtext">The name of your created matrix to go in the `chisq.test()` code.</span>
</span><span class="tooltipr">
&nbsp;<-&nbsp;
  <span class="tooltiprtext">This is the "left arrow" assignment operator that stores the results of your `cbind()` code into `x`.</span>
</span><span class="tooltipr">
rbind(
  <span class="tooltiprtext">rbind stands for"row bind" and is a function that joins together different c() vectors to make them become rows of a table.</span>
</span><span class="tooltipr">
\`Farm 1\` = 
  <span class="tooltiprtext">The name of the first column you  want in the matrix. To include spaces in the name, use the back-ticks \` and \`.</span>
</span><span class="tooltipr">
&nbsp;c(Pigs = 10, Cats = 5, Dogs = 28, Roosters = 3),
  <span class="tooltiprtext">Specify each of the values by name in a c(...) function to be stored in your first column, in this case, `Farm 1`.</span>
</span><span class="tooltipr">
&nbsp;\`Farm 2\` = 
  <span class="tooltiprtext">The name of the second column you  want in the matrix.</span>
</span><span class="tooltipr">
&nbsp;c(Pigs = 15, Cats = 3, Dogs = 8, Roosters = 1)
  <span class="tooltiprtext">Each new column must contain entries for each named element. Technically, you can leave off the names in all but the first column as only the names from the first column will be used.</span>
</span><br/><span class="tooltipr">
pander(x)
  <span class="tooltiprtext">Print the matrix to the screen using pander(...).</span>
</span>
</div>
</a>

<div id="matrix2" style="display:none;">


--------------------------------------------
   &nbsp;     Pigs   Cats   Dogs   Roosters 
------------ ------ ------ ------ ----------
 **Farm 1**    10     5      28       3     

 **Farm 2**    15     3      8        1     
--------------------------------------------

</div>
    
    

<br/>

##### Diagnostics 


<a href="javascript:showhide('chisq')">
<div class="hoverchunk">
<span class="tooltipr">
yourNamedTestResults
  <span class="tooltiprtext">This is some name you come up with that will become the R object that stores the results of your Chi-squated test `chisq.test()` command.</span>
</span><span class="tooltipr">
&nbsp;<-&nbsp;
  <span class="tooltiprtext">This is the "left arrow" assignment operator that stores the results of your `chisq.test()` code into `yourNamedTestResults`.</span>
</span><span class="tooltipr">
chisq.test(
  <span class="tooltiprtext">`chisq.test()` is an R function that stands for "Chi-Squared Test". It performs the Chi-squared test for `x`.</span>
</span><span class="tooltipr">
x)
  <span class="tooltiprtext">`x` is either a matrix or a table.</span>
</span>
</div>
</a>  

<div id="chisq" style="display:none;">

<table class="rconsole">
<tr>
<td>
<span class="tooltiprout">
 Pearson's Chi-squared test
    <span class="tooltiprouttext">The name of the test being performed.</span>
</span>
</td>
</tr>
</table>
<br/>

<table class="rconsole">
<tr>
<td>
  <span class="tooltiprout">
    data:  x
      <span class="tooltiprouttext">The data you are using for the Chi-Squared test. `x` is either a table or matrix that you created.</span>
</td><td>
  <span class="tooltiprout">
    X-squared = 9.2956,
      <span class="tooltiprouttext">The test statistic of the test follows a chi-squared distribution with the given degrees of freedom. See the end of the "Making Inference" page of the book to learn more about the Chi-squared Parametric Distribution.</span>
</td><td>
  <span class="tooltiprout">
    &nbsp;df = 3,
      <span class="tooltiprouttext">The degrees of freedom of the test. It is found by (number of rows - 1)x(number of columns - 1)</span>
</td><td>
  <span class="tooltiprout">
    &nbsp;p-value = 0.02561
      <span class="tooltiprouttext">The p-value of the test is found by computing the probability of being more extreme than given test statistic. In R, you can compute this yourself using the code pchisq(9.2956, 3, lower.tail=FALSE).</span>
</td>
</tr>
</table>

</div>

<a href="javascript:showhide('expected')">
<div class="hoverchunk">
<span class="tooltipr">
yourNamedTestResults
  <span class="tooltiprtext">This is some name you come up with that will become the R object that stores the results of your Chi-squared test `chisq.test()` command.</span>
</span><span class="tooltipr">
\$
  <span class="tooltiprtext">This allows you to access various elements from the test that was performed.</span>
</span><span class="tooltipr">
expected
  <span class="tooltiprtext">The expected counts of the chi-squared test. These are computed for each observed count by using the equation (row tota)*(column total)/(total total).</span>
</span>
</div>
</a> 

<div id="expected" style="display:none;">

<table class="rconsole">
<tr>
<td align="left"></td>
<td align="right">
  <span class="tooltiprout">
    Pigs
      <span class="tooltiprouttext">EXPLANATION.</span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; Cats
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>    
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; Dogs 
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; Roosters
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><tr>
<td align="left">
  <span class="tooltiprout">
    Farm 1
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; 15.753425
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; 5.041096
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    22.68493
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    2.520548
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td>
</td>
</tr><tr>
<td align="left">
  <span class="tooltiprout">
    Farm 2
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; 9.246575
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; 2.958904
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    13.31507
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    1.479452
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td>
</td>
</tr>
</table>

</div>

<br/>

##### Interpretation: Pearson Residuals

<a href="javascript:showhide('residuals')">
<div class="hoverchunk">
<span class="tooltipr">
yourNamedTestResults
  <span class="tooltiprtext">This is some name you come up with that will become the R object that stores the results of your Chi-squated test `chisq.test()` command.</span>
</span><span class="tooltipr">
\$
  <span class="tooltiprtext">This allows you to access various elements from the test that was performed.</span>
</span><span class="tooltipr">
residuals
  <span class="tooltiprtext">This grabs the residuals for each observation in the Chi-squared test.</span>
</span>
</div>
</a> 

<div id="residuals" style="display:none;">

<table class="rconsole">
<tr>
<td align="left"></td>
<td align="right">
  <span class="tooltiprout">
    Pigs
      <span class="tooltiprouttext">EXPLANATION.</span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; Cats
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>    
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; Dogs 
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; Roosters
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><tr>
<td align="left">
  <span class="tooltiprout">
    Farm 1
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; -1.449569
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; -0.01830357
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    1.115938
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    0.3019936
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td>
</td>
</tr><tr>
<td align="left">
  <span class="tooltiprout">
    Farm 2
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; 1.892065
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    &nbsp; 0.02389092
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    -1.456589
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td><td align="right">
  <span class="tooltiprout">
    -0.3941801
      <span class="tooltiprouttext">EXPLANATION.</span>
  </span>
</td>
</td>
</tr>
</table>

</div>

----



#### Explanation

To demonstrate the theory behind the Chi-squared Test, consider the following data about the survival of the Titanic passengers as a specific example. The rows of the following contingency table (a table of counts) show the **Class** of the passenger, while the columns show the **Survival** of the passenger. Note that each passenger is placed in exactly one **Class** and one level of **Survival**. Also, the two factors, **Class** and **Survival**, are qualitative variables with at least two levels. Thus, the data meets the basic requirements of the Chi-squared Test.

<div style="padding-left:15%; padding-right:15%;">


|     |  No| Yes|
|:----|---:|---:|
|1st  | 122| 203|
|2nd  | 167| 118|
|3rd  | 528| 178|
|Crew | 673| 212|

</div>



##### The Hypotheses

The hypotheses of the Chi-squared Test are written as verbal statements.

$H_0$: The row variable and column variable are independent.

$H_a$: The row variable and column variable are associated (not independent).

For the Titanic data, these hypotheses would be written as

$H_0$: Class and Survival are independent.

$H_a$: Class and Survival are associated.


##### The Model

Recall that to obtain a $p$-value for a hypothesis test two things are required, 1) a test statistic, and 2) the distribution of the test statistic under the null hypothesis. 

The test statistic for the Chi-squared Test is given by the formula
$$
  \chi^2 = \sum_{i=1}^m \frac{(O_i - E_i)^2}{E_i}
$$
where $O_i$ represents each of the $m$ observed counts and $E_i$ represents the $m$ expected counts. 

Note that $m = r\times c$, were $r$ represents the number of rows in the contingency table and $c$ represents the number of columns. 

The expected counts are obtained by the formula
$$
  E_i = \frac{\text{(row total)(column total)}}{\text{(total total)}}
$$

The $\chi^2$ test statistic can be assumed to follow a [chi-squared distribution](MakingInference.html#chisquared) with degrees of freedom $p = (r-1)\times(c-1)$ as long as the distribution of counts meets either of the following requirements.

* All expected counts are greater than five.

OR

* All expected counts are greater than one, and the average of the expected counts is at least five.



###### Where the $\chi^2$ statistic Comes From

<div style="padding-left:15px;">

Consider the following graphic of the Titanic data. The data suggests that **Survival** of passengers appears to be associated with the **Class** of the passenger (the alternative hypothesis). This is due to the fact that more 1st class passengers survived than perished but far more 3rd class and Crew members perished than survived. It seems that the chances of survival were much greater for the 1st and 2nd class passengers than the 3rd class and Crew. Thus, survival appears to be associated with class.

<img src="ChiSquaredTests_files/figure-html/unnamed-chunk-6-1.png" width="672" />

If the null hypothesis were true for the Titanic data, then we would expect to see roughly the same percentage of survival across all classes. In other words, if **Class** and **Survival** were independent, we would expect to see plots more like the theoretical ones depicted below. 

<img src="ChiSquaredTests_files/figure-html/unnamed-chunk-7-1.png" width="672" />

The theoretical plot above depicts the expected counts for each **Class** and **Survival** combination. To see where these expected counts come from, note that there are a total of 2,201 passengers recorded for the Titanic data (the sum of all values in the table). Further, there are a total of $122+203 = 325$ passengers that were 1st class, $167 + 118 = 285$ passengers in 2nd class, $528 + 178 = 706$ passengers in 3rd class, and $673 + 212 = 885$ Crew members. Thus, we have the following percentage of each class of passenger. Note that these percentages were obtained by taking the row totals and dividing them by the "total total".

<div style="padding-left:25%; padding-right:35%;">


|Class | Percentage|
|:-----|----------:|
|1st   |  0.1476602|
|2nd   |  0.1294866|
|3rd   |  0.3207633|
|Crew  |  0.4020900|

</div>

Thus, if the null hypothesis is true, we would "expect" these percentages to remain consistent across both categories of **Survival**. Since there were $122+167+528+673 = 1490$ passengers that did not survive and $203+118+178+212 =711$ passengers that survived, we have the following expected counts. The counts under **Survived** were obtained by multiplying the number of passengers that survived, $711$ by each of the percentages for the different classes. The counts under **Perished** were obtained by multiplying the number of passengers that perished, $1,490$ by each of the percentages for the different classes.

<div style="padding-left:20%; padding-right:30%;">


|Class | Percentage|  Survived| Perished|
|:-----|----------:|---------:|--------:|
|1st   |  0.1476602| 104.98637| 220.0136|
|2nd   |  0.1294866|  92.06497| 192.9350|
|3rd   |  0.3207633| 228.06270| 477.9373|
|Crew  |  0.4020900| 285.88596| 599.1140|

</div>

Notice that the above process followed the procedure of dividing the row totals by the total total and then multiplying that percentage to the column totals. Because the order of multiplication and division does not matter, we can phrase this as (row total)(column total) / (total total). These provide the counts we would expect if the null hypothesis were true.

When the observed counts differ dramatically from the expected counts, we will reject the null hypothesis. To measure how dramatically the observed counts differ from the expected counts we use the formula
$$
  \chi^2 = \sum_{i=1}^m \frac{(O_i - E_i)^2}{E_i}
$$
which is the formula that was stated previously. Notice that $\chi^2$ will become large when the observed counts differ dramatically from the expected counts, and will be relatively small when the expected counts and observed counts are similar. 

The $p$-value for the $\chi^2$ statistic can be calculated using a chi-squared distribution with degrees of freedom equal to the product of (the number of rows - 1) and (the number of columns - 1).

</div>


##### Interpretation

If the null hypothesis is true, then the interpretation is simple, the two variables are independent. End of story. However, when the null hypothesis is rejected and the alternative is concluded, it becomes interesting to interpret the results because all we know now is that the two variables are somehow associated. 

One way to interpret the results is to consider the individual values of 
$$
  \frac{(O_i-E_i)^2}{E_i}
$$
which, when square-rooted are sometimes called the Pearson residuals. 
$$
  \sqrt{\frac{(O_i-E_i)^2}{E_i}} =   \frac{(O_i-E_i)}{\sqrt{E_i}}
$$


The Pearson residuals allow a quick understanding of which observed counts are responsible for the $\chi^2$ statistic being large. They also show the direction in which the observed counts differ from the expected counts.

For the Titanic data the Pearson residuals are given in the following table. Note that the most dramatic depatures in the observed counts (from the expected counts) were for the 1st Class survivors (Pearson residual = 9.566) and the 1st class passengers that perished (Pearson residual = -6.608). These tell us that far more 1st class passengers survived than we would have expected and far fewer perished than we expected. The next interesting scenario is for the Crew members, where more than expected perished and fewer than expected survived. A similar story to a lesser degree is true for the 3rd class passengers. The 2nd class passengers were similar to the 1st class passengers (more survived and less perished than expected) but to a far lesser degree. 

<div style="padding-left:20%; padding-right:30%;">


|     |        No|       Yes|
|:----|---------:|---------:|
|1st  | -6.607873|  9.565772|
|2nd  | -1.867159|  2.702959|
|3rd  |  2.289965| -3.315027|
|Crew |  3.018611| -4.369840|

</div>

----

###

</td>
</tr>
</table>

<div style="padding-left:125px;">
**Examples**: [movies](./Analyses/Chi Squared Tests/Examples/movies.html) | [StudentRatings](./Analyses/Chi Squared Tests/Examples/Math325StudentRatings.html) | [HairEyeColor](./Analyses/Chi Squared Tests/Examples/HairEyeColorChiSquaredTest.html)
</div>

----





### Nonparametric Chi-squared Test {.tabset .tabset-pills .tabset-fade}

<table>
<tr>
<td style="vertical-align:top;width:20%;">
<div style="float:left;width:125px;" align=center>
<img src="./Images/QualYQualX.png" width=58px;>
</div>
</td>
<td style="vertical-align:top;width:80%;">

#### Overview

The test to perform when all observed counts are at least 1. The hypotheses and interpretation are the same as the Chi-Squared Test of Independence. The distribution of the test statistic is calculated in a nonparametric way.

----

#### R Instructions

**Console** Help Command: `?chisq.test()`

<a href="javascript:showhide('chisq.test2')">
<div class="hoverchunk">
<span class="tooltipr">
chisq.test(
  <span class="tooltiprtext">`chisq.test()` is an R function that stands for "Chi-Squared Test". It performs the Chi-squared test for `x`.</span>
</span><span class="tooltipr">
x,
  <span class="tooltiprtext">`x` is either a matrix or a table.</span><span class="tooltipr"></span>
</span><span class="tooltipr">
simulate.p.value=TRUE)
  <span class="tooltiprtext">EXPLANATION.</span>
</span>
</div>
</a> 

<div id="chisq.test2" style="display:none;">

<table class="rconsole">
<tr>
<td>
<span class="tooltiprout">
Pearson's Chi-squared test with simulated p-value (based on 2000 replicates)
    <span class="tooltiprouttext">EXPLANATION.</span>
</span>
</td>
</tr>
</table>
<br/>

<table class="rconsole">
<tr>
<td>
  <span class="tooltiprout">
    data:  x
      <span class="tooltiprouttext">The data you are using for the Chi-Squared test. `x` is either a table or matrix that you created.</span>
</td><td>
  <span class="tooltiprout">
    X-squared = 9.2956,
      <span class="tooltiprouttext">EXPLANATION.</span>
</td><td>
  <span class="tooltiprout">
    &nbsp;df = NA,
      <span class="tooltiprouttext">EXPLANATION.</span>
</td><td>
  <span class="tooltiprout">
    &nbsp;p-value = 0.02799
      <span class="tooltiprouttext">EXPLANATION.</span>
</td>
</tr>
</table>

</div>

----

#### Explanation

The nonparametric chi-squared test is very similar to the chi-squared test. The hypotheses, expected counts, and test statistic are all exactly the same as the chi-squared test. The only difference is that the test statistic is not assumed to follow a parametric chi-squared distribution.

##### The Hypotheses

$H_0$: The row variable and column variable are independent.

$H_a$: The row variable and column variable are associated.


##### The Model

The test statistic for the Nonparametric Chi-squared Test is the same as the Chi-Squared Test.
$$
  \chi^2 = \sum_{i=1}^m \frac{(O_i - E_i)^2}{E_i}
$$
where $O_i$ represents each of the $m$ observed counts and $E_i$ represents the $m$ expected counts. 

Note that $m = r\times c$, were $r$ represents the number of rows in the contingency table and $c$ represents the number of columns. 

The expected counts are also still obtained by the formula
$$
  E_i = \frac{\text{(row total)(column total)}}{\text{(total total)}}
$$

However, the $\chi^2$ test statistic is no longer assumed to follow a [chi-squared distribution](../ParametricDistributions.html#chisquared). Instead, a nonparametric distribution of the $\chi^2$ test statistic is generated using the following logic using the assumption that the null hypothesis is true. This is how it works.

##### Calculating the P-Value

If the null hypothesis of a Chi-squared Test is true, then the row variable and the column variable are independent. This means that the probability of a certain level of the column variable occurring is the same in all rows. This is the driving idea behind the method of the Nonparametric Chi-squared Test. 

**Step 1**: Randomly reassign values in each row to a different column so that they are somewhat close to the original expected counts, but random. In other words, try to mimic a possible outcome for what would have happened if the row variable and column variable really were independent.

<div style="padding-left:15px;">

For the Titanic data, it would look something like this.

<div style="color:#EE7942;">

<span style="font-size:.8em;">
*Remember, this is not the actual data, it is a randomly made up version of the Titanic data that reflects what we might have observed if Survival was actually independent of Class.*
</span>


|     | Yes|  No|
|:----|---:|---:|
|1st  | 113| 212|
|2nd  |  86| 199|
|3rd  | 243| 463|
|Crew | 277| 608|

</div>
</div>

**Step 2**: Perform a Chi-squared Test of Independence of the rearranged data and record the value of the $\chi^2$ test statistic.

<div style="padding-left:15px;">

For the made up data above, the Chi-squared Test of Independence gives the test statistic of

<div style="color:#EE7942;">

$$\chi^2 = 3.1953669$$

</div>
</div>

**Step 3**: Repeat the process thousands of times, always keeping track of the $\chi^2$ value from each test.

<div style="padding-left:15px;">

For 2,000 made up versions of the Titanic data (each similar to the orange table in **Step 1**), the 2,000 corresponding test statistics are summarized in the histogram below.


<img src="ChiSquaredTests_files/figure-html/unnamed-chunk-12-1.png" width="672" />

</div>

**Step 4**: Calculate the number of $\chi^2$ statistics (from the thousands of simulated data sets) that are as extreme or more extreme than the original test statistic observed for the real data. Add 1 to this value (to avoid the possibility of getting a p-value of 0) and then divide by the number of test statistics that were simulated to get the p-value of the Nonparametric Chi-squared Test.

<div style="padding-left:15px;">

For the Titanic data, the original Chi-squared Test statistic was $190.4011036$. Notice that this statistic is dramatically larger than all of the test statistics that were simulated under the assumption that the null hypothesis was true. (See the histogram in **Step 3** to see that no simulated test statistic was above 20, and very few were higher than 15!) Thus, for the Titanic data, no simulated test statistics were as extreme or more extreme than the observed test statistic. We add 1 to this, and divide by 2,000 to get that the p-value = $(0 + 1)/2000 = 0.00005$. This is sufficient evidence to reject the null hypothesis.

</div>


##### Interpretation

The interpretation of the Nonparametric Chi-squared Test is exactly the same as the Chi-squared Test. The only difference is in the calculation of the p-value. Fortunately, most software will automatically perform the Nonparametric Chi-squared Test, so all of the above calculations will be performed automatically. 


----

###

</td>
</tr>
</table>

<div style="padding-left:125px;">
**Examples**: [Cowlick](./Analyses/Chi Squared Tests/Examples/CowlickNonparChiSquare.html) 
</div>

----

<footer></footer>
