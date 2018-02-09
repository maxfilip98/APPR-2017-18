library(shiny)

fluidPage(
  
  selectInput("select", label = h3("Država"), 
              choices = BDP$drzava), 
  
  hr(),
  mainPanel(plotOutput("grafi")),
  
  
)
  
