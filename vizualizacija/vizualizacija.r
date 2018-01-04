# 3. faza: Vizualizacija podatkov
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                             "ne_110m_admin_0_countries") %>% pretvori.zemljevid()

zemljevid <- zemljevid %>% filter (CONTINENT %in% c("Europe"), NAME_LONG != "Russian Federation")
zemljevid$NAME_LONG <- gsub("United States", "USA", zemljevid$NAME_LONG)

graf.BDP <- ggplot() + 
  geom_polygon(data = left_join(zemljevid, BDP %>% filter(leto==2016, sestava=="Gross domestic product at market prices"), by = c("NAME_LONG" = "drzava")),
               aes(x = long, y = lat, group = group, fill = -vrednost)) +
  ggtitle("BDP") + xlab("") + ylab("") +
  guides(fill = guide_colorbar(title = "BDP"))

# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip",
#                             "OB/OB", encoding = "Windows-1250")
#levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
#  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
#zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels = levels(obcine$obcina))
#zemljevid <- pretvori.zemljevid(zemljevid)

# Izračunamo povprečno velikost družine
#povprecja <- druzine %>% group_by(obcina) %>%
#  summarise(povprecje = sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))
