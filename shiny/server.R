library(shiny)

function(input, output) {
  
  output$grafi <- renderPlot({
    tabela <- BDP %>% filter(drzava == input$select, sestava ==input$select)
    print(ggplot(tabela,  aes(x = leto, y = vrednost/1000000)) + geom_line() + 
            xlab("leta")+ ylab("vrednost") + 
            ggtitle("Vredbost BDP-ja v miljardah"))
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
