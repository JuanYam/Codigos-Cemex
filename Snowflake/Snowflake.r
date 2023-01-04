library(tabulizer)
library(lubridate)
library(openxlsx)
library(pdftools)
library(dplyr)
library(readxl)
library(stringr)

DELIV = read_excel("C:/Users/yamli/OneDrive/Documentos/CEMEX/Snowflake/DELIV.xlsx")

DELIV <- DELIV[!duplicated(DELIV), ]




DELIV$key <- paste(DELIV$`Documento de Venta`,DELIV$`Unld Final Hr`, DELIV$`Unld Initial Hr`, DELIV$`Fin real (hora)`, DELIV$Entrega, DELIV$`Cantidad entrega`,DELIV$`In Site Hr`, DELIV$`Nombre 1`,DELIV$`Hora TJST`, DELIV$`Hora TOPL`, DELIV$`Nombre de la Obra`)

length(unique(DELIV$key))

a <- DELIV[duplicated(DELIV$key), ]

i <- unique(DELIV$key)

for( r in 1:length(i)){
  s <- subset(DELIV,DELIV$key == i[r])
  if(nrow(s) > 1){
    break
  }
}

