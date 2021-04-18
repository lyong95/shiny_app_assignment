#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggpubr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
   set.seed(123)
   t <- reactive({
      rexp(input$size, 0.2)
   })
   

   s <- reactive({
   sample <- c()
   for(i in 1:input$size){
      sample <- c(sample, mean(rexp(40, 0.2)))
   }
   
   sample
   })
      
   
   output$theorectical_distr <- renderPlot({
         hist(t(), xlab = "value", main = "theoretical exponential distribution")
         abline(v = 1/0.2, col = "blue") +
            title(sub = "The frequency histogram of the population dsitribution is plotted along with
a vertical blue line indicating the population means")
      })
      
   output$sample_distr <- renderPlot({
      hist(s(), xlab = "value", main = "sample exponential distribution")
      abline(v = 1/0.2, col = "blue") +
         title(sub = "The frequency histogram of the population dsitribution is plotted along with
a vertical blue line indicating the population means")
   })
   
   output$norm_distr <- renderPlot({
      ggqqplot(s()) +
                 labs(title = "Sample distribution vs normal distribution")
   })
})
   
