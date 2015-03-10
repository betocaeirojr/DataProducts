library(shiny)
library(shinyapps)
library(UsingR)

childHeight <- function(height){
    #This is a very basic prediction algo
    data(galton)
    # We fit a linear regression model on the galton data, using all that as "training data set"
    fit <- lm(child ~ parent, data=galton)
    
    #Then we create a new data set, containing only the informed parent's height and 
    # use the Linear model to predict the child's height
    predict(fit, newdata=data.frame(parent=height, child=""))
    
}

shinyServer(
    function(input, output) {
        output$inputValue <- renderPrint({input$parentHeight})
        output$prediction <- renderPrint({as.numeric(childHeight(input$parentHeight))})
    }
)



