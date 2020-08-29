#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# library(shiny)
# 
# # Define server logic required to draw a histogram
# shinyServer(function(input, output) {
# 
#     output$distPlot <- renderPlot({
# 
#         # generate bins based on input$bins from ui.R
#         x    <- faithful[, 2]
#         bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
#         # draw the histogram with the specified number of bins
#         hist(x, breaks = bins, col = 'darkgray', border = 'white')
# 
#     })
# 
# })



library(shiny)

shinyServer(function(input, output) 
{values <- reactiveValues()

## Calculate the Death from COVID-19 in US on a state level    
observe({
  input$action_Calc
  values$death <- 22.1 + 
    0.054 * input$num_positive - 
    0.297 * input$num_positive_increase -
    0.002 * input$num_negative +
    0.059 * input$num_hospitalized +
    0.067 * input$num_hospitalized_current -
    0.183 * input$num_hospitalized_current_increase +
    3.941 * input$num_on_ventilator_current_increase
})

## Display explanatory variables values entered on sidebar

output$text_positive <- 
  renderText({
    input$action_Calc
    paste("Cumulative Positive Tests:", 
          isolate(input$num_positive))
  })

output$text_positive_increase <- 
  renderText({
    input$action_Calc
    paste("Increased Positive Tests from Previous Month:", 
          isolate(input$num_positive_increase))
  })

output$text_negative <- 
  renderText({
    input$action_Calc
    paste("Cumulative Negative Tests:", 
          isolate(input$num_negative))
  })

output$text_hospitalized <- 
  renderText({
    input$action_Calc
    paste("Cumulative Hospitalized Cases:", 
          isolate(input$num_hospitalized))
  })  

output$text_hospitalized_current <- 
  renderText({
    input$action_Calc
    paste("Current Hospitalized Cases:", 
          isolate(input$num_hospitalized_current))
  })

output$text_hospitalized_current_increase <- 
  renderText({
    input$action_Calc
    paste("Increased Hospitalized Cases from Previous Month:", 
          isolate(input$num_hospitalized_current_increase))
  })

output$text_on_ventilator_current_increase <- 
  renderText({
    input$action_Calc
    paste("Increased Current On Ventilator Cases from Previous Month:", 
          isolate(input$num_on_ventilator_current_increase))
  })


## Display calculated values of Estimated Death from COVID-19 based on model formulation
output$text_death <- 
  renderText({
    if(values$death > 0)
      paste(round(values$death))
    else
      "None"
  })
})