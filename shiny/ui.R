library(shiny)

fluidPage(
  
  selectInput("sestava", label = NULL, 
              choices = unique(BDP$sestava)),
  selectInput("drzava", label = NULL, choices=unique(BDP$drzava)),
  plotOutput("grafi")
)
  
  
  
