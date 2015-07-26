#developing Data Products Project
library(shiny)

shinyUI(pageWithSidebar( 
  headerPanel("Illustrating markup"), 
  sidebarPanel(
    sliderInput('lambda', 'input the lambda of exponential distribution',value = 10, min = 1, max = 20, step = 1,),
    sliderInput('n', 'input the number of the exponential distribution',value = 40, min = 20, max = 60, step = 1,),
    sliderInput('B', 'input the time of the Bootstraping',value = 500, min = 100, max = 1000, step = 1,)
       ), 
  mainPanel(
    plotOutput('newHist')
  ) 
))


