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
stran2 <- html_session(link2) %>% read_html()
obrestne_mere <- stran2 %>% html_nodes(xpath="//table[@class='ecb-contentTable fullWidth']") %>% 
  .[[1]] %>%
  html_table(fill = TRUE)
colnames(obrestne_mere) <- c("leta", "datum", "deposit_facility", "fixed_rate_tenders_fixed-rate", "variable_rate_tenders_minimum_bid_rate", "marginal_lending-facility")
obrestne_mere <- tail(obrestne_mere, -2)
obrestne_mere$leta <- parse_number(obrestne_mere$leta)
obrestne_mere$deposit_facility <- parse_number(obrestne_mere$deposit_facility)
obrestne_mere$fixed_rate_tenders_fixed_rate <- parse_number(obrestne_mere$fixed_rate_tenders_fixed_rate)
obrestne_mere$marginal_lending-facility <-parse_number(obrestne_mere$marginal_lending-facility)
#obrestne_mere$51 <- NULL

BDP <- read_csv("podatki/BDP.csv",
                col_names = c("leta", "sestava", "drzava" , "unit", "vrednost"),
                skip = 1,
                na = ":", locale = locale(encoding = "UTF-8", grouping_mark = " ",
                decimal_mark = ".")) %>% select(-unit)
BDP <- filter(BDP, leta >= 1999)





