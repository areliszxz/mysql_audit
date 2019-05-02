# mysql_audit

#Trigger MYSQL para Auditar cambios en tablas

* 1.-Ingresa a tu manejasr de mysql
* 2.-Ingresa a la base de datos
* 3.-Crea una nueva Query

* Para mostrar triggers
SHOW TRIGGERS
# Para Borrar
 * DROP TRIGGER nombre_de_tu_db_a_auditar.b5update;
 * DROP TRIGGER nombre_de_tu_db_a_auditar.b5incert;
 * DROP TRIGGER nombre_de_tu_db_a_auditar.b5delete;
# Para monitorear UPDATE a una tabla
 * UPDATE_T.SQL
# Para monitorear INSERT
 * INSERT_T.SQL
# Para monitorear DELETE
 * DELETE_T.SQL

# Estructura de la base de LOG(Auditoria)
 * log.sql

 * PD: por cada tabla a monitorear se crea un trigger, asegurate que el usuario con el que creas el trigger tenga los permisos necesarios y verifica que ningun otro usuario pueda crear o ver triggers, por que pierdes el anonimato.

