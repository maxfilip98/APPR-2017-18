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
            xlab("leto")+ ylab("stopnja") + 
            ggtitle("Stopnja inflacije"))
  })  
}
  
#    dcast(druzine, obcina ~ velikost.druzine, value.var = "stevilo.druzin") %>%
#      rename(`Občina` = obcina)
#  })
#  
#  output$pokrajine <- renderUI(
#    selectInput("pokrajina", label="Izberi pokrajino",
#                choices=c("Vse", levels(obcine$pokrajina)))
#  )
#  output$naselja <- renderPlot({
#    main <- "Pogostost števila naselij"
#    if (!is.null(input$pokrajina) && input$pokrajina %in% levels(obcine$pokrajina)) {
#      t <- obcine %>% filter(pokrajina == input$pokrajina)
#      main <- paste(main, "v regiji", input$pokrajina)
#    } else {
#      t <- obcine
#    }
#    ggplot(t, aes(x = naselja)) + geom_histogram() +
#      ggtitle(main) + xlab("Število naselij") + ylab("Število občin")
#  })
#})
