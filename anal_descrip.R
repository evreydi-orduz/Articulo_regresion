# ================================================================
# Analisis descriptivo de la base de datos "datos"
# ================================================================

# ----------------------------------------------------------------
# 0. Paquete necesario
# ----------------------------------------------------------------

if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}

# ----------------------------------------------------------------
# 1. Lectura de los datos desde GitHub
# ----------------------------------------------------------------

url <- "https://raw.githubusercontent.com/evreydi-orduz/Articulo_regresion/main/datos.xlsx"

archivo <- tempfile(fileext = ".xlsx")
download.file(url, destfile = archivo, mode = "wb")

datos <- as.data.frame(readxl::read_excel(archivo))

# ----------------------------------------------------------------
# 2. Estructura general de la base
# ----------------------------------------------------------------

dim(datos)
names(datos)
str(datos)
head(datos)
colSums(is.na(datos))

# ----------------------------------------------------------------
# 3. Estadisticas descriptivas
# ----------------------------------------------------------------

summary(datos)

# ----------------------------------------------------------------
# 4. Graficos descriptivos
# ----------------------------------------------------------------

# Histogramas para las variables, excepto sitio
for (variable in names(datos)) {
  
  if (variable != "Sitio") {
    
    hist(datos[[variable]],
         main = paste("Distribucion de", variable),
         xlab = variable,
         ylab = "Frecuencia",
         col = "lightblue",
         border = "white")
  }
}
