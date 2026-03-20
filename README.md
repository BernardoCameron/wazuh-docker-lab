# Wazuh Docker Lab

Laboratorio local de monitoreo levantado con Docker Compose, desplegando los tres componentes principales de Wazuh como servicios separados.

## Arquitectura

| Componente | Descripción | Puerto por defecto |
|---|---|---|
| Wazuh Indexer | Almacenamiento basado en OpenSearch para alertas y eventos | 9200 |
| Wazuh Manager | Motor principal — analiza logs y genera alertas | 1514, 1515 |
| Wazuh Dashboard | Interfaz web para visualizar e investigar alertas | 443 |
| Wazuh Agent | Agente de monitoreo instalado en el endpoint | — |

## Requisitos

- Docker 20.10+
- Docker Compose v2
- 4GB RAM mínimo (6GB recomendado)

## Inicio rápido

### 1. Clonar el repositorio
```bash
git clone https://github.com/BernardoCameron/wazuh-docker-lab.git
cd wazuh-docker-lab
```

### 2. Configurar variables de entorno
```bash
cp .env.example .env
```

Editar el archivo `.env` con las credenciales correspondientes. Ver sección de credenciales más abajo.

### 3. Generar certificados SSL
```bash
docker compose -f generate-indexer-certs.yml run --rm generator
```

### 4. Levantar los servicios
```bash
docker compose up -d
```

### 5. Acceder al dashboard

Abrir en el navegador: `https://localhost/`

Aceptar el aviso de certificado autofirmado y usar las credenciales por defecto.

## Credenciales por defecto

Estas credenciales provienen de la configuración oficial de Wazuh y están definidas en `config/wazuh_indexer/internal_users.yml`.

| Usuario | Contraseña | Uso |
|---|---|---|
| `admin` | `SecretPassword` | Acceso al dashboard y API del Indexer |
| `kibanaserver` | `kibanaserver` | Comunicación interna Dashboard ↔ Indexer |
| `wazuh-wui` | `MyS3cr37P450r.*-` | Comunicación interna Dashboard ↔ Manager |

> ⚠️ Estas son credenciales de laboratorio. No usar en producción.

## Estructura del proyecto
```
wazuh-docker-lab/
├── docker-compose.yml              # Archivo principal de compose
├── generate-indexer-certs.yml      # Generador de certificados SSL
├── .env.example                    # Plantilla de variables de entorno
├── config/
│   ├── certs.yml                   # Definición de certificados
│   ├── wazuh_indexer/              # Configuración del Indexer
│   ├── wazuh_manager/              # Configuración del Manager
│   └── wazuh_dashboard/            # Configuración del Dashboard
└── scripts/
    └── simulate-attack.sh          # Script de simulación de ataques
```

## Objetivos del laboratorio

- [x] Desplegar los componentes de Wazuh como servicios separados
- [ ] Conectar un agente y generar alertas reales
- [ ] Simular un ataque de fuerza bruta y detectarlo
- [ ] Documentar hallazgos y reglas de alerta

## Referencias

- [Documentación de Wazuh](https://documentation.wazuh.com)
- [Despliegue de Wazuh con Docker](https://documentation.wazuh.com/current/deployment-options/docker/docker-installation.html)
- [Repositorio oficial wazuh-docker](https://github.com/wazuh/wazuh-docker)