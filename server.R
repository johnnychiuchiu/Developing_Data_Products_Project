library(shiny) 
library(ggplot2) 

result_mean <- NULL

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      if (input$go > 0) {
        n<-isolate(input$n)
        B<-isolate(input$B)
        lambda<-isolate(input$lambda)
        resamples <- matrix(rexp(n*B, rate = 1/lambda), B, n)
        means <- apply(resamples, 1, mean)
        result_mean <<- mean(means)
        hist(means,col='lightblue')
        lines(c(result_mean, result_mean), c(0, 200),col="red",lwd=5)
        #text(60, 150, paste("mean = ", result_mean))
        #text(63, 140, paste("sd = ", result_sd))
      }
    })
    output$summary <- renderText({
      if (input$go > 0) {
        paste0("The mean of the sample means is ", round(result_mean, 3),".")
      }
    })
  } 
)


