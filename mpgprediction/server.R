#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    modelMPG <- lm(mpg ~ factor(am)+ cyl + wt, data=mtcars)
    
    modelMPGPred <- reactive({
        cylInput <- input$sliderCYL
        amInput <- factor(ifelse (input$manualTransmission, 1, 0))
        wtInput <- input$sliderWT/1000
        predict(modelMPG, newdata=data.frame(cyl=cylInput, wt=wtInput, am=amInput))
    })
    
    output$predMPG <- renderText({
        round(modelMPGPred(),digits=2)
    })
    
    
})