# Wazuh Docker Lab

Laboratorio local de monitoreo construido con Docker Compose, desplegando los tres componentes principales de Wazuh como servicios separados.

## Arquitectura

| Componente | Descripción | Puerto por defecto |
|---|---|---|
| Wazuh Indexer | Almacenamiento basado en OpenSearch para alertas y eventos | 9200 |
| Wazuh Manager | Motor principal - analiza logs y genera alertas | 1514, 1515 |
| Wazuh Dashboard | Interfaz web para visualizar e investigar alertas | 443 |

## Requisitos

- Docker 20.10+
- Docker Compose v2
- 4GB RAM mínimo (6GB recomendado)

## Inicio rápido
```bash
# 1. Copiar variables de entorno
cp .env.example .env

# 2. Levantar todos los servicios
docker compose up -d

# 3. Acceder al dashboard
# https://localhost:443
# Credenciales por defecto: admin / SecretPassword (Este lo entrega wazuh al instalar.)
```

## Estructura del proyecto
```
wazuh-docker-lab/
├── docker-compose.yml        # Archivo principal de compose
├── .env.example              # Plantilla de variables de entorno
├── config/
│   ├── wazuh_indexer/        # Configuración del Indexer
│   ├── wazuh_manager/        # Configuración del Manager
│   └── wazuh_dashboard/      # Configuración del Dashboard
└── scripts/
    └── simulate-attack.sh    # Script de simulación de ataques para pruebas
```

## Objetivos del laboratorio

- [ ] Desplegar los componentes de Wazuh como servicios separados
- [ ] Conectar un agente y generar alertas reales
- [ ] Simular un ataque de fuerza bruta y detectarlo
- [ ] Documentar hallazgos y reglas de alerta

## Referencias

- [Documentación de Wazuh](https://documentation.wazuh.com)
- [Despliegue de Wazuh con Docker](https://documentation.wazuh.com/current/deployment-options/docker/docker-installation.html)