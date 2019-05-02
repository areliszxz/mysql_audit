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

Correo de contacto: arelis.mex@gmail.com Donaciones que serán repartidas entre los que ayudaron a realizar este turorial:

BTC 38qjUSrs8E9qyPnxV29BiLicqPP8Mv9cBF

LTC MTMdioquuDUpkJWWNBH5XiVmJTjNcRoQjr

Ripple rGXo5PQtVSBZb7CciaoS1X6SfgsYXCPLzu TAG 3

DASH 7ejSTiLbr7YHD56Eio4N9bufTEWvxAtPgw

Stellar Lumens GCMKSHPPJNHBY3G7SBAEHYTMJP257TQ33JE3LNQUDCSZHXR4OE4KD2I2 MEMO 3
