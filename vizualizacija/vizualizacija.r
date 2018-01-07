# 3. faza: Vizualizacija podatkov
#ZEMLJEVID
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                             "ne_110m_admin_0_countries") %>% pretvori.zemljevid()

zemljevid <- zemljevid %>% filter (CONTINENT %in% c("Europe"), NAME_LONG != "Russian Federation")

graf.BDP <- ggplot() + 
  geom_polygon(data = left_join(zemljevid, BDP %>% filter(leta==2016, sestava=="Gross domestic product at market prices"), by = c("NAME_LONG" = "drzava")),
               aes(x = long, y = lat, group = group, fill = vrednost)) +
  ggtitle("BDP 2016") + xlab("") + ylab("") +
  guides(fill = guide_colorbar(title = "BDP v eur"))

graf.inflacija <- ggplot() + 
  geom_polygon(data = left_join(zemljevid, inflacija %>% filter(leto==2016), by = c("NAME_LONG" = "drzava")),
               aes(x = long, y = lat, group = group, fill = stopnja)) +
  ggtitle("inflacija 2016") + xlab("") + ylab("") +
  guides(fill = guide_colorbar(title = "stopnja"))

#GRAF
graf.inflacijaEU <- ggplot(inflacija %>% filter(drzava == "European Union (changing composition)"),
                           aes(x=leto, y=stopnja)) + geom_line(color="red")

graf.BDP2016 <- ggplot(BDP %>% filter(leta == 2016, sestava == "Gross domestic product at market prices", drzava != c("European Union", "Euro area")),
                           aes(x=drzava, y=vrednost)) + geom_col(color="green")
                           
graf.obrestne <- ggplot(obrestne_mere %>% filter(vrsta == "deposit_facility"),
                       aes(x=datum, y=vrednost)) + geom_line(color="blue")

graf.rastBDP_Nem <- ggplot(BDP %>% filter(drzava == "Germany", sestava == "Gross domestic product at market prices"),
                           aes(x=leta, y=vrednost)) + geom_line(color="yellow")



