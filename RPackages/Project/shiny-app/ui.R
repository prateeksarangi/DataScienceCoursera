# First, let's make sure shiny is loaded.
library(shiny)

shinyUI(fluidPage(
  # Set the title of the page
  titlePanel("Plotting distributions"),
  sidebarLayout(
    sidebarPanel(
      # Going to use radio buttons to let the user select the distribution they want to use.
      # You have three marvelous choices!
      radioButtons("dist", "Select a Distribution:",
                   c("Normal" ="norm",
                     "Uniforn"="unif",
                     "Exponential" = "exp")),
      
      # Now, let's get some user input.
      sliderInput("n", "Number of observations:", value = 5000, min = 10, max = 10000, step = 100),
      sliderInput("bins", "Number of bins:", value = 50, min = 10, max = 200, step = 10),
      sliderInput("mu", "Mean - Only used for Normal Dist.", value = 0, min = -5, max = 5),
      sliderInput("sig", "Standard Deviation - Only used for Normal Dist.", value = 1, min = .01, max = 15)
    ),
    
    # Now, let's display the results.  Using a tab panel to give us two tabs:
    # one tab for the plot itself, one tab for some simple statistics.
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Plot",plotOutput("plot")),
                  tabPanel("Summary",verbatimTextOutput("summary"))
      )
    )
  )
))