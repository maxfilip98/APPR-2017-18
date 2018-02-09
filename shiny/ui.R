library(shiny)

fluidPage(
  
  selectInput("sestava", label = NULL, 
              choices = BDP$sestava),
  selectInput("drzava", label = NULL, choices=BDP$drzava),
  plotOutput("grafi")
)
  
  
  
