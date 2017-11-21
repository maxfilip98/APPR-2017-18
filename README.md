# Analiza podatkov s programom R, 2017/18

## Makroekonomska analiza evropskega gospodarstva

Avtor: Max Filip Uršič

V mojem projektu se bom ukvarjal z makroekonomsko analizo evropskega gospodarstva od leta 1991 naprej. Pri analizi se bom osredotočil predvsem na glavne dele BDP-ja (domača potrošnja, potrošnja države, investicije, uvoz, ter izvoz), ter na ostale makroekonomske kazatelje kot so delež brezposelnosti, inflacija in obrestne mere.
Podatke bom črpal iz evrostata, uradnih strani evropske centralne banke: 
- http://appsso.eurostat.ec.europa.eu/nui/show.do?query=BOOKMARK_DS-406763_QID_-7AA5FD9F_UID_-3F171EB0&layout=TIME,C,X,0;NA_ITEM,L,Y,0;GEO,L,Y,1;UNIT,L,Z,0;INDICATORS,C,Z,1;&zSelection=DS-406763UNIT,CLV10_MEUR;DS-406763INDICATORS,OBS_FLAG;&rankName1=UNIT_1_2_-1_2&rankName2=INDICATORS_1_2_-1_2&rankName3=TIME_1_0_0_0&rankName4=NA-ITEM_1_0_0_1&rankName5=GEO_1_0_1_1&sortR=ASC_-1_FIRST&sortC=ASC_-1_FIRST&rStp=&cStp=&rDCh=&cDCh=&rDM=true&cDM=true&footnes=false&empty=false&wai=false&time_mode=NONE&time_most_recent=false&lang=EN&cfo=%23%23%23%2C%23%23%23.%23%23%23
- https://www.ecb.europa.eu/stats/policy_and_exchange_rates/key_ecb_interest_rates/html/index.en.html
- http://ec.europa.eu/eurostat/tgm/table.do?tab=table&init=1&language=en&pcode=tec00118&plugin=1


Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Tematika

Izbrali si boste temo, s katero se bo vaš projekt ukvarjal. Tukaj boste
napisali, kje ste dobili podatke, ter kakšen je vaš cilj.

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
