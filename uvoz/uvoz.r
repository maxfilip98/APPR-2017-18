link1 <- "http://ec.europa.eu/eurostat/tgm/table.do?tab=table&init=1&plugin=1&language=en&pcode=tec00118"
stran <- html_session(link1) %>% read_html()
drzave <- stran %>% html_nodes(xpath="//table[@id='fixtable']") %>% .[[1]] %>%
  html_table(header = FALSE)
leta <- stran %>% html_nodes(xpath="//table[@id='headtable']") %>% .[[1]] %>%
  html_table(header = FALSE)
inflacija <- stran %>% html_nodes(xpath="//table[@id='contenttable']") %>% .[[1]] %>% html_table()
inflacija <- cbind(drzave, inflacija)
colnames(inflacija) <- c("drzava", leta)
inflacija <- inflacija %>%
  melt(id.vars = "drzava", variable.name = "leto", value.name = "sprememba") %>%
  mutate(leto = parse_number(leto),
         sprememba = parse_number(sprememba, na = ":"))

  
  

link2 <- "https://www.ecb.europa.eu/stats/policy_and_exchange_rates/key_ecb_interest_rates/html/index.en.html"
stran <- html_session(link2) %>% read_html()
obrestne_mere <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>% .[[1]] %>% html_table(dec = ".")
return(obrestne_mere)
  for (i in 1:ncol(obrestne_mere)) {
    if (is.character(obrestne_mere[[i]])) {
      Encoding(obrestne_mere[[i]]) <- "UTF-8"
  }
}
  




BDP <- read_csv("podatki/BDP.csv",
                col_names = c("cas", "sestava", "drzava" , "unit", "vrednost"),
                skip = 1,
                na = ":", locale = locale(encoding = "UTF-8", grouping_mark = " ",
                decimal_mark = ".")) %>% select(-unit) %>% filter(BDP, cas >= 1999)





