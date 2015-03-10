library(shiny)
library(shinyapps)

shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Child's Height Prediction"),
        sidebarPanel(
            numericInput('parentHeight', 'Height in Inches', 80)
            
        ),
        mainPanel(
            h3('Results of prediction'),
            h4('You entered'),
            verbatimTextOutput("inputValue"),
            h4('Which, based on Galton Data and a simple regression model, resulted in a prediction of '),
            verbatimTextOutput("prediction")
        )
    )
)