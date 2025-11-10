
install.packages("rpart")      # solo la primera vez
install.packages("rpart.plot") # opcional, para ver más bonito

library(rpart)
library(rpart.plot)

#Usamos un dataset de ejemplo
head(iris)
str(iris)

#Entrenamos el árbol de decisión
modelo <- rpart(
  formula = Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
  data = iris,
  method = "class"
)

#Ver el árbol en texto
print(modelo)
summary(modelo)

#Dibujamos el modelo

#Primero la forma base
plot(modelo)
text(modelo, use.n = TRUE)

#Luego usando Rpart
rpart.plot(modelo,
           type = 2,         # pone las etiquetas debajo
           extra = 104,      # muestra clase, % y n
           fallen.leaves = TRUE)

#Probamos las predicciones

#Solo para testear si funciona
pred <- predict(modelo, newdata = iris, type = "class")
head(pred)

#Comparamos con la realidad (como una pequeña matriz de confusión)
table(Real = iris$Species, Predicho = pred)

#Calculmos el accuracy
mean(pred == iris$Species)



