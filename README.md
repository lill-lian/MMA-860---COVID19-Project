# MMA-860---COVID19-Project
# COVID19 Death (in U.S.) Calculator on Shiny

Package used: Shiny

In the Death Calculator, we aimed to show the relationships between each explanatory variable and the dependent variable, Number of Deaths from COVID-19, in the US by state.

We created two sub-tabs (tabPanel) for the calculator using the Point Estimation linear model to display (renderText) a quick check of the Number of Deaths from COVID-19 in the US on a state level, by calculating the estimation output from the following explanatory variables inputs via function(input, output):
•	Cumulative Positive Tests
•	Increased Positive Tests from Previous Month
•	Cumulative Negative Tests
•	Cumulative Hospitalized Cases
•	Current Hospitalized Cases
•	Increased Hospitalized Cases from Previous Month
•	Increased Current on Ventilator Cases from Previous Month

In the first sub-tab, we included three sections:
•	Display of Explanatory Values Inputs
•	Estimation Results
•	Suggestion to the Estimation model

In the second sub-tab, we documented the model formulation we developed in the Point Estimation phase. In Shiny R, we were able to combine both the calculation results and model documentation together for reference.


## Point Estimate Analysis which is not included in Shiny Calculator files

Point Estimate Analysis – Explanation Model of the Number of Deaths 

Package used: car
We used the Test Test Test (TTT) approach to determine the relationship between various case related variables and the number of deaths from COVID-19 (dependent variable) in the US on a state level. In phase one, we did a regression model that contained numerous variables noted below.  We removed variables that were statistically insignificant (i.e. p-values are greater than alpha of 0.05) from the model as these variables have no effect on predicting the number of deaths from COVID-19.

After removing all the insignificant variables, we re ran the model including only the variables with p-values greater than 0.05.  The final model includes Cumulative Positive Tests, Increased Number of Positive Tests from Previous Month, Cumulative Negative Tests, Cumulative Hospitalized Cases, Current Hospitalized Cases, Increased Number of Hospitalized Cases from Previous Month, and Current Increased Number on Ventilator Cases from Previous Month.  Now, not only are all the p-values statistically significant but we also have the highest adjusted R-squared value of 0.9982. This indicates the fraction of the variation in predicted Number of Deaths from COVID-19 that is accounted for by these explanatory variables are reasonably high.  The final predictive model is as follows.

Deaths from COVID-19 = 22.1 + 0.054 * Positive - 0.297 * Positive Increase - 0.002 * Negative + 0.059 * Hospitalized + 0.067 * Current Hospitalized - 0.183 * Current Hospitalized Increase + 3.941 * Current On Ventilator Increase

# Data Plot

The 1st plot Residuals vs Fitted shows the data plotted are evenly distributed around 0 on the y-axis.  This is okay as the very few residuals are mostly on the right-hand side and relatively shapeless. It also justifies the assumptions of the relationship between the dependent variable Y and the predicted variable Y_bar being linear.  There is also equal variance along the regression line (i.e. homoskedasticity).

The 2nd plot Normal Q-Q have some, but not too many points far away from the diagonal line.  The dependent variable Y is normally distributed by plotting quantities from the distribution against theoretical distribution. It indicates normal distribution and there is likely no normality problem.

The 3rd plot Scale-Location has some appearance of heteroskedasticity. In other words, there is some non-uniform variance in errors throughout the predictor values range because the line is not horizontal from beginning to end. Later we ran a Breusch-Pagan test (ncvTest) which indicated there is no Heteroskedasticity issue in the model.

The 4th plot, Residuals vs Leverage, has dotted red lines and observations outside the dotted red lines in the plot, which means there are some influential cases with high leverage.  We looked into the cases outside of the Cook's distance line (red dotted line) and decided due to the limitation of the dataset, we should keep these outliers because we are using this model to explain the relationship between each variable and the dependent variable, rather than for prediction.

In the final phase, we ran a Breusch-Pagan test to ensure there is no heteroskedasticity in the model.  The p-value of the ncvTest is too large to reject the null hypothesis of homoscedasticity.   
