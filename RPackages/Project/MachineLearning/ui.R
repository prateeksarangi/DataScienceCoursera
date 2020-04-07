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

    # Application title
    titlePanel("Analyse Heart Disease dataset"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            helpText("Choose the Machine Learning Algorithm 
                     you want to iplement of the dataset"),
            radioButtons("radio", label = h3("Radio buttons"),
                         choices = list("Multi-layer Preceptron" = 1, 
                                        "Random Forest" = 2, 
                                        "Neive Baise" = 3),
                         selected = FALSE),
            
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h1("Graph of training the dataset in the specified
               model"),
            uiOutput(outputId = "value1")
        )
    )
))
