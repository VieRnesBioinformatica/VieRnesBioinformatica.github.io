# TSV to authors
rm(list = ls())
library("googledrive")
library("jsonlite")
data <- read.csv("instructores (Respuestas) - Respuestas de formulario 1.csv")

# Useless column 
data <- data[-1]

all_ids = vector()
registro_autores <- list()

for (i in 1:nrow(data)) {
  author_email = data$Dirección.de.correo.electrónico[i]
  author_name = data$Nombre.Completo..grado.de.estudios.opcional.[i]
  author_name = iconv(author_name, from = "UTF-8", to = "ASCII//TRANSLIT")
  author_id = tolower(strsplit(author_name, " ")[[1]][2])
  if(author_id %in% all_ids){
    if(is.na(tolower(strsplit(author_name, " ")[[1]][3]))){
      author_id = paste0(tolower(strsplit(author_name, " ")[[1]][1]), "2")
    } else {
      author_id = paste0(tolower(strsplit(author_name, " ")[[1]][1]), tolower(strsplit(author_name, " ")[[1]][3]))
    }
  }
  
  item_c1 = list(parte1 = "")
  item_c2 = list(parte2 = "")
  item_c3 = list(parte3 = "")
  item_c4 = list(parte4 = "")
  
  lista_cursos <- list(item_c1, item_c2, item_c3, item_c4)
  
  all_ids <- c(all_ids, author_id)
  author_description = data$Breve.descripcion..Adjunto.Ejemplo..[i]
  author_social = data$Redes.Sociales[i]
  drive_download(data$Foto.de.Perfil[i], path = paste0("assets/Autores/",author_id,".jpeg"), overwrite = TRUE)
  author_picture = paste0("Autores/",author_id,".jpeg")
  item_email <- list(email = paste0("mailto:", author_email))
  item_social <- list(revision = author_social) 
  social_anidado <- list(item_email, item_social)
  
  author_list = list(name = author_id,
                     image = author_picture,
                     bio = author_description,
                     curso = lista_cursos,
                     social = social_anidado,
                     vermas = paste0("/authors/",author_id,"/"))
  
  write_json(author_list, path = paste0("data/authors/", author_id,".json"), pretty = TRUE, auto_unbox = TRUE, overwrite = TRUE)
  
  
  
  
  author_path = paste0("content/es/authors/", author_id, "/")
  description = data$Texto.para.pagina.principal..Adjunto.Ejemplo..[i]
  dir.create(author_path, recursive = TRUE, showWarnings = FALSE)
  
  foto_nombre = "avatar.jpeg" 
  foto_path_completo = paste0(author_path, foto_nombre)
  
  drive_download(data$Foto.de.Perfil[i], path = foto_path_completo, overwrite = TRUE)
  
  text = paste0("---\n",
                "title: ", author_name, "\n",
                "image: ", foto_nombre, "\n", 
                "---\n\n", 
                description)
  writeLines(text, con = paste0(author_path,"_index.md"))
  
  registro_autores[[i]] <- c(id = author_id, nombre = author_name)
  
  
  
  }
tabla_final <- do.call(rbind, registro_autores) |> as.data.frame()
write.csv(tabla_final,file="IdAutores.csv")
