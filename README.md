# 🌿 Proyecto Integrador - Sistema de Jardinería

<div align="center">

![Estado del Proyecto](https://img.shields.io/badge/Estado-Completado-success?style=for-the-badge)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![ETL](https://img.shields.io/badge/ETL-Pipeline-orange?style=for-the-badge)
![Data Quality](https://img.shields.io/badge/Data%20Quality-Validated-green?style=for-the-badge)

**Sistema completo de ETL y DataMart para gestión de datos de jardinería**

[Documentación](#-documentación) • [Instalación](#-instalación-rápida) • [Estructura](#-estructura-del-proyecto) • [Características](#-características)

</div>

---

## 📋 Descripción

Este proyecto implementa un **sistema completo de ETL (Extract, Transform, Load)** y un **DataMart** para el análisis de datos de una empresa de jardinería. Incluye desde la creación de esquemas de base de datos hasta pruebas exhaustivas de calidad de datos.

### 🎯 Objetivos del Proyecto

- ✅ Diseñar e implementar un modelo de datos dimensional (Estrella)
- ✅ Crear un pipeline ETL robusto y escalable
- ✅ Implementar un área de Staging para transformaciones intermedias
- ✅ Desarrollar un DataMart optimizado para análisis
- ✅ Garantizar la calidad de datos mediante pruebas automatizadas

---

## 🚀 Instalación Rápida

### Prerequisitos

- MySQL Server 8.0 o superior
- Cliente MySQL (MySQL Workbench, DBeaver, etc.)
- Acceso con permisos de creación de bases de datos

### Pasos de Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/Biershoot/Proyecto_integrador_Repositorio_de_todas_las_actividades.git
cd Proyecto_integrador_Repositorio_de_todas_las_actividades

# 2. Ejecutar los scripts en orden (ver sección siguiente)
```

### 📝 Orden de Ejecución de Scripts

Ejecuta los siguientes scripts **en orden** en tu cliente MySQL:

1. **Crear Base de Datos Origen**
   ```sql
   -- 02_Scripts_SQL/01_Create_DB/create_source_schema.sql
   ```

2. **Insertar Datos de Prueba**
   ```sql
   -- 03_Datasets/sample_data_inserts.sql
   ```

3. **Crear Área de Staging**
   ```sql
   -- 02_Scripts_SQL/02_Staging/create_staging.sql
   ```

4. **Proceso ETL - Extracción**
   ```sql
   -- 02_Scripts_SQL/03_ETL/extract_to_staging.sql
   ```

5. **Proceso ETL - Transformación**
   ```sql
   -- 02_Scripts_SQL/03_ETL/transform_staging.sql
   ```

6. **Crear DataMart**
   ```sql
   -- 02_Scripts_SQL/04_DataMart/create_datamart.sql
   ```

7. **Cargar DataMart**
   ```sql
   -- 02_Scripts_SQL/04_DataMart/load_datamart.sql
   ```

8. **Ejecutar Pruebas de Calidad** (Opcional pero recomendado)
   ```sql
   -- 04_Pruebas_Calidad_Datos/01_completitud.sql
   -- 04_Pruebas_Calidad_Datos/02_duplicados.sql
   -- 04_Pruebas_Calidad_Datos/03_consistencia.sql
   -- 04_Pruebas_Calidad_Datos/04_integridad_referencial.sql
   -- 04_Pruebas_Calidad_Datos/05_valores_invalidos.sql
   ```

---

## 📁 Estructura del Proyecto

```
Jardineria_Project/
│
├── 📂 01_Modelos/                    # Modelos de datos
│   ├── ER_Modelo_Estrella.txt        # Diagrama del modelo dimensional
│   └── Integracion_Final_Portada.pdf # Portada del proyecto
│
├── 📂 02_Scripts_SQL/                # Scripts SQL organizados
│   ├── 01_Create_DB/                 # Creación de esquemas
│   │   └── create_source_schema.sql
│   ├── 02_Staging/                   # Área de staging
│   │   └── create_staging.sql
│   ├── 03_ETL/                       # Proceso ETL
│   │   ├── extract_to_staging.sql
│   │   └── transform_staging.sql
│   └── 04_DataMart/                  # DataMart dimensional
│       ├── create_datamart.sql
│       └── load_datamart.sql
│
├── 📂 03_Datasets/                   # Datos de prueba
│   └── sample_data_inserts.sql
│
├── 📂 04_Pruebas_Calidad_Datos/      # Validaciones de calidad
│   ├── 01_completitud.sql            # Pruebas de completitud
│   ├── 02_duplicados.sql             # Detección de duplicados
│   ├── 03_consistencia.sql           # Validación de consistencia
│   ├── 04_integridad_referencial.sql # Integridad referencial
│   └── 05_valores_invalidos.sql      # Validación de valores
│
├── 📂 05_Documentacion/              # Documentación del proyecto
│   └── Integracion_Final_Portada.pdf
│
├── 📂 EA4_Grupo9_Integracionfinal/   # Archivos adicionales del grupo
│   ├── BK de las bases de datos trabajadas.sql
│   ├── CreacionJardineria.sql
│   ├── Grupo_9_ Staging _Jardineria.pdf
│   ├── Informe Final.pdf
│   ├── Script SQL.sql
│   └── Staging.sql
│
└── 📄 README.md                      # Este archivo
```

---

## ✨ Características

### 🔄 Pipeline ETL Completo

- **Extracción**: Carga de datos desde fuentes operacionales
- **Transformación**: Limpieza, normalización y enriquecimiento de datos
- **Carga**: Población del DataMart dimensional

### 🗄️ Modelo Dimensional (Estrella)

- **Tablas de Hechos**: Métricas y transacciones del negocio
- **Tablas de Dimensiones**: Contexto para el análisis (tiempo, productos, clientes, etc.)
- **Optimizado para consultas analíticas**

### 🧪 Pruebas de Calidad de Datos

| Tipo de Prueba | Descripción |
|----------------|-------------|
| **Completitud** | Verifica que no haya valores nulos en campos críticos |
| **Duplicados** | Detecta registros duplicados |
| **Consistencia** | Valida coherencia entre tablas relacionadas |
| **Integridad Referencial** | Verifica relaciones entre tablas |
| **Valores Inválidos** | Detecta datos fuera de rangos esperados |

### 📊 Área de Staging

- **Aislamiento**: Separación entre datos origen y destino
- **Transformaciones intermedias**: Procesamiento incremental
- **Auditoría**: Trazabilidad del proceso ETL

---

## 🛠️ Tecnologías Utilizadas

- **Base de Datos**: MySQL 8.0+
- **Lenguaje**: SQL
- **Metodología**: Modelado Dimensional (Kimball)
- **Arquitectura**: ETL con Staging Area

---

## 📊 Modelo de Datos

El proyecto implementa un **modelo dimensional tipo estrella** que incluye:

### Tablas de Dimensiones
- 🕐 **dim_tiempo**: Dimensión temporal para análisis por fecha
- 👥 **dim_cliente**: Información de clientes
- 🌱 **dim_producto**: Catálogo de productos de jardinería
- 📍 **dim_ubicacion**: Datos geográficos
- 👨‍💼 **dim_empleado**: Información del personal

### Tablas de Hechos
- 💰 **fact_ventas**: Transacciones de ventas
- 📦 **fact_pedidos**: Gestión de pedidos
- 📊 **fact_inventario**: Control de stock

> 📄 Ver diagrama completo en `01_Modelos/ER_Modelo_Estrella.txt`

---

## 🧪 Validación y Pruebas

Todas las pruebas de calidad están automatizadas y se encuentran en la carpeta `04_Pruebas_Calidad_Datos/`. Ejecuta cada script para validar:

```sql
-- Ejemplo: Verificar completitud de datos
SOURCE 04_Pruebas_Calidad_Datos/01_completitud.sql;
```

---

## 📚 Documentación

La documentación completa del proyecto se encuentra en:

- 📁 `05_Documentacion/Integracion_Final_Portada.pdf`
- 📁 `EA4_Grupo9_Integracionfinal/Informe Final.pdf`
- 📁 `EA4_Grupo9_Integracionfinal/Grupo_9_ Staging _Jardineria.pdf`

---

## 👥 Equipo de Desarrollo

**Grupo 9 - Proyecto Integrador**

Este proyecto fue desarrollado como parte de una evaluación académica integradora.

---

## 📝 Notas Importantes

⚠️ **Importante**: Algunos JOINs en `load_datamart.sql` son placeholders que deben ajustarse según el esquema final de tu base de datos.

💡 **Recomendación**: Ejecuta las pruebas de calidad después de cada carga para garantizar la integridad de los datos.

🔧 **Personalización**: Puedes modificar los scripts según las necesidades específicas de tu negocio.

---

## 🤝 Contribuciones

Este es un proyecto académico completado. Si deseas utilizarlo como base para tu propio proyecto:

1. Haz un Fork del repositorio
2. Crea una rama para tu característica (`git checkout -b feature/NuevaCaracteristica`)
3. Realiza tus cambios y haz commit (`git commit -m 'Agregar nueva característica'`)
4. Sube tus cambios (`git push origin feature/NuevaCaracteristica`)
5. Abre un Pull Request

---

## 📄 Licencia

Este proyecto es de código abierto y está disponible para fines educativos.

---

## 📞 Contacto

Para preguntas o sugerencias sobre este proyecto, por favor abre un issue en el repositorio.

---

<div align="center">

**⭐ Si este proyecto te fue útil, considera darle una estrella ⭐**

Hecho con 💚 por el Grupo 9

</div>
