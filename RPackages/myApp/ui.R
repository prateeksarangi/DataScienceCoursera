library(shiny)

shinyUI(fluidPage(
    titlePanel("Data Science"),
    sidebarLayout(
        sidebarPanel(
            h3("Sidebar text!!"),
            sliderInput("slider2", "Slider", 0, 100, 0)
        ),
        mainPanel(
            h3("Slider value: "),
            textOutput("text1")
        )
    )
))