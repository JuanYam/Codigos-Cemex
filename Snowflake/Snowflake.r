library(openxlsx)
library(dplyr)
library(readxl)

DELIV = read_excel("C:/Users/E-JAYAM/Documents/GitHub/Codigos-Cemex/Snowflake/DELIV2.xlsx")
DSERV = read_excel("C:/Users/E-JAYAM/Documents/GitHub/Codigos-Cemex/Snowflake/DSERV.xlsx")
CALL = read_excel("C:/Users/E-JAYAM/Documents/GitHub/Codigos-Cemex/Snowflake/CALL.xlsx")
Plantas <- read_excel("C:/Users/E-JAYAM/OneDrive - CEMEX/BD PBI EXOP/Tablas de dimensiones/Base Plantas.xlsx")

DELIV <- DELIV[!duplicated(DELIV), ]
DSERV <- DSERV[!duplicated(DSERV), ]

a <- DELIV[duplicated(DELIV$Entrega),]
a <- a %>% group_by(Centro) %>% mutate(Repeticiones = n())
a <- a[!duplicated(a$Centro),]
Plantas <- subset(Plantas, Plantas$Año == 2022 & Plantas$Mes == 12)
a <- a[,c(1,49)]
Plantas <- Plantas[,c(3,4,6,7,8)]
colnames(Plantas) <- c("PD-Code", "Centro", "Nombre de Planta", "Plaza", "Zona")
Rem_Repetidas <- left_join(a,Plantas)


b <- DSERV[duplicated(DSERV$Entrega),]
b <- b %>% group_by(Centro) %>% mutate(Repeticiones = n())
a <- a[!duplicated(a$Centro),]
Plantas <- subset(Plantas, Plantas$Año == 2022 & Plantas$Mes == 12)
a <- a[,c(1,49)]
Plantas <- Plantas[,c(3,4,6,7,8)]
colnames(Plantas) <- c("PD-Code", "Centro", "Nombre de Planta", "Plaza", "Zona")
Rem_Repetidas <- left_join(a,Plantas)


write.xlsx(Rem_Repetidas,"C:/Users/E-JAYAM/Documents/GitHub/Codigos-Cemex/Snowflake/Remisiones_Repetiadas_DELIV.xlsx" )


sum(subset(Rem_Repetidas$Repeticiones, Rem_Repetidas$Zona == "CENTRO"))
sum(subset(Rem_Repetidas$Repeticiones, Rem_Repetidas$Zona == "SURESTE"))
sum(subset(Rem_Repetidas$Repeticiones, Rem_Repetidas$Zona == "PACIFICO"))
sum(subset(Rem_Repetidas$Repeticiones, Rem_Repetidas$Zona == "NORESTE"))



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
