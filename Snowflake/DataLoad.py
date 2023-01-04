import snowflake.connector
from snowflake.connector.pandas_tools import write_pandas
import pandas as pd


df = pd.read_csv("IK17.csv", sep=",", index_col=False)
df.reset_index(drop=True, inplace=True)
df.columns = ["Linea_seleccionada",	"Documento_medicion", "Punto_de_medida","Fecha", "Hora_medicion", "ValMed_Val_total_cont", "UnidadCaracteristica","Creado_por","Posicion_de_medida","Diferencia_val_cont","Equipo","Texto1","Texto2"]


ctx = snowflake.connector.connect(user='juan.yam@ext.cemex.com',
                                     account='hg45590', 
                                     region = 'East-US-2.azure',
                                     warehouse='PRD_LND_MRP_SAP', 
                                     database='PRD_TDS_MX_PLANOPER_CONCRETO',       
                                     schema ='EXOP',
                                     authenticator="externalbrowser",
                                     autocommit=True)         

cs = ctx.cursor()
cs.execute("DROP TABLE IK172" )
cs.execute('CREATE TABLE "IK172" ("Linea_seleccionada" text, "Documento_medicion" text,	"Punto_de_medida" text, "Fecha" text, "Hora_medicion" text,	 "ValMed_Val_total_cont" text, "UnidadCaracteristica" text,	 "Creado_por" text,	 "Posicion_de_medida" text,	"Diferencia_val_cont" text,	"Equipo" text,	"Texto1" text,"Texto2" text)')
write_pandas(ctx,df,table_name="IK172")

