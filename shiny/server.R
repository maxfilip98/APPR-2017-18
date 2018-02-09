library(shiny)

function(input, output) {
  
  output$grafi1 <- renderPlot({
    tabela1 <- BDP %>% filter(drzava == input$drzava, sestava ==input$sestava)
    print(ggplot(tabela1,  aes(x = leta, y = vrednost/1000)) + geom_line() + 
            xlab("leta")+ ylab("vrednost") + 
            ggtitle("Vrednost BDP-ja v miljardah"))
  })
  output$grafi2 <- renderPlot({
    tabela2 <- inflacija %>% filter(drzava == input$drzava)
    print(ggplot(tabela2,  aes(x = leto, y = stopnja)) + geom_line() + 
            xlab("leto")+ ylab("stopnja") + scale_x_continuous(breaks = seq(2005, 2017, 2)) +
            ggtitle("Stopnja inflacije"))
  })
  output$grafi3 <- renderPlot({
    tabela3 <- pomozna_BDP_obrestne_mere %>% filter(sestava == "Gross domestic product at market prices",
                                                    vrsta == "deposit_facility", drzava == input$drzava)
    print(ggplot(tabela3,  aes(x = BDP, y = obrestna.mera)) + geom_point() + 
            xlab("BDP")+ ylab("obrestna mera") + geom_smooth(method = "lm") +
            ggtitle("Odvisnost BDP-ja od obrestne mere v posameznih državah"))
  })    
    
    output$grafi4 <- renderPlot({
      tabela4 <- pomozna_inflacija_BDP %>% filter(sestava == "Gross domestic product at market prices",
                                                  drzava == input$drzava)
      print(ggplot(tabela4,  aes(x = vrednost, y = stopnja)) + geom_point() + 
              xlab("BDP")+ ylab("inflacija") + geom_smooth(method = "lm") +
              ggtitle("Odvisnost BDP-ja od inflacije v posameznih državah"))
  })  
}
  

