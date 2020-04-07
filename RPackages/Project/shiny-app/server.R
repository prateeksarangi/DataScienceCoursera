# First, let's make sure shiny is loaded.
library(shiny)

shinyServer(function(input, output) {
    # We're going to use reactive data, as we need to gather input from the user.
    # This section determines the selected distribution and sets the distrib variable
    # to the format required for each specific distribution.
    data <- reactive({
        if(input$dist == "unif") {distrib <- runif(input$n)}
        else if(input$dist == "norm") {distrib <- rnorm(input$n,input$mu,input$sig)}
        # Since the user only has 3 options, if all else fails, it's the exponential distribution.
        else {distrib <- rexp(input$n)}
    })
    
    # Let's generate a simple summary of the data.
    output$summary <- renderPrint({
        summary(data())
    })
    
    # Let's plot the data, taking whatever distribution is set and creating a simple histogram.
    output$plot <- renderPlot({
        hist(data(),input$bins,xlab="x",col = "green", border="black")
    })
})