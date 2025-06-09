# Cargar imagen de Node.js como ambiente del container
FROM node:lts-alpine AS builder

# Set directorio interno del contenedor
WORKDIR /app

# Copiar contenidos de package.json y package-lock.json para instalar dependencias
COPY package*.json ./

# Install dependencies with npm ci for faster, reliable, reproducible builds
# --only=production would skip devDependencies, but we need them for Vite build
#RUN npm ci --silent

# Instalar dependencias
RUN npm install

# Copiar el codigo fuente hacia el container
COPY . .

# Crear carpeta con aplicacion para produccion (codigo optimizado) en /dist
RUN npm run build

# Cargar imagen de nginx para servir la aplicacion
# Es decir, en el contenedor va a estar corriendo el codigo de produccion pero se accede a traves de nginx
FROM nginx:alpine AS production

# Copiar /dist a directorio html de nginx. Esto permite que se pueda acceder correctamente al contenido
COPY --from=builder /app/dist /usr/share/nginx/html

# Exponer puerto 80 del contenedor (!)
# Al ejecutar el proceso del contenedor,hay que especificar esto de todos modos
EXPOSE 80

# Ejecutar nginx en modo de primer plano (obligatorio para contenedores), sirve ademas para troubleshooting
# de errores posibles con nginx
CMD ["nginx", "-g", "daemon off;"]

# Para crear contenedor y ejecutar:
# docker build -t pet-inventory .
# docker run -p 3000:80
# En docker run, se especifican los puertos <PC:contenedor>
# es decir, si se ejecuta el comando de arriba, el puerto expuesto del contenedor es 80
# pero nosotros accedemos al puerto 3000, por tanto http://localhost:3000 