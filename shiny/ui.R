library(shiny)

fluidPage(
  titlePanel("primerjava"),
  
  tabPanel("Graf",
        sidebarPanel(
          selectInput("sestava", label = "Izberi sestavo", 
                      choices = unique(BDP$sestava)),
          selectInput("drzava", label = "Izberi državo", choices=unique(BDP$drzava))
        ),
          mainPanel(plotOutput("grafi1"))),
  
  
  tabPanel("Graf",
        sidebarPanel(
          selectInput("drzava", label = "Izberi državo", 
                      choices = unique(inflacija$drzava))
        ),
          mainPanel(plotOutput("grafi2"))),
  
  tabPanel("Graf",
           sidebarPanel(
             selectInput("drzava", label = "Izberi državo", 
                         choices = unique(pomozna_BDP_obrestne_mere$drzava))
           ),
           mainPanel(plotOutput("grafi3")))
  
  
)
  
  
  
