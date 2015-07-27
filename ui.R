#developing Data Products Project
library(shiny)

shinyUI(pageWithSidebar( 
  headerPanel("Illustrating markup"), 
  sidebarPanel(
    sliderInput('lambda', 'input the lambda of exponential distribution',
                value = 10, min = 1, max = 20, step = 1),
    sliderInput('n', 'input the sample size',
                value = 5, min = 1, max = 50, step = 1),
    sliderInput('B', 'input the number of random samples to take',
                value = 500, min = 100, max = 1000,step = 1),
    actionButton("go","Simulate Now")
       ), 
  mainPanel(
    plotOutput('newHist'),
    textOutput("summary")
  ) 
))


