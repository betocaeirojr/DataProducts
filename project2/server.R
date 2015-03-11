library(shiny)
library(shinyapps)

fuelConsumptionPrediction <- function(cylinder, weight, transmission, horsepower, gears ){
    # For prediction we are using the mtcars dataset
    data(mtcars)
    
    # We are also using a linear regression model, considering 
    # mpg as predicted by number of cylinders, type of transmission, weight, hp and number of gears
    fitLRM <- lm(mpg ~ cyl + wt + am + hp + gear, data=mtcars)
    
    #Now we use the function parameters to build a new dataset to predict upon
    nds <- data.frame(mpg ='0', 
                      cyl=cylinder, 
                      wt = weight/1000, 
                      am=as.numeric(transmission),
                      hp=horsepower,
                      gear=gears)
    
    predict(fitLRM, newdata=nds)
}

shinyServer(
    
    
    function(input, output) {
        
        output$prediction <- renderPrint(
            {as.numeric(fuelConsumptionPrediction(input$cylinders, 
                                                  input$weight, 
                                                  input$transmission,
                                                  input$nhp,
                                                  input$gears))})
        
        output$newPairs <- renderPlot({pairs(subset(mtcars, select=c(mpg, cyl, hp, wt, am, gear)))})
    }
    
)