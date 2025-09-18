# Banking Microservices

[![Java](https://img.shields.io/badge/Java-17-blue)]  
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.5-brightgreen)]  
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue)]  
[![Docker Compose](https://img.shields.io/badge/Docker-Compose-blue)]  
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

---

## Descripción

Este proyecto contiene **dos microservicios** independientes y dockerizados que gestionan la información de un sistema bancario:

- **Identity Service** → Manejo de clientes.  
- **Account Service** → Manejo de cuentas y movimientos (transacciones).  

Ambos se conectan a una base de datos **PostgreSQL** compartida y pueden ejecutarse en conjunto mediante **Docker Compose**.

---

## Repositorios

- [TechnicalTest-SofkaTechnologies-IdentityService](https://github.com/BeLawliet/TechnicalTest-SofkaTechnologies-IdentityService.git)  
- [TechnicalTest-SofkaTechnologies-AccountService](https://github.com/BeLawliet/TechnicalTest-SofkaTechnologies-AccountService.git)  

---

## Requisitos Previos

Antes de levantar los servicios, asegúrate de tener instalado:

- Java 17  
- Maven  
- Docker  
- Docker Compose  

---

## Estructura del Proyecto

```
.
├─ TechnicalTest-SofkaTechnologies-AccountService/   # Microservicio de cuentas y transacciones
├─ TechnicalTest-SofkaTechnologies-IdentityService/  # Microservicio de clientes
├─ Postman - Collections/                            # Colecciones de Postman para pruebas
│  ├─ CLIENTES.postman_collection.json
│  ├─ CUENTAS.postman_collection.json
│  └─ MOVIMIENTOS.postman_collection.json
├─ DBBanking-Script.sql                              # Script SQL para crear las estructuras de BD
├─ docker-compose.yml                                # Orquestación de contenedores
└─ README.md                                         # Este archivo
```

---

## Preparación

### 1. Clonar los repositorios

```bash
git clone https://github.com/BeLawliet/TechnicalTest-SofkaTechnologies-IdentityService.git
git clone https://github.com/BeLawliet/TechnicalTest-SofkaTechnologies-AccountService.git
```

### 2. Construir las imágenes de los microservicios

En cada carpeta clonada ejecutar:

```bash
mvn clean install -DskipTests
docker build -t identity-service .
docker build -t account-service .
```

### 3. Crear la base de datos

Ejecutar el script SQL incluido (`DBBanking-Script.sql`) en PostgreSQL para generar las estructuras necesarias.

---

## Ejecución

Levantar todo el ecosistema con:

```bash
docker compose up -d --build
```

Esto iniciará:

- PostgreSQL en `localhost:5432`  
- Identity Service en `http://localhost:8080`  
- Account Service en `http://localhost:9090`  

---

## Endpoints principales

### Identity Service (`http://localhost:8080/api/v1/customers`)
- `GET /customers` → Listar clientes  
- `POST /customers` → Crear cliente  
- `PUT /customers/{id}` → Actualizar cliente  
- `DELETE /customers/{id}` → Eliminar cliente  

### Account Service (`http://localhost:9090/api/v1`)
- `GET /accounts` → Listar cuentas  
- `POST /accounts` → Crear cuenta  
- `PUT /accounts/{id}` → Actualizar cuenta  
- `DELETE /accounts/{id}` → Eliminar cuenta  
- `GET /accounts/{id}/transactions` → Consultar transacciones de una cuenta  
- `POST /transactions` → Registrar transacción  

---

## Pruebas con Postman

En la carpeta `Postman - Collections/` encontrarás las siguientes colecciones listas para importar en **Postman** y probar los endpoints:

- [CLIENTES.postman_collection.json](./Postman%20-%20Collections/CLIENTES.postman_collection.json)  
- [CUENTAS.postman_collection.json](./Postman%20-%20Collections/CUENTAS.postman_collection.json)  
- [MOVIMIENTOS.postman_collection.json](./Postman%20-%20Collections/MOVIMIENTOS.postman_collection.json)  

---

## Autor

Andrés Suárez - Desarrollador Backend  
Email: elcostexd995@gmail.com  
