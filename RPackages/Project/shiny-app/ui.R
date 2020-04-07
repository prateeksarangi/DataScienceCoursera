library(shiny)

shinyUI(fluidPage(
  titlePanel("Plotting distributions"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("dist", "Select a Distribution:",
                   c("Normal" ="norm",
                     "Uniforn"="unif",
                     "Exponential" = "exp")),
      
      sliderInput("n", "Number of observations:", value = 5000, min = 10, max = 10000, step = 100),
      sliderInput("bins", "Number of bins:", value = 50, min = 10, max = 200, step = 10),
      sliderInput("mu", "Mean - Only used for Normal Dist.", value = 0, min = -5, max = 5),
      sliderInput("sig", "Standard Deviation - Only used for Normal Dist.", value = 1, min = .01, max = 15),
      submitButton("Submit")
    ),

    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Plot",plotOutput("plot")),
                  tabPanel("Summary",verbatimTextOutput("summary"))
      )
    )
  )
))