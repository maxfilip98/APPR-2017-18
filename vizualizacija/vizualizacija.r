# 3. faza: Vizualizacija podatkov
#ZEMLJEVID
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                             "ne_110m_admin_0_countries", encoding = "") %>% pretvori.zemljevid()

zemljevid <- zemljevid %>% filter (CONTINENT %in% c("Europe")| NAME_LONG %in% c("Turkey", "Cyprus", "Northern Cyprus"),
                                   NAME_LONG != "Russian Federation")

graf.BDP <- ggplot() + 
  geom_polygon(data = left_join(zemljevid, BDP %>% filter(leta==2016, sestava=="Gross domestic product at market prices"), by = c("NAME_LONG" = "drzava")),
               aes(x = long, y = lat, group = group, fill = vrednost/1000000)) +
  ggtitle("BDP 2016") + xlab("") + ylab("") +
  guides(fill = guide_colorbar(title = "BDP v milijonih eur")) +
  coord_cartesian(xlim = c(-25, 40), ylim = c(32, 72))

graf.inflacija <- ggplot() + 
  geom_polygon(data = left_join(zemljevid, inflacija %>% filter(leto==2016), by = c("NAME_LONG" = "drzava")),
               aes(x = long, y = lat, group = group, fill = stopnja)) +
  ggtitle("inflacija 2016") + xlab("") + ylab("") +
  guides(fill = guide_colorbar(title = "stopnja")) +
  coord_cartesian(xlim = c(-25, 40), ylim = c(32, 72))

#GRAF
graf.inflacijaEU <- ggplot(inflacija %>% filter(drzava == "European Union (changing composition)"),
                           aes(x=leto, y=stopnja)) + geom_line(color="red")

graf.BDP2016 <- ggplot(BDP %>% filter(leta == 2016,
                                      sestava == "Gross domestic product at market prices"),
                       aes(x = reorder(drzava, -vrednost), y = vrednost/1000000)) +
  geom_col(fill = "green") + xlab("Država") + ylab("milijoni evrov") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) + geom_col(color="green")
                           
graf.obrestne <- ggplot(obrestne_mere %>% filter(vrsta == "deposit_facility"),
                       aes(x=datum, y=vrednost)) + geom_line(color="blue")

graf.rastBDP_Nem <- ggplot(BDP %>% filter(drzava == "Germany", sestava == "Gross domestic product at market prices"),
                           aes(x=leta, y=vrednost)) + geom_line(color="yellow")

graf.rastBDP <- ggplot(BDP %>% filter(sestava == "Gross domestic product at market prices"),
                       aes(x = leta, y = vrednost/1000000,, color = drzava)) + geom_line()

podatki <- BDP %>% filter(leta == 2016, sestava == "Gross domestic product at market prices") %>%
  arrange(desc(vrednost)) %>% mutate(drzava = ifelse(row_number() > 10, "Ostale", drzava)) %>%
  group_by(drzava) %>% summarise(vrednost = sum(vrednost, na.rm = TRUE))

graf.delezBDP <- ggplot(podatki, aes(x = factor(1), y = vrednost/1000000,
                    fill = reorder(drzava, ifelse(drzava == "Ostale", 0, vrednost)))) +
  geom_col(width = 1) + coord_polar(theta = "y") + xlab("") + ylab("") +
  guides(fill = guide_legend("Država", reverse = TRUE)) + ggtitle("BDP v milijonih evrov") +
  theme(axis.text.y = element_blank(), axis.ticks.y = element_blank())


