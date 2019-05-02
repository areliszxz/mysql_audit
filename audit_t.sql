DELIMITER $$
USE `tudbaauditar`$$
CREATE
TRIGGER `tudbaauditar`.`update`
BEFORE UPDATE ON `tudbaauditar`.`tutablaaauditar` #aqui puedes poner antes o despues del update
FOR EACH ROW
BEGIN
		/*Paso de variables para un mejor control*/
		set @res1 = ''; set @res2 = ''; set @res3 = ''; set @res4 = '';
		/*Sacamos info de la ip donde se ejecuta la accion de UPDATE*/
		select host as IP INTO @ipcl from information_schema.processlist WHERE ID=connection_id();
		#concatenamos los campos de la tabla a auditar y verificamos que no sean null, en caso de que los campos sean null agregamos un espacio
		#las variables (new,old)son de mysql, el valor old es el que ya se tenia en la tabla y el new es el valor que se modifico
		
		#Valores viejos
		SET @oldq = CONCAT (' id ',ifnull(OLD.id,''),
														' campo1 ',ifnull(OLD.campo1,''),
														' campo2 ',ifnull(OLD.campo2,''),
														' campo3 ',ifnull(OLD.campo3,''));
		#Valores nuevos
        SET @newq = CONCAT (' id ',ifnull(new.id,''),
														' campo1 ',ifnull(new.campo1,''),
														' campo2 ',ifnull(new.campo2,''),
														' campo3 ',ifnull(new.campo3,''));
	#guardamos en una variable los valores que unicamente cambiaron													
    IF OLD.id <> new.id THEN set @res1 = CONCAT ('Cambio id ',ifnull(OLD.id,''), ' a: ',ifnull(new.id,'')); END IF;
	IF OLD.campo1 <> new.campo1 THEN set @res2 = CONCAT ('Cambio campo1 ',ifnull(OLD.campo1,''), ' a: ',ifnull(new.campo1,'')); END IF;
	IF OLD.campo2 <> new.campo2 THEN set @res3 = CONCAT ('Cambio campo2 ',ifnull(OLD.campo2,''), ' a: ',ifnull(new.campo2,'')); END IF;
	IF OLD.campo3 <> new.campo3 THEN set @res4 = CONCAT ('Cambio campo3 ',ifnull(OLD.campo3,''), ' a: ',ifnull(new.campo3,'')); END IF;
	SET @resC=CONCAT(ifnull(@res1,''),'|',ifnull(@res2,''),'|',ifnull(@res3,''),'|',ifnull(@res4,''));

	#insertamos en nuestra tabla de log la informacion
	INSERT INTO basedeauditoria.tablalogs (old,new,usuario,typo,fecha,tabla,valor_alterado,ip)                
	VALUES (@oldq ,@newq,CURRENT_USER,"UPDATE",NOW(),"tutablaaauditar",ifnull(@resC,'No cambio nada'),@ipcl);
END$$

#log de insertados(Nuevos registros)
DELIMITER $$
USE `tudbaauditar`$$
CREATE
TRIGGER `tudbaauditar`.`incert`
BEFORE INSERT ON `tudbaauditar`.`tutablaaauditar`
FOR EACH ROW
BEGIN
    SET @oldq = '';
    SET @newq = CONCAT (' id ',ifnull(new.id,''),
	' campo1 ',ifnull(new.campo1,''),
	' campo2 ',ifnull(new.campo2,''),
	' campo3 ',ifnull(new.campo3,''));
	INSERT INTO sys_logdev.logs (old,new,usuario,typo,fecha,tabla)                
    VALUES (@oldq ,@newq,CURRENT_USER,"INSERT",NOW(),"tutablaaauditar");
END$$

#log de Borrados
DELIMITER $$
USE `tudbaauditar`$$
CREATE
TRIGGER `tudbaauditar`.`delete`
AFTER DELETE ON `tudbaauditar`.`tutablaaauditar`
FOR EACH ROW
BEGIN
	SET @newq = '';
    SET @oldq = CONCAT (' id ',ifnull(new.id,''),
	' campo1 ',ifnull(new.campo1,''),
	' campo2 ',ifnull(new.campo2,''),
	' campo3 ',ifnull(new.campo3,''));
	INSERT INTO sys_logdev.logs (old,new,usuario,typo,fecha,tabla)                
    VALUES (@oldq ,@newq,CURRENT_USER,"DELETE",NOW(),"tutablaaauditar");
END$$
