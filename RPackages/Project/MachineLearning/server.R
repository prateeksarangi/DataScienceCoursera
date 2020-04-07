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
    output$value1 <- renderUI({
        if(input$radio == "1"){
            #output$value1 <- renderPrint("Neural")
            img(src='Fig.png')
            #output$value1 <- renderPrint('Accuracy of the model 92.48%')
        }
        
        else if(input$radio == "2"){
            output$value1 <- renderPrint("Random")
        }
        
        else if(input$radio == "3"){
            output$value1 <- renderPrint("Neive")
        }
    })
    

})
