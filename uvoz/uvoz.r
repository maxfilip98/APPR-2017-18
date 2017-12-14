#link <- "http://ec.europa.eu/eurostat/tgm/table.do?tab=table&init=1&plugin=1&language=en&pcode=tec00118"
#stran <- html_session(link) %>% read_html()
#inflacija <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>% .[[1]] %>% html_table(dec = ",")
#colnames(inflacija) <- c("cas", "drzava")

  
  

link <- "https://www.ecb.europa.eu/stats/policy_and_exchange_rates/key_ecb_interest_rates/html/index.en.html"
stran <- html_session(link) %>% read_html()
obrestne_mere <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>% .[[0]] %>% html_table(dec = ".")
return(obrestne_mere)
  for (i in 1:ncol(tabela)) {
    if (is.character(tabela[[i]])) {
      Encoding(tabela[[i]]) <- "UTF-8"
  }
}
  
obrestne_mere <- uvozi.obrestne_mere()




BDP <- read_csv("podatki/BDP.csv",
                col_names = c("cas", "sestava", "drzava" , "unit", "vrednost"),
                skip = 1,
                na = ":", locale = locale(encoding = "UTF-8", grouping_mark = " ",
                decimal_mark = ".")) %>% select(-unit) %>% filter(BDP, cas >= 1999)





