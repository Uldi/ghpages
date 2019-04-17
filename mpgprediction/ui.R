#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("Predict MPG from 3 main car attributes cyl, transmission and weight"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderCYL", "What is the number of cylinders of the car?", 4, 8, value=6, step=2),
            sliderInput("sliderWT", "What is the weight of the car in lbs?", 1500, 5500, value=3000),
            checkboxInput("manualTransmission", "Manual Transmission? (vs. automatic)", value=TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("MPG Prediction", 
                                 h3("Predicted MPG:"),
                                 h4(textOutput("predMPG"))),
                        tabPanel("User Documentation", 
                                 h3("How to use the app"),
                                 br(),
                                 h5("Using the app is really simply. Just select the number of cylinders, the weight in lbs and the transmission type (manual or automatic) and press submit to get the MPG (miles per gallon) prediction"),
                                 h5("Quit easy - right?"))
            )
            
        )
    )
))
