# Etapa 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm ci --prefer-offline --no-audit

# Copiar código fuente
COPY . .

# Build de la aplicación
RUN npm run build

# Etapa 2: Runtime
FROM node:20-alpine

WORKDIR /app

# Crear usuario no-root para ejecutar la aplicación
RUN addgroup -g 1001 -S nodejs && adduser -S appuser -u 1001

# Instalar servidor HTTP ligero (http-server)
RUN npm install -g http-server

# Copiar solo los archivos necesarios del build anterior
COPY --from=builder /app/dist /app/dist

# Cambiar propiedad de los archivos
RUN chown -R appuser:nodejs /app

# Cambiar al usuario no-root
USER appuser

# Exponer puerto
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:3000 || exit 1

# Comando para ejecutar la aplicación
CMD ["http-server", "dist", "-p", "3000", "--cors"]
