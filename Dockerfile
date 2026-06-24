# ============================================================
# STAGE 1: Build con Node
# ============================================================
FROM node:20-alpine AS builder

WORKDIR /app

# Instalar dependencias primero (optimiza caché)
COPY package*.json ./
RUN npm ci

# Copiar código fuente
COPY . .

# Las variables VITE_ se pasan como build args
ARG VITE_API_VENTAS_URL
ARG VITE_API_DESPACHOS_URL
ENV VITE_API_VENTAS_URL=$VITE_API_VENTAS_URL
ENV VITE_API_DESPACHOS_URL=$VITE_API_DESPACHOS_URL

RUN npm run build

# ============================================================
# STAGE 2: Servidor Nginx
# ============================================================
FROM nginx:alpine

# Copiar el build al directorio de Nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Configuración de Nginx para SPA (React Router)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]