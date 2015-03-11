library(shiny)
library(shinyapps)

shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Predicting Fuel Consumption"),
        sidebarPanel(
            h2('Please fill in you car information for mpg prediction'),
            numericInput('cylinders', 'Number of Cylinders', 6, min=4, max=8, step=2),
            numericInput('weight', 'Weight in lbs', 3000),
            numericInput('gears', 'Number of Gears', 4, min=4, max=6, step=1),
            numericInput('nhp', 'HP', 200),
            radioButtons('transmission', 'Checkbox',
                               c('Automatic' = 0,
                                 'Manual' = 1))
        ),
        mainPanel(
            h3('Results of prediction'),
            
            h4('The fuel consumption of your car is predicted to be:'),
            verbatimTextOutput("prediction"),
            
            plotOutput('newPairs')
        )
    )
)