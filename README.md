
# Frontend Despacho — React + Vite

## Descripción General

Este proyecto corresponde al frontend del sistema de gestión de despachos. Fue desarrollado utilizando React y Vite con el objetivo de proporcionar una interfaz moderna, rápida y responsive para administrar operaciones relacionadas con compras, ventas y despachos.

La aplicación consume APIs REST desarrolladas en Spring Boot y permite interactuar con distintos módulos administrativos.

---

# Objetivos del Proyecto

- Gestionar despachos desde una interfaz web.
- Permitir operaciones CRUD.
- Integrar frontend con microservicios backend.
- Implementar arquitectura desacoplada.
- Facilitar despliegue mediante Docker.

---

# Tecnologías Utilizadas

| Tecnología | Uso |
|---|---|
| React | Construcción de interfaz |
| Vite | Entorno de desarrollo |
| TailwindCSS | Estilos |
| JavaScript | Lógica frontend |
| Docker | Contenedorización |
| Nginx | Servidor web |
| Axios | Consumo de APIs |
| React Router DOM | Navegación SPA |

---

# Arquitectura General

```text
Usuario
   ↓
Frontend React
   ↓
API REST Spring Boot
   ↓
MySQL
```

---

# Estructura del Proyecto

```bash
front_despacho-main-main/
│
├── public/
├── src/
│   ├── assets/
│   ├── componentes/
│   ├── Routes/
│   ├── App.jsx
│   ├── main.jsx
│   └── index.css
├── Dockerfile
├── nginx.conf
├── package.json
└── vite.config.js
```

---

# Explicación del Funcionamiento

## Inicio de la Aplicación

El archivo:

```bash
src/main.jsx
```

es el punto de entrada principal de React.

Este archivo:
- Renderiza la aplicación.
- Importa estilos globales.
- Configura el router.
- Inicializa componentes.

---

## Sistema de Rutas

La aplicación utiliza:

```bash
react-router-dom
```

para manejar navegación SPA.

Ejemplo:

```jsx
<Route path="/admin" element={<Admin />} />
```

Esto permite:
- Navegación sin recargar.
- Separación de vistas.
- Módulos independientes.

---

## Componentes

La carpeta:

```bash
src/componentes/
```

contiene:
- Formularios
- Navbar
- Footer
- Tablas
- CRUD administrativos
- Cards
- Modales

Cada componente es reutilizable.

---

# CRUD Administrativo

El sistema incluye operaciones:

- Crear
- Leer
- Actualizar
- Eliminar

Ejemplo:

```jsx
axios.get("http://localhost:8081/api/despachos")
```

---

# Comunicación con Backend

El frontend consume APIs REST mediante Axios.

Ejemplo:

```javascript
axios.post("http://localhost:8081/api/despachos", data)
```

Las respuestas son renderizadas dinámicamente.

---

# Instalación Local

## Requisitos

- Node.js
- npm
- Docker (opcional)

---

## Instalar Dependencias

```bash
npm install
```

---

## Ejecutar Proyecto

```bash
npm run dev
```

---

# Acceso Local

```bash
http://localhost:5173
```

---

# Dockerización

## Construir Imagen

```bash
docker build -t front-despacho .
```

---

## Ejecutar Contenedor

```bash
docker run -d -p 80:80 front-despacho
```

---

# Funcionamiento de Docker

El contenedor:
- Compila React.
- Genera build productivo.
- Nginx sirve archivos estáticos.
- Permite despliegue cloud.

---

# nginx.conf

Nginx:
- Sirve archivos React.
- Maneja rutas SPA.
- Mejora rendimiento.

---

# Despliegue AWS EC2

Arquitectura:

```text
Internet
   ↓
EC2 Pública
   ↓
Nginx + React
```

---

# Buenas Prácticas

- Componentes reutilizables
- Arquitectura modular
- Contenerización
- SPA
- Separación frontend/backend