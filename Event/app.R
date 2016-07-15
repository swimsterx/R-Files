# 07-eventReactive

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  actionButton(inputId = "go", 
               label = "Update"),
  plotOutput("hist")
)

server <- function(input, output) {
  data <- eventReactive(input$go, {
    rnorm(input$num) 
  })
  
  output$hist <- renderPlot({
    hist(data())
  })
}

shinyApp(ui = ui, server = server)


require('devtools')
devtools::install_github('rstudio/shinyapps')
require('shinyapps')
shinyapps::setAccountInfo(name='swimsterx7', token='910C730AF12FE80009B0DD803B36F031', secret='Tpt00FPlZsw25K0je1THfP9eXcjtHD8nQfYzRM4+')