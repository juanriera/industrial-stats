Analysis of Means or Variance?

Analysis of Variance (ANOVA) is a statistical method used to test differences between two or more means. It is rather odd that the technique is called “Analysis of Variance” rather than “Analysis of Means”. ANOVA tests the null hypotheses that all the sample means are equal. Unlike t tests, an ANOVA may be used to test for differences among more than 2 groups of sample. If the null hypotheses is rejected, it implies that at least one of the sample’s means is different from others without specifically revealing the one which is different from others. If that information is required then it would be more advisable to conduct Tukey’s Honestly Significantly Different(HSD) test instead of ANOVA, although ANOVA allows for more complex types of analyses as compared to HSD(some of them are discussed below).

ANOVA is based on the two estimates of population variance (σ2), mean square error (MSE) and the mean square between (MSB). MSE is based on differences among scores within the groups and MSB is based on differences among the sample means. MSE estimates σ2 regardless of whether the null hypothesis is true (the sample means are equal). MSB only estimates σ2 if the sample means are equal. If the sample means are not equal, then MSB estimates a quantity larger than σ2. Therefore, if the MSB is much larger than the MSE, then the sample means are unlikely to be equal. On the other hand, if the MSB is about the same as MSE, then the data are consistent with the null hypothesis that the sample means are equal.

We will use the *aov()* function to Fit an Analysis of Variance Model. *aov()* can handle only standard cases — no violation of the assumptions, no missing data — and only displays minimal information — no eﬀect sizes. Looking up the function details in R-help yields: “aov(formula, data = NULL, projections = FALSE, qr = TRUE, contrasts = NULL, …)”, where formula determines the model that will be built and tested by *aov()*. The basic format of such a formula is… *response variable ~ explanatory variables.* The tilde (the symbol between the response and explanatory variables) should be read “is modeled by” or “is modeled as a function of.” For the formula *y ~ x + z,* y is a response while x & z are explanatory variables. The nature of the variables — binary, categorical (factors), numerical — will determine the nature of the analysis. For example, if “x” and “z” are factors then the above formula dictates an analysis of variance (without the interaction term). If they are numerical, the same formula would dictate a multiple regression. If “x” is numerical and “z” is a factor, then an analysis of covariance is dictated. Symbols used as mathematical operators in other contexts do not have their usual mathematical meaning inside model formulae. The following table lists the meaning of these symbols when used in a formula.

