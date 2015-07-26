library(shiny) 
library(ggplot2) 

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      n<-input$n
      B<-input$B
      lambda<-input$lambda
      resamples <- matrix(sample(x, n * B, replace = TRUE), B, n)
      means <- apply(resamples, 1, mean)
      result_mean <- mean(means)
      hist(means,col='lightblue')
      lines(c(result_mean, result_mean), c(0, 200),col="red",lwd=5)
      text(60, 150, paste("mean = ", result_mean))
      text(63, 140, paste("sd = ", result_sd))
    })  
  } 
)


