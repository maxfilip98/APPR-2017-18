library(shiny)

fluidPage(
  tabPanel("Graf",
           
        sidebarPanel(
          selectInput("sestava", label = NULL, 
                      choices = unique(BDP$sestava)),
          selectInput("drzava", label = NULL, choices=unique(BDP$drzava)),
        ),
          mainPanel(plotOutput("grafi1"))
  
  
  tabPanel("Graf",
                   
        sidebarPanel(
          selectInput("drzava", label = NULL, 
                      choices = unique(inflacija$drzava))
        ),
          mainPanel(plotOutput("grafi2"))
  
  
)
  
  
  
