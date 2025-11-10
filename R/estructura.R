
·
#Para crear la estructura de directorios y ordenar el trabajo 

# Crear estructura de carpetas para proyecto de ciencia de datos
dirs <- c("data/raw", "data/processed", "R", "python", "reports")

for (d in dirs) {
  if (!dir.exists(d)) dir.create(d, recursive = TRUE)
}

# Crear README.md si no existe
if (!file.exists("README.md")) {
  file.create("README.md")
  writeLines(c("# Ciencia de Datos", 
               "", 
               "Estructura inicial del proyecto generada automáticamente."), 
             "README.md")
}

cat("✅ Estructura de carpetas creada con éxito\n")
