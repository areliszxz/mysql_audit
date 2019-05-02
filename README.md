# mysql_audit

#Trigger MYSQL para Auditar cambios en tablas

* 1.-Ingresa a tu manejasr de mysql
* 2.-Ingresa o crea tudbaauditar
* 3.-Crea una nueva Query

* Para mostrar triggers
SHOW TRIGGERS
# Para Borrar
 * DROP TRIGGER tudbaauditar.update;
 * DROP TRIGGER tudbaauditar.incert;
 * DROP TRIGGER tudbaauditar.delete;
# Para monitorear a una tabla UPDATE,INSERT,DELETE
 * audit_t.SQL


# Estructura de la base de LOG(Auditoria)
 * log.sql

 * PD: por cada tabla a auditar se crea un trigger, asegurate que el usuario con el que creas el trigger tenga los permisos necesarios y verifica que ningun otro usuario pueda crear o ver triggers, por que pierdes el anonimato.

