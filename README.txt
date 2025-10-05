
Proyecto Jardineria - ETL y DataMart (Resuelto)
Estructura creada: /mnt/data/Jardineria_Project

Instrucciones rápidas:
1) Ejecutar scripts en orden (MySQL):
   - 02_Scripts_SQL/01_Create_DB/create_source_schema.sql
   - 03_Datasets/sample_data_inserts.sql
   - 02_Scripts_SQL/02_Staging/create_staging.sql
   - 02_Scripts_SQL/03_ETL/extract_to_staging.sql
   - 02_Scripts_SQL/03_ETL/transform_staging.sql
   - 02_Scripts_SQL/04_DataMart/create_datamart.sql
   - 02_Scripts_SQL/04_DataMart/load_datamart.sql
2) Ejecutar pruebas de calidad (archivos en 04_Pruebas_Calidad_Datos)
3) Revisar documentación en 05_Documentacion

Nota: algunos JOINs en load_datamart.sql son placeholders que debe ajustar según su esquema final.
