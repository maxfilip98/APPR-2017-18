library(shiny)

fluidPage(
  titlePanel("Primerjave"),
  
  tabPanel("Graf",
        sidebarPanel(
          selectInput("sestava", label = "Izberi sestavo", 
                      choices = unique(BDP$sestava)),
          selectInput("drzava1", label = "Izberi državo", choices=unique(BDP$drzava))
        ),
          mainPanel(plotOutput("grafi1"))),
  
  
  tabPanel("Graf",
        sidebarPanel(
          selectInput("drzava2", label = "Izberi državo", 
                      choices = unique(inflacija$drzava))
        ),
          mainPanel(plotOutput("grafi2"))),
  
  tabPanel("Graf",
           sidebarPanel(
             selectInput("drzava3", label = "Izberi državo", 
                         choices = unique(pomozna_BDP_obrestne_mere$drzava))
           ),
           mainPanel(plotOutput("grafi3"))),
  
  tabPanel("Graf",
           sidebarPanel(
             selectInput("drzava4", label = "Izberi državo", 
                         choices = unique(pomozna_inflacija_BDP$drzava))
           ),
           mainPanel(plotOutput("grafi4")))
  
)
  
  
  
