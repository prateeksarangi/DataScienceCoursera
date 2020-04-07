library(shiny)

shinyServer(function(input, output) {
    data <- reactive({
        if(input$dist == "unif") {distrib <- runif(input$n)}
        else if(input$dist == "norm") {distrib <- rnorm(input$n,input$mu,input$sig)}
        else {distrib <- rexp(input$n)}
    })
    
    output$summary <- renderPrint({
        summary(data())
    })
    
    output$plot <- renderPlot({
        hist(data(),input$bins,xlab="Data",col = "blue", border="black")
    })
})