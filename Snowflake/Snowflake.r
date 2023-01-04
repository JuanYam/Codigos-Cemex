library(openxlsx)
library(dplyr)
library(readxl)

DELIV = read_excel("C:/Users/s-mxeocmexico/OneDrive - CEMEX/Documentos/GitHub/Codigos-Cemex/Snowflake/DELIV2.xlsx")
DSERV = read_excel("C:/Users/s-mxeocmexico/OneDrive - CEMEX/Documentos/GitHub/Codigos-Cemex/Snowflake/DSERV.xlsx")
CALL = read_excel("C:/Users/s-mxeocmexico/OneDrive - CEMEX/Documentos/GitHub/Codigos-Cemex/Snowflake/CALL.xlsx")


DELIV <- DELIV[!duplicated(DELIV), ]
DSERV <- DSERV[!duplicated(DSERV), ]

length(unique(DELIV$Entrega))

length(unique(DSERV$`Orden de Venta`))


a <- subset(DSERV, DSERV$`Orden de Venta` == 8013709394 )

b <- subset(DELIV, DELIV$`Documento de Venta` == 8013709394 )




DELIV$key <- paste(DELIV$Entrega)

length(unique(DELIV$key))

DELIV$key <- paste(DELIV$`Documento de Venta`,DELIV$`Unld Final Hr`, DELIV$`Unld Initial Hr`, DELIV$`Fin real (hora)`, DELIV$Entrega, DELIV$`Cantidad entrega`,DELIV$`In Site Hr`, DELIV$`Nombre 1`,DELIV$`Hora TJST`, DELIV$`Hora TOPL`)

length(unique(DELIV$key))

a <- DELIV[duplicated(DELIV$key), ]

i <- unique(DELIV$key)

for( r in 1:length(i)){
  s <- subset(DELIV,DELIV$key == i[r])
  if(nrow(s) > 1){
    break
  }
}


a <- subset(DELIV, DELIV$Entrega == 224198962)

b <- subset(DSERV, DSERV$Entrega == 224198962)
