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
  output$grafi3 <- renderPlot({
    tabela3 <- pomozna_BDP_obrestne_mere %>% filter(sestava == "Gross domestic product at market prices",
                                                    vrsta == "deposit_facility", drzava == input$drzava)
    print(ggplot(tabela3,  aes(x = vrednost.x, y = vrednost.y)) + geom_point() + 
            xlab("BDP")+ ylab("obrestna mera") + 
            ggtitle("Odvisnost BDP-ja od obrestne mere v posameznih državah"))
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