![img](https://miro.medium.com/v2/resize:fit:875/1*7AvEVop-QfVvVB_Sx8kZfQ.png)

Figure 1: Meaning of symbols inside formula

The *Error()* term above is probably the most baffling one here. I had to search extensively and read multiple posts before I could make some sense of it, so we will go through its interpretation throught the blog. It is unnecessary in designs that are between subjects or completely randomized. That’s because there is one and only one way to calculate error, which is the variability of scores (subjects) within the treatment cells. R will figure it out. The Error term becomes necessary when there is some restriction on randomization, e.g., when the design includes such features as nesting, blocking, repeated measures, or within subjects factors. Essentially the terms inside *Error(Subj/(A\*B))* can be expanded as *Subj/(A\*B) = Subj + Subj:A + Subj:B + Subj:A:B*

With the help of *aov()* function, we will understand the simplest of all, **one-way ANOVA** first. Take a look at this [data-set ](http://personality-project.org/r/datasets/R.appendix1.data)from the personality project which shows the effect of a drug dosage(a, b & c) on the alertness level of the subject. Three different dosage levels were administered to subjects and their alertness levels were measured. Our aim here is to test if the level of dosage affects the alertness of subjects. Let us dive into R for this. Consider the following model where the first argument is the dependent variable (Alertness ). It is followed by the tilde symbol (~) and the independent variable(s) (Dosage).

```
anovaDosage = aov(Alertness~Dosage,data=dosageData)
```

![img](https://miro.medium.com/v2/resize:fit:498/1*DHNAEA2Jj4y98n5U0GAacA.png)

The summary displayed in Figure 1 shows an MSB of 213.12 and MSE of 24.25, the ratio of the two called the F-ratio is 8.789 which is > 1, indicating the presence of an effect. In other words, given the null hypothesis that dosage levels doesn’t have any effect on the alertness, the *probability value* is 0.00298 and therefore the *null hypothesis* can be rejected which indicates that the dosage levels affects the alertness of subjects. Box-plot of the data reveals the same trend, suggesting that the level of dosage does affect the alertness.

![img](https://miro.medium.com/v2/resize:fit:875/1*_-1kh0M1bPH36FMiZbkifQ.png)

Figure 2: Box plot of Alertness with Level of Dosage

**One way repeated Measures ANOVA** can be used when each participant provides data at multiple time points. The [recall data-set](http://personality-project.org/r/datasets/R.appendix3.data) obtained from the personality project will be used for explaining this. There are five subjects, each exposed to a set of words which were either positive, negative or neutral. The question to be addressed from the data-set is “*if the valence of the word affects the rate at which items are recalled?” Now, s*witch back to R and use the following model. Since this is a repeated measures design, we need to specify an error term that accounts for natural variation from subject to subject. (E.g., I might react a little differently to negative words than you do because I am sad most of the time and sadness is all I can relate to while you are a cheerful person and you are more associated to happiness!) We do this with the `Error()` function: specifically, we are saying that we want to control for that between-participant variation over all of our within-subjects variables. Because Valence is crossed with the random factor Subject (i.e., every subject sees all three types of words), you must specify the error term for Valence , which in this case is Subject by Valence . Do this by adding the term Error(Subject/Valence) to the factor Valence , as shown below.

```
anovaRecall = aov(Recall~Valence+Error(Subject/Valence),recallData)
```

![img](https://miro.medium.com/v2/resize:fit:559/1*oNCTwzWoNgG0_HY0Wwb0Pg.png)

The first source of variation above, refers to the differences between five subjects. If all the subjects had exactly the same mean recall (across the three valences), then the sum of squares for subjects would be zero; the more subjects differ from each other, the larger the sum of squares subjects(105.1 in this case depicted in Figure 3). Valence refers to the differences between the three types of valence. If the means for the three types of valence were equal, the sum of squares would be zero. The larger the difference between means, the larger the sum of squares (2029.7 in this case). The third source of variation reflects the degree to which the effect of type of valence is different for different subjects (42.9). Subject and Valence are our sources of variability. But we are interested in the effect of valence, and not the differences due to subject. This effect of valence type is visible within each subject (i.e. nested within each subject). So the proper error term is “Subject/Valence” , which is read as “valence within subject”. If subjects all responded very similarly to the type of valence, then the error would be very low. Notice that once all that “subject” variability is parceled out, we do have a significant main effect of “valence”. An F-statistics of 189.1 which is >>>1 and a very small p-value indicates that there is a significant effect of valence on the recall rate which is also evident from the Figure 4.

![img](https://miro.medium.com/v2/resize:fit:875/1*gGfVaVcFyCNcgfdy8pZNPQ.png)

Figure 3: Box plot of Recall with Valence

We have considered an example of one-way and within subject ANOVA above. To make matters more complex, let us combine the two and study [this data-set](http://personality-project.org/r/datasets/R.appendix5.data) from the personality project and carry out a **mixed (between and within) designs ANOVA**. It contains the data of an experiment with 18 subjects, 9 males and 9 females. Each subject is given one of three possible dosages of a drug. All subjects are then tested on recall of three types of words (positive, negative and neutral) using two types of memory tasks (cued and free recall). There are thus 2 between-subjects variables: Gender (2 levels) and Dosage (3 levels); and 2 within-subjects variables: Task (2 levels) and Valence (3 levels). For simplicity we will consider the effect of drug dosage (between-participants) and memory task (within-participants) on recall, and ignore the other two variables (i.e. gender and valence). Get the data from the file and run the following analysis. The asterisk (*) indicates to R that the interaction between the two factors is interesting and should be analyzed. If interactions are not important, replace the asterisk with a plus sign (+), as we learned in the formula section above.

```
anovaMixed = aov(Recall~(Task*Dosage)+Error(Subject/Task)+Dosage,data=mixedData)
```

![img](https://miro.medium.com/v2/resize:fit:638/1*CVSqtICVVLvjcS5sPAJ61A.png)

The analysis of between-subjects factors will appear first, followed by the within-subjects factors. F-value > 1 indicates that there is a difference observed, indicating the effect but if p-value > 0.5 then it would mean that the data is not sufficient enough to conclude that there is actually an effect. The summary above suggests that the type of task certainly affects the recall ability of the subjects (with an F=43 and p-value<<<0.05).

![img](https://miro.medium.com/v2/resize:fit:875/1*6L95M8o37tGBOYltyrCa7w.png)

Figure 4: Interaction plots for Dosage and task type

I’d leave the interpretation of interaction plots to you, as this blog has been quite overwhelming because of it’s length and the *Error()* term used for creating the formula for the model. Interpreting the results can be quite deluging as well. Before terminating this session I’d like to post one more fact that aov() can’t be used if there are some missing observations(unbalanced design), in which case either the missing observation should be dropped from the data or lme() be used. I hope this tutorial comes to you in a good spirit and helps you learning more about ANOVA, please don’t be dreaded on seeing it.

Here is a GitHub of all the code used in this blog post -https://github.com/vipin8169/HSE598/blob/master/anova.R

> **References:-**
>
> ANOVA. Retrieved from http://www.statmethods.net/stats/anova.html
>
> Using R for psychological research. Retrieved from http://personality-project.org/r/
>
> SINGLE FACTOR REPEATED MEASURES ANOVA. Retrieved from http://ww2.coastal.edu/kingw/statistics/R-tutorials/repeated.html
>
> HUMAN-COMPUTER INTERACTION INFERENTIAL STATISTICS, PART II. Retrieved from http://hci.cs.wisc.edu/courses/hci/lectures/fall2011/HCI-Week12-Lecture13.pdf
>
> AOV and Error. Retrieved from http://r.789695.n4.nabble.com/AOV-and-Error-td865845.html
>
> Fit an Analysis of Variance Model. Retrieved from https://docs.tibco.com/pub/enterprise-runtime-for-R/1.5.0_may_2013/TERR_1.5.0_LanguageRef/stats/aov.html
>
> MODEL FORMULAE. Retrieved from http://ww2.coastal.edu/kingw/statistics/R-tutorials/formulae.html
>
> Repeated Measures in R. Retrieved from http://www.jason-french.com/tutorials/repeatedmeasures.html
>
> 5 Repeated measures. Retrieved from http://coltekin.net/cagri/R/r-exercisesse5.html
>
> Formulae in R: ANOVA and other models, mixed and fixed. Retrieved from http://conjugateprior.org/2013/01/formulae-in-r-anova/
>
> Online Statistics Education: An Interactive Multimedia Course of Study. Retrieved from http://onlinestatbook.com/2/index.html

Data Science

Statistics

Week12



127







127

## [More from Human Systems Data](https://medium.com/humansystemsdata?source=post_page-----c9ebf7396a1b--------------------------------)

Follow

Human Systems Engineering 598 is a graduate level methods course on data analytics with human subjects data at Arizona State University. The instructor is Dr. Erin Chiou, Assistant Professor of Human Systems Engineering.

![Jacob Willinger](https://miro.medium.com/v2/resize:fill:30:30/0*1Sl777l-y_fsrZdW.)

Jacob Willinger

·Mar 1, 2017

## RSE vs R²

The assigned chapter was heavy and fast on the statistical notation as it guided us through linear regression. I can’t say that I found it easy to digest, but I do appreciate how it began with a framing of the topic through the seven questions (Is there a relationship between…

Machine Learning

4 min read



Share your ideas with millions of readers.

[Write on Medium](https://medium.com/new-story?source=post_page_footer_cta_write-------------------------------------)

------

![Hansol Rheem](https://miro.medium.com/v2/resize:fill:30:30/1*1T2a1j8uBsneA64cVCxRRw.jpeg)

Hansol Rheem

·Mar 28, 2017

## Limitations of the Multiple Regression Model

Can we see the forest for the trees? When examining a phenomenon with multiple causes, will it help us understand the phenomenon if we look at the causes one at a time? Or, is it better when we see the overall pattern created by the multiple causes? For this week…

Data Science

5 min read



![Limitations of the Multiple Regression Model](https://miro.medium.com/v2/da:true/resize:fill:140:140/1*hirMyySKme6pwS3zJ2koCg.gif)

------

![Jacob Willinger](https://miro.medium.com/v2/resize:fill:30:30/0*1Sl777l-y_fsrZdW.)

Jacob Willinger

·Mar 29, 2017

## Regression showdown: R vs SPSS

Straying from a conventional reading this week, our instructions were to work through an exercise on how to run a multiple regression in R, found here: https://www.tutorialspoint.com/r/r_multiple_regression.htm. Per suggestion of our instructor, I used this as an opportunity to compare and contrast the regression process between R and SPSS, focusing…

Machine Learning

5 min read



![Regression showdown: R vs SPSS](https://miro.medium.com/v2/resize:fill:140:140/1*eovAyrVb8JVdd_ljP_QYCw.png)

------

![Eric del Rio](https://miro.medium.com/v2/resize:fill:30:30/1*J-e_wvlhyRDjkkN60S5nDg.jpeg)

Eric del Rio

·Apr 5, 2017

## Comparison of R and SPSS: ANOVA

Hey Folks, If you read my last post on an Attempt at Multiple Regression in R, you may be aware that I recently collected data for my thesis. Since that post, I have spent a substantial amount of time analyzing the data. For this weeks post, I will be talking…

Data Visualization

9 min read



![Comparison of R and SPSS: ANOVA](https://miro.medium.com/v2/resize:fill:140:140/1*p5OrNuhMHDUqTb3-mXlTqg.png)

------

![Jennifer Williams](https://miro.medium.com/v2/resize:fill:30:30/0*dthvWNImz0dcj32S.)

Jennifer Williams

·Apr 5, 2017

## ANOVA with MTCARS

Hello again Human Systems Students! Last week we discussed multiple regression in R using the mtcars dataset. Mtcars tells us about the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models). …

Week12

4 min read



![ANOVA with MTCARS](https://miro.medium.com/v2/resize:fill:140:140/1*87JWuoprU4y7Og3oAHhe_Q.png)

[Read more from Human Systems Data](https://medium.com/humansystemsdata?source=post_page-----c9ebf7396a1b--------------------------------)

![Vipin Verma](https://miro.medium.com/v2/resize:fill:176:176/1*RHQTwv2DPHKUIkWm4MsiVA.jpeg)

[Vipin Verma](https://medium.com/@vverma9?source=---two_column_layout_sidebar----------------------------------)

[14 Followers](https://medium.com/@vverma9/followers?source=---two_column_layout_sidebar----------------------------------)

Follow



## More from Medium

![Data Overload](https://miro.medium.com/v2/resize:fill:25:25/1*mlbJdoiEsSYudaUeCnPMOw.png)

Data Overload

## Lasso Regression

![img](https://miro.medium.com/v2/resize:fill:70:70/g:fp:0.5:0.5/0*pt9nNZTXTMvogjh1)

![Gianluca Malato](https://miro.medium.com/v2/resize:fill:25:25/0*hl6JPDu8FEzvORUS.)

Gianluca Malato

## A beginner’s guide to statistical hypothesis tests

![img](https://miro.medium.com/v2/resize:fill:70:70/g:fp:0.5:0.5/0*2bTtCrjwdKJRc439.png)

![Unbecoming](https://miro.medium.com/v2/resize:fill:25:25/1*_FyD8-JlhRRmfaZnEgCrkA.jpeg)

Unbecoming

## 10 Seconds That Ended My 20 Year Marriage

![img](https://miro.medium.com/v2/resize:fill:70:70/g:fp:0.5:0.5/1*2PEPQ0LxKFELp2lojVF-lw.jpeg)

![Tracyrenee](https://miro.medium.com/v2/resize:fill:25:25/1*6ykVZEgWPQDf2JawK4UZ9A.png)

Tracyrenee

in

MLearning.ai

iframe src="https://accounts.google.com/gsi/iframe/select?client_id=216296035834-k1k6qe060s2tp2a2jam4ljdcms00sttg.apps.googleusercontent.com&amp;ux_mode=popup&amp;ui_mode=card&amp;as=GZy9kTpKJEVsP8Cglepusw&amp;channel_id=669e96351b10fb5d049fb924bfb1937cc16aa0470519ccf9a822aa30de75846d&amp;origin=https%3A%2F%2Fmedium.com" title="Cuadro de diálogo Iniciar sesión con Google" data-dashlane-frameid="243" style="box-sizing: inherit; border: none; width: 391px; height: 204px; overflow: hidden;"></iframe>