#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# library(shiny)

# # Define UI for application that draws a histogram
# shinyUI(fluidPage(
# 
#     # Application title
#     titlePanel("Old Faithful Geyser Data"),
# 
#     # Sidebar with a slider input for number of bins
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("bins",
#                         "Number of bins:",
#                         min = 1,
#                         max = 50,
#                         value = 30)
#         ),
# 
#         # Show a plot of the generated distribution
#         mainPanel(
#             plotOutput("distPlot")
#         )
#     )
# ))






library(shiny)

shinyUI(fluidPage(
  titlePanel("Death from COVID-19 Calculator"),
  
  ## Calculator sidebar with default value from data
  
  sidebarLayout(
    sidebarPanel(
      helpText("This calculator estimates the number of death from COVID-19 in US on a state level based on the explanatory variables inputs below."),
      
      br(),
      numericInput("num_positive",
                   label = h6("Enter the cumulative number of positive tests:"),
                   value = 180458),
      numericInput("num_positive_increase",
                   label = h6("Enter the increase in positive tests from previous month:"),
                   value = 9946),
      numericInput("num_negative",
                   label = h6("Enter the cumulative negative tests in the state:"),
                   value = 260522),
      numericInput("num_hospitalized",
                   label = h6("Enter the cumulative hospitalized cases:"),
                   value = 33244),
      numericInput("num_hospitalized_current",
                   label = h6("Enter the current number of hospitalized cases:"),
                   value = 18654),
      numericInput("num_hospitalized_current_increase",
                   label = h6("Enter the increase in current number of hospitalized cases from previous month:"),
                   value = 85),
      numericInput("num_on_ventilator_current_increase",
                   label = h6("Enter the increase in current number of cases on ventilator from previous month:"),
                   value = 0),
      br(),
      br(),
      actionButton("action_Calc", label = "Refresh")
    ),
    
    
    ## Calculator Results sub-tab
    
    mainPanel(
      tabsetPanel(
        tabPanel("Estimated Number of Death from COVID-19 in US on a state level",
                 
                 ## Inputs Summary
                 p(h4(strong("Explanatory Values Inputs:"))),
                 
                 textOutput("text_positive"),
                 br(),
                 
                 textOutput("text_positive_increase"),
                 br(),
                 
                 textOutput("text_negative"),
                 br(),
                 
                 textOutput("text_hospitalized"),
                 br(),
                 
                 textOutput("text_hospitalized_current"),
                 br(),
                 
                 textOutput("text_hospitalized_current_increase"),
                 br(),
                 
                 textOutput("text_on_ventilator_current_increase"),
                 
                 
                 ## Calculation Outputs
                 br(),
                 br(),
                 p(h3(strong("Estimated Number of Death from COVID-19 in US on a state Level:"))),
                 h4(strong(textOutput("text_death"))),
                 
                 
                 ## Suggestion to improve model accuracy
                 br(),
                 br(),
                 p(h4(strong("Suggestion:"))),
                 p(h5("The number of death cases that were on ventilator are not available, which may have influence on the predictive values hence improve estimation accuracy."))
        ),
        
        
        
        ## Documentation sub-tab
        
        tabPanel("Predictive Formulation & Reference",
                 
                 p(h4(strong("Death from COVID-19 Estimation Calculator:"))),
                 
                 helpText(h5(
                   "This calculator does an estimation on the number of death from COVID-19 in US on a state level.")),
                 
                 ## Formulation from linear regression model
                 br(),
                 HTML("<u><b>Predictive Formulation: </b></u>
                         
                         <br><br>
                         <strong> Deaths from COVID-19 = 
                         <br>
                         22.1 + 
                         <br>
                         0.054 * Postive - 0.297 * Positive Increase - 0.002 * Negative +
                         <br>
                         0.059 * Hospitalized + 0.067 * Current Hospitalized - 0.183 * Current Hospitalized Increase + 3.941 * Current On Ventilator Increase
                         </strong> <br> <br> 
                         
                         where: 
                         <br> <br>
                         Positive = Cumulative Positive Tests 
                         <br> <br>
                         Positive Increase = Increased Positive Tests from Previous Month
                         <br> <br>
                         Negative = Cumulative Negative Tests 
                         <br> <br>
                         Hospitalized = Cumulative Hospitalized Cases
                         <br> <br>
                         Current Hospitalized = Current Hospitalized Cases
                         <br> <br>
                         Current Hospitalized Increase = Increased Hospitalized Cases from Previous Month
                         <br> <br> 
                         Current On Ventilator Increase = Increased Current On Ventilator Cases from Previous Month"
                 )
        )
      )
    )
  )
)
)