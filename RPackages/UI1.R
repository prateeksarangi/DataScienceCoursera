library(shiny)
shinyUI(fliudPage(
  titlePanel("Data Science"),
  sidebarLayout(
    sidebarPanel(
      h3("Sidebar text!!")
    ),
    mainPanel(
      h3("Main penal text")
    )
  )
))