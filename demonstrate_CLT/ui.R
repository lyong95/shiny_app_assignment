#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Stimulating Central Limit Theorem"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("size", 
                        "sample size",
                        10,
                        1000, 
                        50)
        ),
    
    mainPanel(
        plotOutput("theorectical_distr"),
        plotOutput("sample_distr"),
        plotOutput("norm_distr")
    )
)))
