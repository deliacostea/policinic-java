
DROP SCHEMA IF EXISTS `policlinica`;

CREATE SCHEMA `policlinica`;

DROP TABLE IF EXISTS `policlinica`.`bon_fiscal`;
  
  CREATE TABLE `policlinica`.`bon_fiscal` (
  `idBon` INT NOT NULL AUTO_INCREMENT,
  `idRaport` INT NULL,
  `Unitate_medicala` VARCHAR(45) NULL,
  `Today` DATE NULL,
  `Pret` FLOAT NULL,
  PRIMARY KEY (`idBon`));


DROP TABLE IF EXISTS `policlinica`.`medic`;

CREATE TABLE `policlinica`.`medic` (
  `idMedic` INT NOT NULL AUTO_INCREMENT,
  `Specialitate` VARCHAR(45) NULL,
  `Gradul` VARCHAR(45) NULL,
  `Cod_Parafa` INT NULL,
  `Competente` VARCHAR(45) NULL,
  `Titlul_ST` VARCHAR(45) NULL,
  `Post_Didactic` VARCHAR(45) NULL,
  `Procent_Salariu` INT NULL,
  
  PRIMARY KEY (`idMedic`));
  
  
  DROP TABLE IF EXISTS `policlinica`.`administrator`;
  
  CREATE TABLE `policlinica`.`administrator` (
  `idAdministrator` INT NOT NULL AUTO_INCREMENT,
  `Super_Administrator` BOOLEAN NULL,
  PRIMARY KEY (`idAdministrator`));



DROP TABLE IF EXISTS `policlinica`.`asistent_medical`;

  CREATE TABLE `policlinica`.`asistent_medical` (
  `idAsistent_Medical` INT NOT NULL AUTO_INCREMENT,
  `Tipul` VARCHAR(45) NULL,
  `Gradul` VARCHAR(45) NULL,  
  PRIMARY KEY (`idAsistent_Medical`));







DROP TABLE IF EXISTS `policlinica`.`Res_umane`;

  CREATE TABLE `policlinica`.`Res_umane` (
  `idIns_Res_Umane` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idIns_Res_Umane`));

DROP TABLE IF EXISTS `policlinica`.`Financiar_cont`;

  CREATE TABLE `policlinica`.`Financiar_cont` (
  `idExpert_Financiar_Cont` INT NOT NULL AUTO_INCREMENT,
  `inspector` BOOLEAN NULL,
  PRIMARY KEY (`idExpert_Financiar_Cont`));
  
  DROP TABLE IF EXISTS `policlinica`.`receptioner`;

  CREATE TABLE `policlinica`.`receptioner` (
  `idReceptioner` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY ( `idReceptioner`));

  DROP TABLE IF EXISTS `policlinica`.`Unitati_medicale`;

  CREATE TABLE `policlinica`.`Unitati_medicale` (
  `idUnitate` INT NOT NULL AUTO_INCREMENT,
  `Denumire` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  `Descriere` TEXT NULL,
  `Ziua` VARCHAR(45) NULL,
  `Ora_deschidere` TIME NULL,
  `Ora_inchidere` TIME NULL,
  PRIMARY KEY ( `idUnitate`));

 DROP TABLE IF EXISTS `policlinica`.`Raport`;

  CREATE TABLE `policlinica`.`Raport` (
  `idRaport` INT NOT NULL AUTO_INCREMENT,
  `CNP` VARCHAR(45) NULL,
  `idMedic` INT NULL,
  `idAsistent` INT NULL,
  `data_consult` VARCHAR(45) NULL,
  `simptome` TEXT NULL,
  `diagnostic` TEXT NULL,
  `recomandari` TEXT NULL,
  `tip_raport` VARCHAR(45) NULL,
  `incheiat` BOOLEAN NULL,
  PRIMARY KEY ( `idRaport`));


DROP TABLE IF EXISTS `policlinica`.`servicii_medicale`;

  CREATE TABLE `policlinica`.`servicii_medicale` (
  `idServicii_Medicale` INT NOT NULL AUTO_INCREMENT,
  `Specialitate` VARCHAR(45) NULL,
  `Necesitate_Competente` VARCHAR(45) NULL,
  `Pret` FLOAT NULL,
  `Durata` INT NULL,
  PRIMARY KEY (`idServicii_Medicale`));

  DROP TABLE IF EXISTS `policlinica`.`consultatii`;

  CREATE TABLE `policlinica`.`consultatii` (
  `idConsultatii` INT NOT NULL AUTO_INCREMENT,
  `idServicii_Medicale` INT NULL,
  `idRaport` INT NULL,
  `Rezultat` TEXT NULL,
  INDEX `fk_consultatii_servicii_medicale_idx`(`idServicii_Medicale` ASC),
  INDEX `fk_consultatii_raport_idx`(`idRaport` ASC),
  CONSTRAINT `fk_consultatii_raport_idx`
  FOREIGN KEY (`idRaport`)
  REFERENCES `policlinica`.`Raport`(`idRaport`),
  CONSTRAINT `fk_consultatii_servicii_medicale_idx`
  FOREIGN KEY (`idServicii_Medicale`)
  REFERENCES `policlinica`.`servicii_medicale`(`idServicii_medicale`),
  PRIMARY KEY ( `idConsultatii`));




  DROP TABLE IF EXISTS `policlinica`.`programarea`;

  CREATE TABLE `policlinica`.`programarea` (
  `idProgramarea` INT NOT NULL AUTO_INCREMENT,
  `idMedic` INT NULL,
  `idReceptioner` INT NULL,
  `idUnitate` INT NULL,
  `idConsultatii` INT NULL,
  `Nume_Pacient` VARCHAR(45) NULL,
  `Prenume_Pacient` VARCHAR(45) NULL,
  `CNP_Pacient` VARCHAR(45) NULL,
  `Inceput_Prog` TIME NULL,
  `Final_Prog` TIME NULL,
  `Today` DATE NULL,
  INDEX `fk_programare_medic_idx` (`idMedic` ASC),
  INDEX `fk_programare_receptioner_idx` (`idReceptioner` ASC),
  INDEX `fk_programare_unitate_idx` (`idUnitate` ASC),
  INDEX `fk_programare_consultatii_idx` (`idConsultatii` ASC),
   CONSTRAINT `fk_programare_receptioner_idx` 
    FOREIGN KEY (`idReceptioner`)
    REFERENCES `policlinica`.`Receptioner` (`idReceptioner`),
   CONSTRAINT `fk_programare_unitate_idx` 
    FOREIGN KEY (`idUnitate`)
    REFERENCES `policlinica`.`Unitati_medicale` (`idUnitate`),
   CONSTRAINT `fk_angajat_medic_idx` 
    FOREIGN KEY (`idMedic`)
    REFERENCES `policlinica`.`Medic` (`idMedic`),
   CONSTRAINT `fk_programare_consultatii_idx` 
    FOREIGN KEY (`idConsultatii`)
    REFERENCES `policlinica`.`consultatii` (`idConsultatii`),
  PRIMARY KEY ( `idProgramarea`));

DROP TABLE IF EXISTS `policlinica`.`angajat`;

 CREATE TABLE `policlinica`.`angajat` (
	`idAngajat` INT(11) NOT NULL AUTO_INCREMENT,
	`idAdministrator` INT(11) NULL DEFAULT NULL,
	`idAsistent_Medical` INT(11) NULL DEFAULT NULL,
	`idMedic` INT(11) NULL,
    `idIns_Res_Umane` INT(11) NULL,
    `idExpert_Financiar_Cont` INT(11) NULL,
    `idReceptioner` INT(11) NULL,
	`Nr_Ore` INT(11) NULL DEFAULT NULL,
	`Salariu_neg` FLOAT NULL DEFAULT NULL,
  INDEX `fk_angajat_administrator1_idx` (`idAdministrator` ASC),
  INDEX `fk_angajat_asistent_medical1_idx` (`idAsistent_Medical` ASC),
  INDEX `fk_angajat_medic1_idx` (`idMedic` ASC),
  INDEX `fk_angajat_res_um_idx` (`idIns_Res_Umane` ASC),
  INDEX `fk_angajat_expert_idx` (`idExpert_Financiar_Cont` ASC),
  INDEX `fk_angajat_receptioner_idx` (`idReceptioner` ASC),
  CONSTRAINT `fk_angajat_receptioner_idx` 
    FOREIGN KEY (`idReceptioner`)
    REFERENCES `policlinica`.`Receptioner` (`idReceptioner`),
  CONSTRAINT `fk_angajat_expert_idx`
    FOREIGN KEY (`idExpert_Financiar_Cont`)
    REFERENCES `policlinica`.`Financiar_Cont` (`idExpert_Financiar_Cont`),
  CONSTRAINT `fk_angajat_res_um_idx` 
    FOREIGN KEY (`idIns_Res_Umane`)
    REFERENCES `policlinica`.`Res_Umane` (`idIns_Res_Umane`),
  CONSTRAINT `fk_angajat_administrator1`
    FOREIGN KEY (`idAdministrator`)
    REFERENCES `policlinica`.`administrator` (`idAdministrator`),
  CONSTRAINT `fk_angajat_asistent_medical1`
    FOREIGN KEY (`idAsistent_Medical`)
    REFERENCES `policlinica`.`asistent_medical` (`idAsistent_Medical`),
  CONSTRAINT `fk_angajat_medic1`
    FOREIGN KEY (`idMedic`)
    REFERENCES `policlinica`.`medic` (`idMedic`),
    PRIMARY KEY (`idAngajat`));



DROP TABLE IF EXISTS `policlinica`.`utilizator`;

  CREATE TABLE `policlinica`.`utilizator` (
  `CNP` VARCHAR(13) NOT NULL,
  `idAngajat` INT(11) NULL,
  `idRaport` INT(11) NULL,
  `Nume` VARCHAR(45) NULL,
  `Prenume` VARCHAR(45) NULL,
  `Pacient` BOOLEAN NULL,
  `Adresa` VARCHAR(45) NULL,
  `Nr_telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Cont_IBAN` VARCHAR(45) NULL,
  `Nr_Contact` INT NULL,
  `Data_Angajarii` DATETIME NULL,
  `Functia` VARCHAR(45) NULL, 
  INDEX `fk_utilizator_angajat_idx` (`idAngajat` ASC),
  INDEX `fk_utilizator_raport_idx` (`idRaport` ASC),
  CONSTRAINT `fk_utilizator_angajat_idx`
    FOREIGN KEY (`idAngajat`)
    REFERENCES `policlinica`.`angajat` (`idAngajat`),
    CONSTRAINT `fk_utilizator_raport_idx`
    FOREIGN KEY (`idRaport`)
    REFERENCES `policlinica`.`Raport` (`idRaport`),
  PRIMARY KEY (`CNP`) );



DROP TABLE IF EXISTS `policlinica`.`Orar`;

  CREATE TABLE `policlinica`.`Orar` (
  `idOrar` INT NOT NULL AUTO_INCREMENT,
  `idAngajat` INT NULL,
  `idUnitate` INT NULL,
  `Ziua` VARCHAR(45) NULL,
  `Ora_inceput` TIME NULL,
  `Ora_sfarsit` TIME NULL,
  INDEX `fk_orar_angajat_idx` (`idAngajat` ASC),
  INDEX `fk_orar_unitati_idx` (`idUnitate` ASC),
  CONSTRAINT `fk_orar_angajat_idx`
    FOREIGN KEY (`idAngajat`)
    REFERENCES `policlinica`.`angajat` (`idAngajat`),
  CONSTRAINT `fk_orar_unitati_idx`
    FOREIGN KEY (`idUnitate`)
    REFERENCES `policlinica`.`Unitati_medicale` (`idUnitate`),
  PRIMARY KEY (`idOrar`));

Drop Table IF exists `policlinica`.`concedii`;

CREATE TABLE `policlinica`.`concedii` (
  `idConcedii` INT NOT NULL AUTO_INCREMENT,
  `idAngajat` INT NULL,
  `Data_inceput` DATE NULL,
  `Data_final` DATE NULL,
  PRIMARY KEY (`idConcedii`),
  INDEX `fk_concedii_angajat_idx` (`idAngajat` ASC) VISIBLE,
  CONSTRAINT `fk_concedii_angajat`
    FOREIGN KEY (`idAngajat`)
    REFERENCES `policlinica`.`angajat` (`idAngajat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

#inserari / populare tabele


INSERT INTO policlinica.medic
	    (Specialitate, Gradul, Cod_Parafa,Competente, Titlul_ST,Post_Didactic, Procent_Salariu)
	    VALUES
	    ("Boli infecţioase", "specialist",102030,"ecografie","doctorand","Asistent universitar",12),
	    ("Cardiologie","primar",120041,"cardiologie"," doctor în științe medicale","Profesor universitar",11),
	    ("Farmacologie clinică", "specialist",105123,"endoscopie digestivă","doctorand","Conferenţiar universitar",12),
	    ("Medicină internă", "primar",223432,"ecocardiografie"," doctor în științe medicale","Profesor universitar",14),
	    ("Cardiologie", "specialist",702835,"bronhoscopie","doctorand","Lector universitar",16),
	    ("Boli infecţioase","primar",237703,"cardiologie","doctor în științe medicale","Lector universitar",15);
	

		



INSERT INTO policlinica.angajat
	    (idMedic,Nr_Ore, Salariu_neg)
	    VALUES
	    (1, 170,5500),
	    (2, 165,9000),
	    (3, 180,7000),
	    (4, 200,12000),
	    (5, 170,11200),
	    (6, 168,9600);
        
INSERT INTO policlinica.asistent_medical
    	(Tipul,Gradul)
		values
        ("Generalist","Secundar"),
        ("Laborator","Principal"),
        ("Radiologie","Secundar"),
        ("Generalist","Principal"),
        ("Laborator","Secundar"),
        ("Radiologie","Principal");
        
INSERT INTO policlinica.angajat
	    (idAsistent_Medical,Nr_Ore, Salariu_neg)
	    VALUES
	    (1, 150,3600),
	    (2, 165,4000),
	    (3, 120,2700),
	    (4, 167,4200),
	    (5, 170,4500),
	    (6, 168,3800);
        



INSERT INTO policlinica.utilizator
	    (CNP ,idAngajat,Nume ,Prenume ,Pacient ,Adresa ,Nr_telefon ,Email ,Cont_IBAN ,Nr_Contact , Data_Angajarii , Functia )
	    VALUES
	    ("1950822342352",1, "Popescu","Maria",0,"Strada Iuliu Maniu, nr. 16","0712369121","popescu.maria@yahoo.com","RO03BTRLRO5432458205OTDG",0251622251,"2011-12-31 13:59:59","Medic"),
	    ("5221201017499",2, "Marin","Dragos",0,"Strada Mihail Cogalniceanu, nr.7","0756608921","marin.dragos2@gmail.com","RO68ALNRRO5432458205OTDG",0688902109,"2001-12-20 10:00:00","Medic"),
	    ("5221201047175",3, "Constantin","Andrei",0,"Strada Crisan, nr. 201","0744689543","constantin.andrei@yahoo.com","RO90ALNRRO5295647785OTDG",0755678933,"2010-07-21 09:00:00","Medic"),
		("6020505045235",4, "Oltean","Alina",0,"Strada Mihai Viteazu, nr.19","0766493858","oltean.alina@gmail.com","RO95BTRL5647398220104ABK",0766549367,"2003-04-10 12:05:54","Medic"),
		("6221203039144",5, "Bucur","Bianca",0,"Strada Aurel Vlaicu, nr.120","0751203100","bucur_bianca@gmail.com","RO77ROMC12345678AASVBDGD",0257353109,"1997-08-07 10:20:40","Medic"),
		("2971214086821",6, "Botas","Iosif",0,"Strada Plopilor, nr. 23","0763531088","botas_iosif05@yahoo.com","RO23ROECFHGJF23456532123",0780909043,"2007-11-16 08:56:30","Medic"),
        ("6021016021100",7, "Butur","Ion",0,"Strada Primaverii, nr. 167","0723102694","butur_ion@yahoo.com","RO65BTRLFHGJF23456512654",0712321343,"2009-11-16 08:56:30","Asistent medical"),
        ("2970116232148",8, "Pop", "Mirel",0,"Strada Principala, nr. 124","0722347345","pop.mirel@yahoo.com","RO13RZBR5517582669266715",0766098124,"2017-06-16 12:56:30","Asistent medical"),
        ("1941115086742",9, "Bumb","Ionel",0,"Strada Alexandru Ioan Cuza, nr. 53","0767678876","bumb.mirel@yahoo.com","RO22PORL5282998558762627",0236120002,"2014-08-24 09:34:30","Asistent medical"),
        ("2931206390827",10, "Cristea","Mirela",0,"Strada Crizantemelor, nr. 23","0722197802","cristea_mirela@yahoo.com","RO46RZBR3851377159625368",0367120021,"2004-11-23 12:20:36","Asistent medical"),
        ("1981118258736",11, "Durdun","Florin",0,"Mihai Viteazul, nr. 103","0745021102","durdun.florin@yahoo.com","RO98PORL9243696381233324",0257754120,"2001-03-12 17:56:30","Asistent medical"),
        ("2900806053244",12, "Popovici","Alexandra",0,"Strada Closca, nr. 207","0774493883","popovici.alexandra@yahoo.com","RO81RZBR4285248138546299",0335010010,"1998-11-21 15:46:32","Asistent medical"),
		("6231201019111",NULL,"Codrean","Andreea",1,"Strada Mihai Eminescu, nr. 8","0766493933","codrean.andreea@yahoo.com","RO12RZBR4455324324877422",0221050053,"2000-10-10 16:33:12","Pacient"),
		("1910807422344",NULL,"Mancas","Paula",1,"Strada Alexandru Vaida Voievod, nr. 14","0723345543","mancas.paula@yahoo.com","RO71PORL9641769182723917",0755212212,"2006-12-10 17:34:23","Pacient"),
		("2910503040567",NULL,"Punta","Mihai",1,"Strada Emil Isaac, nr. 44","0722545554","punta.mihai@yahoo.com","RO41RZBR8794551524938911",0357493124,"2009-09-10 11:33:12","Pacient");
        
        
INSERT INTO policlinica.raport
	    (CNP ,idMedic ,idAsistent,data_consult ,simptome ,diagnostic,recomandari ,incheiat )
	    VALUES
	  ("6231201019111" ,1 ,3,"2012-12-31" ,"febra,greata" ,"Bronsita","Paracetamol, ceaiuri",1),# cnp pacient
	  ("6251203039111" ,5 ,2,"2000-07-21" ,"probleme de memorie" ,"Alzheimer","Medicamente",0);


#DELETE FROM `policlinica`.`utilizator` WHERE (`CNP` ="09986598234" );

    INSERT INTO policlinica.bon_fiscal
	    (idRaport, Unitate_medicala,Today,Pret)
	    VALUES
        (2,"Farmacie","2002-02-12",12.5),
        (3,"Dispensar 2","2022-02-12",12.5),
        (1,"Dispensar 1","2023-01-12",1233.5),
        (3,"Dispensar 3","2022-12-12",12.5),
        (1,"Dispensar 5","2020-02-22",12.5),
        (1,"Dispensar 4","2023-01-12",12333.5),
        (2,"Farmacie 2","2023-01-12",100123.5);
        
INSERT INTO policlinica.Unitati_medicale(Denumire, Adresa, Descriere, Ziua, Ora_deschidere, Ora_inchidere)
VALUES ("Dispensar 1", "Str. Principala 123", "Dispensarul nostru oferă o varietate de produse", "Luni-Vineri", "09:00:00", "17:00:00"),
("Dispensar 2", "Str. Parcului 456", "Ne specializăm în soiuri de înaltă calitate", "Marți-Vineri", "10:00:00", "19:00:00"),
("Dispensar 3", "Str. Frunzei 789", "Personalul nostru este informat și amabil", "Miercuri-Sambata", "09:00:00", "17:00:00"),
("Dispensar 4", "Str. Stejarului 111", "Avem o gamă largă de produse alimentare disponibile", "Luni-Joi", "10:00:00", "19:00:00"),
("Dispensar 5", "Str. Pinului 222", "Dispensarul nostru oferă un mediu confortabil și relaxant", "Vineri", "09:00:00", "17:00:00"),
("Dispensar 6", "Str. Cedrului 333", "Avem o gamă largă de produse la prețuri competitive", "Sâmbătă-Duminica", "10:00:00", "19:00:00"),
("Dispensar 7", "Str. Mesteacănului 444", "Dispensarul nostru se dedică furnizării celei mai bune servicii pentru clienți", "Duminică", "09:00:00", "17:00:00"),
("Dispensar 8", "Str. Aurel Vlaicu 333", "Avem medici specializati", "Sâmbătă", "11:00:00", "20:00:00");
/*
INSERT INTO `policlinica`.`orar` (`idOrar`, `idAngajat`, `idUnitate`, `Ziua`, `Ora_inceput`, `Ora_sfarsit`) VALUES ('1', '1', '1', 'Luni-Vineri', '8:00', '15:00');
INSERT INTO `policlinica`.`orar` (`idOrar`, `idAngajat`, `idUnitate`, `Ziua`, `Ora_inceput`, `Ora_sfarsit`) VALUES ('2', '2', '2', 'Luni-Vineri', '8:00', '16:00');
INSERT INTO `policlinica`.`orar` (`idOrar`, `idAngajat`, `idUnitate`, `Ziua`, `Ora_inceput`, `Ora_sfarsit`) VALUES ('3', '3', '3', 'Luni-Vineri', '8:00', '17:00');
INSERT INTO `policlinica`.`orar` (`idOrar`, `idAngajat`, `idUnitate`, `Ziua`, `Ora_inceput`, `Ora_sfarsit`) VALUES ('4', '4', '4', 'Luni-Vineri', '8:00', '16:00');
INSERT INTO `policlinica`.`orar` (`idOrar`, `idAngajat`, `idUnitate`, `Ziua`, `Ora_inceput`, `Ora_sfarsit`) VALUES ('5', '5', '5', 'Luni-Vineri', '8:00', '16:30');
INSERT INTO `policlinica`.`orar` (`idOrar`, `idAngajat`, `idUnitate`, `Ziua`, `Ora_inceput`, `Ora_sfarsit`) VALUES ('6', '6', '6', 'Luni-Vineri', '8:00', '17:00');
INSERT INTO `policlinica`.`orar` (`idOrar`, `idAngajat`, `idUnitate`, `Ziua`, `Ora_inceput`, `Ora_sfarsit`) VALUES ('7', '7', '1', 'Luni-Vineri', '8:00', '15:00');
INSERT INTO `policlinica`.`orar` (`idOrar`, `idAngajat`, `idUnitate`, `Ziua`, `Ora_inceput`, `Ora_sfarsit`) VALUES ('8', '8', '2', 'Luni-Vineri', '8:00', '17:30');
 */




	#delete from policlinica.bon_fiscal WHERE idBon;

DROP PROCEDURE if EXISTS `policlinica`.`add_policlinica`;

delimiter //

CREATE PROCEDURE `policlinica`.`add_policlinica`(Denumire_unitate VARCHAR(45),ad VARCHAR(45),Descr VARCHAR(45),Zi VARCHAR(45),ora1 TIME,ora2 TIME)
BEGIN
	#set @tp := tip, @col := new_coloana, @tab := tabel, @after_c = dupa_coloana;
    INSERT INTO unitati_medicale
	    (Denumire, Adresa, Descriere,Ziua,Ora_deschidere,Ora_inchidere)
	    VALUES
	    (Denumire_unitate,ad, Descr, Zi,ora1,ora2);
        
END//

delimiter ;


DROP PROCEDURE if EXISTS `policlinica`.`drop_policlinica`;

delimiter //

CREATE PROCEDURE `policlinica`.`drop_policlinica`(Id INT)
BEGIN

    DELETE FROM `policlinica`.`unitati_medicale` WHERE (`idUnitate` = Id);
        
END//

delimiter ;

USE `policlinica`;
DROP procedure IF EXISTS `add_utilizator`;

USE `policlinica`;
DROP procedure IF EXISTS `policlinica`.`add_utilizator`;
;

DELIMITER $$
USE `policlinica`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_utilizator`(CNP_utilizator VARCHAR(13),num VARCHAR(45),
pren VARCHAR(45),Paci TINYINT(1),adrs VARCHAR(45),nr_tel VARCHAR(45),em VARCHAR(45),
IBAN VARCHAR(45),contact INT, Data_ang DATETIME, fct VARCHAR(45) )
BEGIN

	set @f = fct,@id_f = NULL,@id_A = NULL;
	IF @f = "Medic" THEN
	set @f = "Medic";
    INSERT INTO medic 
		()
        VALUES
        ();
    SELECT @id_f := MAX(idMedic) FROM medic;
    INSERT INTO angajat
        (idMedic)
        VALUES
        (@id_f);
    ELSEIF @f = "Asistent Medical" THEN
    set @f = "Asistent Medical";
    INSERT INTO asistent_medical
    ()
    VALUES
    ();
    SELECT @id_f := MAX(idAsistent_Medical) FROM asistent_medical;
    INSERT INTO angajat
        (idAsistent_Medical)
        VALUES
        (@id_f);
    ELSEIF @f = "Financiar Cont" THEN
    set @f = "Financiar Cont";
    INSERT INTO financiar_cont
    ()
    VALUES
    ();
    SELECT @id_f := MAX(idExpert_Financiar_Cont) FROM financiar_cont;
    INSERT INTO angajat
        (idExpert_Financiar_Cont)
        VALUES
        (@id_f);
	ELSEIF @f = "Administrator" THEN
    set @f = "Administrator";
    INSERT INTO Administrator
    ()
    VALUES
    ();
    SELECT @id_f := MAX(idAdministrator) FROM administrator;
    INSERT INTO angajat
        (idAdministrator)
        VALUES
        (@id_f);
    ELSEIF @f = "Receptioner" THEN
    set @f = "Receptioner";
    INSERT INTO receptioner
    ()
    VALUES
    ();
    SELECT @id_f := MAX(idReceptioner) FROM receptioner;
    INSERT INTO angajat
        (idReceptioner)
        VALUES
        (@id_f);
    ELSE 
     SET @f = "Pacient";
    END IF;
    IF @f = "Pacient"
    Then
    set @id_A = NULL;
    else
	SELECT @id_A := MAX(idAngajat) FROM Angajat;
    end if;
    INSERT INTO utilizator
	    (CNP, idAngajat ,Nume ,Prenume ,Pacient ,Adresa ,Nr_telefon ,Email ,Cont_IBAN ,Nr_Contact , Data_Angajarii , Functia )
	    VALUES
	    (CNP_utilizator,@id_A ,num ,pren ,Paci ,adrs ,nr_tel ,em ,IBAN,contact , Data_ang , @f  );
        
END$$

DELIMITER ;
;

USE `policlinica`;
CREATE  OR REPLACE VIEW `Profit_medic` AS select p.idUnitate as unit ,sm.Pret as profit,sm.durata as dur,m.idMedic, (a.Nr_Ore*a.Salariu_neg/10) as salar from servicii_medicale sm inner join consultatii using (idServicii_Medicale) inner join programarea p using (idConsultatii) inner join medic m using (idMedic) inner join angajat a using (idMedic);


USE `policlinica`;
DROP procedure IF EXISTS `drop_raport`;

DELIMITER $$
USE `policlinica`$$
CREATE PROCEDURE `drop_raport` (id int)
BEGIN
	Set @con := NULL, @sm := NULL;
	select @con:= idConsultatii from Consultatii;
	select @sm := idServicii_Medicale from Consultatii;
    delete from programarea where idConsultatii = @con;
    delete from consultatii where idConsultatii = @con;
    delete from Servicii_medicale where idServicii_Medicale = @sm;
    delete from raport where idRaport = id;
END$$

DELIMITER ;



DROP PROCEDURE if EXISTS `policlinica`.`drop_utilizator`;

delimiter //

CREATE PROCEDURE `policlinica`.`drop_utilizator`(CNP_U VARCHAR(13))
BEGIN
	
    SET @a= NULL,@f = NULL, @d = NULL;
    SELECT @a := u.idAngajat from utilizator u where u.CNP = CNP_U;
    Delete FROM orar where idAngajat = @a;
    Delete FROM concedii where idAngajat = @a;
    SELECT @f := u.Functia from utilizator u where u.CNP = CNP_U;
    IF @f = "medic" THEN
        Select @d := m.idMedic from medic m inner join angajat a using (idMedic) where a.idAngajat = @a;
    ELSEIF @f = "asistent medical" THEN
		Select @d := am.idAsistent_Medical from asistent_medical am inner join angajat a using (idAsistent_Medical) where a.idAngajat = @a;
    ELSEIF @f = "financiar cont" THEN
		Select @d := f.idExpert_financiar_cont from financiar_cont f inner join angajat a using (idExpert_financiar_cont) where a.idAngajat = @a;
    ELSEIF @f = "receptioner" THEN
		Select @d := r.idReceptioner from receptioner r inner join angajat a using (idReceptioner) where a.idAngajat = @a;
	ELSEIF @f = "administrator" THEN
		Select @d := r.idAdministrator from administrator ad inner join angajat a using (idAdministrator) where a.idAngajat = @a;
    ELSE 
     SET @f = " ";
    END IF;
    IF @f = "medic" THEN
        delete from Programarea where idMedic = @a;
        ELSEIF @f = "receptioner" THEN
        delete from Programarea where idReceptioner = @a;
        END IF;
    DELETE FROM `utilizator` u WHERE ( u.`CNP` = CNP_U);
    DELETE FROM angajat a WHERE a.idAngajat = @a;
	IF @f = "medic" THEN
        DELETE FROM medic  m WHERE m.idMedic = @d;
    ELSEIF @f = "asistent medical" THEN
        DELETE FROM  asistent_medical am  WHERE am.idAsistent_Medical = @d;
    ELSEIF @f = "financiar cont" THEN
        DELETE FROM  financiar_cont f WHERE f.idExpert_Financiar_Cont = @d;
    ELSEIF @f = "receptioner" THEN
        DELETE FROM  receptioner r WHERE r.idReceptioner = @d;
	ELSEIF @f = "administrator" THEN
        DELETE FROM  Administrator ad WHERE ad.idAdministrator = @d;
    ELSE 
     SET @f = " ";
    END IF;
        
END//

delimiter ;

DROP PROCEDURE IF EXISTS policlinica.cautaCNP_medic;

delimiter //

CREATE PROCEDURE policlinica.cautaCNP_medic(id_M INT)
BEGIN
	
    SELECT u.nume,u.prenume,u.CNP 
    FROM policlinica.medic m inner join policlinica.angajat a using (idMedic) inner join policlinica.utilizator u using (idAngajat) 
    where m.idMedic = id_M;


END//

delimiter ;


DROP PROCEDURE IF EXISTS policlinica.cautaCNP_asistent;

delimiter //

CREATE PROCEDURE policlinica.cautaCNP_asistent(id_a INT)
BEGIN
	
    SELECT u.nume,u.prenume,a.Salariu_neg,u.CNP 
    FROM policlinica.asistent_medical am inner join policlinica.angajat a using (idAsistent_Medical) inner join policlinica.utilizator u using (idAngajat) 
    where am.idAsistent_Medical = id_a;


END//

delimiter ;

USE `policlinica`;
DROP procedure IF EXISTS `policlinica`.`Raport`;


DELIMITER $$
USE `policlinica`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Raport`()
BEGIN
	Set @cnp_pct := NULL, @id_med := NULL, @id_as := NULL, @n := NULL,@a := NULL;
    select @n :=Max(idRaport) as nimic from raport;
	select @cnp_pct := CNP as CNP_pct ,@id_med := idMedic as idMedic, @id_as := idAsistent as idAsistent  from raport;
    SET @a :=  0 ;
      simple_loop: LOOP
         SET @a:=@a+1;
    select u.Nume as Nume_pct,u.Prenume as Prenume_pct,Email from utilizator u where CNP = @cnp_pct;
    select u.Nume as Nume_med, u.Prenume as Prenume_am, u.Email from Medic m inner join angajat a using (idMedic) inner join utilizator u using (idAngajat) where m.idMedic = @id_med;
    select u.Nume as Nume_am, u.Prenume as Prenume_am, u.Email from Asistent_Medical am inner join angajat a using (idAsistent_Medical) inner join utilizator u using (idAngajat) where am.idAsistent_Medical = @id_as;
    Select * from raport;
         IF @a=@n THEN
            LEAVE simple_loop;
         END IF;
   END LOOP simple_loop;
    
END$$

DELIMITER ;
;



DROP PROCEDURE IF EXISTS policlinica.cauta_medic;

delimiter //

CREATE PROCEDURE policlinica.cauta_medic(CNP_M VARCHAR(45))
BEGIN
	
    SELECT m.idMedic,m.Specialitate,u.nume,u.prenume,a.Salariu_neg
    FROM policlinica.medic m inner join policlinica.angajat a using (idMedic) inner join policlinica.utilizator u using (idAngajat) 
    where u.CNP = CNP_M;


END//

delimiter ;

DROP PROCEDURE if EXISTS `policlinica`.`alter_medic`;

delimiter //

CREATE PROCEDURE `policlinica`.`alter_medic`(idM INT, spec VARCHAR(45), Grad VARCHAR(45),Parafa INT,Comp VARCHAR(45),ST VARCHAR(45),Post_D VARCHAR(45), P_S INT, Ore INT, S_N FLOAT)
BEGIN
	
	UPDATE medic m SET m.Specialitate = spec, m.Gradul = Grad, m.Cod_Parafa = Parafa, m.Competente = Comp, m.Titlul_ST = ST, m.Post_Didactic = Post_D, m.Procent_Salariu = P_S  WHERE (`idMedic` = idM);
	UPDATE angajat a SET a.Nr_Ore = Ore, Salariu_neg = S_N WHERE idMedic = idM;
	
END//

delimiter ;



DROP PROCEDURE if EXISTS `policlinica`.`alter_assistent_medical`;

delimiter //

CREATE PROCEDURE `policlinica`.`alter_assistent_medical`(idAM INT, Tip VARCHAR(45), Grad VARCHAR(45), P_S INT, Ore INT, S_N FLOAT)
BEGIN
	
	UPDATE asistent_medical am SET am.Tipul = spec, am.Gradul = Grad, m.Procent_Salariu = P_S  WHERE (`idAsistent_Medical` = idAM);
	UPDATE angajat a SET a.Nr_Ore = Ore, Salariu_neg = S_N WHERE (`idAsistent_Medical` = idAM);
	
END//

delimiter ;

/*
DROP TRIGGER IF EXISTS `policlinica`.`raport_AFTER_UPDATE`;

DELIMITER $$
USE `policlinica`$$
CREATE DEFINER = CURRENT_USER TRIGGER `policlinica`.`raport_AFTER_UPDATE` AFTER UPDATE ON `raport` FOR EACH ROW
BEGIN
	set @id_r = NULL, @unitat = NULL,@id_m = NULL, @id_sm = NULL;
    SELECT @id_r := r.idRaport from Raport r where r.incheiat = 1;
    
    SELECT @id_sm := sm.idServicii_Medicale from Servicii_Medicale sm inner join consultatii c using (idServicii_Medicale) inner join raport r using (idRaport) where r.idRaport = @id_r;
	SELECT @unitat := un.Denumire  from unitati_medicale un inner join programarea p using (idUnitate) inner join servicii_medicale sm using (idServicii_Medicale) where sm.idServicii_Medicale = @id_sm;
    
    delete from policlinica.bon_fiscal where idBon;
    
    INSERT INTO bon_fiscal
	    ( idRaport,Unitate_medicala,Today,Pret)
	    VALUES
        (@id_r,@unitat,NOW(),12.5);

    
    
END$$
DELIMITER ;
*/


call policlinica.add_policlinica("Catena","Strada Mihail-Viteazu Nr.2","Farmacie","Luni-Vineri","8:00:00","17:00:00");
call policlinica.add_policlinica("Catena","Strada Mihail-Viteazu Nr.2","Farmacie","Luni-Vineri","8:00:00","17:00:00");
#call policlinica.drop_policlinica(2);
call policlinica.add_utilizator("1910503040567","Mihail","Sadoveanu",1,"Observator 1","0712389102", "mihaita.vecinu@utilzator.com", "RO14168271OTPCRT",017236,"2021-04-12","Pacient");
call policlinica.add_utilizator("5123456789012","Mihail","Sadoveanu",0,"Observator 1","0712389102", "mihaita.vecinu@utilzator.com", "RO14168271OTPCRT",017236,"2021-04-12","Receptioner");
call policlinica.add_utilizator("1","are","Sadoveanu",0,"Observator 1","0712389102", "are", "RO14168271OTPCRT",017236,"2021-04-12","Receptioner");
call policlinica.add_utilizator("3","Andrei","Sadoveanu",0,"Observator 1","0712311102", "andrei.sadoveanu@utilzator.com", "RO14168271OTPCRT",017236,"2021-04-12","Administrator");
call policlinica.add_utilizator("5","Bob","Wasabi",0,"Observator 1","0712311102", "bob@utilzator.com", "RO14168271OTPCRT",017236,"2021-04-12","Administrator");
call policlinica.add_utilizator("2","Bob2","Wasabi",0,"Observator 1","0712311102", "bob2@yahoo.com", "RO14168271OTPCRT",017236,"2021-04-12","Financiar Cont");
call policlinica.add_utilizator("21","Bob21","Wasabi",0,"Observator 1","0712311102", "bob21@yahoo.com", "RO14168271OTPCRT",017236,"2021-04-12","Financiar Cont");
call policlinica.add_utilizator("4","Alex","Sadoveanu",0,"Observator 1","0712311102", "alex.admin@utilzator.com", "RO14168271OTPCRT",017236,"2021-04-12","Administrator");
UPDATE Administrator  SET Super_Administrator = 0 where idAdministrator = 1;
UPDATE Administrator  SET Super_Administrator = 0 where idAdministrator = 3;
UPDATE Administrator  SET Super_Administrator = 1 where idAdministrator = 2;
UPDATE Financiar_Cont SET inspector = 0 where idExpert_Financiar_Cont = 1;
UPDATE Financiar_Cont SET inspector = 1 where idExpert_Financiar_Cont = 2;
call policlinica.cauta_medic("9012378013121");
call policlinica.cautaCNP_medic(8);
call policlinica.alter_medic(8,"Doctor8","2",2389,"Om invatat","Titlu special", "Invatator la nubi",12,6,17.36);
call policlinica.add_utilizator("9012378013321","Mihail","Sadoveanu",0,"Observator 1","0712389102", "mihaita.vecinu@utilzator.com", "RO14168271OTPCRT",017236,"2021-04-12","Asistent medical");

#call new_procedure();

        INSERT INTO policlinica.Orar (idAngajat, idUnitate, Ziua, Ora_inceput, Ora_sfarsit) 
VALUES (1, 1, "Luni", "09:00:00", "17:00:00"), 
       (1, 1, "Marti", "09:00:00", "17:00:00"), 
       (1, 1, "Miercuri", "09:00:00", "17:00:00"), 
       (1, 1, "Joi", "09:00:00", "17:00:00"), 
       (1, 1, "Vineri", "09:00:00", "17:00:00"), 
       (2, 2, "Luni", "09:00:00", "17:00:00"), 
       (2, 2, "Marti", "09:00:00", "17:00:00"), 
       (2, 2, "Miercuri", "09:00:00", "17:00:00"), 
       (2, 2, "Joi", "09:00:00", "17:00:00"), 
       (2, 2, "Vineri", "09:00:00", "17:00:00"), 
       (3, 3, "Luni", "09:00:00", "17:00:00"), 
       (3, 3, "Marti", "09:00:00", "17:00:00"), 
       (3, 3, "Miercuri", "09:00:00", "17:00:00"),
       (4, 4, "Luni", "09:00:00", "17:00:00"), 
       (4, 4, "Marti", "09:00:00", "17:00:00"), 
       (4, 4, "Miercuri", "09:00:00", "17:00:00"),
       (5, 5, "Luni", "09:00:00", "17:00:00"), 
       (5, 5, "Marti", "09:00:00", "17:00:00"), 
       (5, 5, "Miercuri", "09:00:00", "17:00:00"),
       (6, 6, "Luni", "09:00:00", "17:00:00"), 
       (6, 6, "Marti", "09:00:00", "17:00:00"), 
       (6, 6, "Miercuri", "09:00:00", "17:00:00"),
       (7, 7, "Luni", "09:00:00", "17:00:00"), 
       (7, 7, "Marti", "09:00:00", "17:00:00"), 
       (7, 7, "Miercuri", "09:00:00", "17:00:00"),
       (8, 8, "Luni", "09:00:00", "17:00:00"), 
       (8, 8, "Marti", "09:00:00", "17:00:00"),
(8, 8, "Miercuri", "09:00:00", "17:00:00"),
(9, 1, "Luni", "09:00:00", "17:00:00"),
(9, 1, "Marti", "09:00:00", "17:00:00"),
(9, 1, "Miercuri", "09:00:00", "17:00:00"),
(10, 2, "Luni", "09:00:00", "17:00:00"),
(10, 2, "Marti", "09:00:00", "17:00:00"),
(10, 2, "Miercuri", "09:00:00", "17:00:00"),
(11, 3, "Luni", "09:00:00", "17:00:00"),
(11, 3, "Marti", "09:00:00", "17:00:00"),
(11, 3, "Miercuri", "09:00:00", "17:00:00"),
(12, 4, "Luni", "09:00:00", "17:00:00"),
(12, 4, "Marti", "09:00:00", "17:00:00"),
(12, 4, "Miercuri", "09:00:00", "17:00:00"),
(13, 5, "Luni", "09:00:00", "17:00:00"),
(13, 5, "Marti", "09:00:00", "17:00:00"),
(13, 5, "Miercuri", "09:00:00", "17:00:00");


INSERT INTO policlinica.concedii ( idAngajat, Data_inceput, Data_final) 
VALUES (1, "2022-01-01", "2022-01-10"), 
(2, "2022-02-01", "2022-02-14"), 
( 3, "2022-03-01", "2022-03-20"), 
( 4, "2022-04-01", "2022-04-15"), 
( 5, "2022-05-01", "2022-05-31"), 
( 6, "2022-06-01", "2022-06-15"), 
( 7, "2022-07-01", "2022-07-31"), 
( 8, "2022-08-01", "2022-08-15"), 
( 9, "2022-09-01", "2022-09-30"), 
( 10, "2022-10-01", "2022-10-15"), 
( 11, "2022-11-01", "2022-11-30"), 
( 12, "2022-12-01", "2022-12-15"), 
( 13, "2023-01-01", "2023-01-31");

  
INSERT INTO policlinica.concedii ( idAngajat, Data_inceput, Data_final) 
VALUES (1, "2022-01-01", "2022-01-10"), 
(2, "2022-02-01", "2022-02-14"), 
( 3, "2022-03-01", "2022-03-20"), 
( 4, "2022-04-01", "2022-04-15"), 
( 5, "2022-05-01", "2022-05-31"), 
( 6, "2022-06-01", "2022-06-15"), 
( 7, "2022-07-01", "2022-07-31"), 
( 8, "2022-08-01", "2022-08-15"), 
( 9, "2022-09-01", "2022-09-30"), 
( 10, "2022-10-01", "2022-10-15"), 
( 11, "2022-11-01", "2022-11-30"), 
( 12, "2022-12-01", "2022-12-15"), 
( 13, "2023-01-01", "2023-01-31");

INSERT INTO `policlinica`.`servicii_medicale` (`Specialitate`, `Necesitate_competente`, `Pret`, `Durata`) 
VALUES ('Cardiologie', 'ECG, ecocardiografie', 100, 30),
('Ortopedie', 'Radiografie, consultatie', 150, 60),
('Pediatrie', 'Consultatie, vaccinare', 50, 15),
('Chirurgie', 'Anestezie, interventie chirurgicala', 1000, 180),
('Ginecologie', 'Consultatie, ecografie', 80, 45);

INSERT INTO `asistent_medical` (`Tipul`, `Gradul`)
VALUES ('asistent medical generalist', 'asistent'),
       ('asistent medical de farmacie', 'asistent'),
       ('asistent medical dentar', 'asistent'),
       ('asistent medical igiena', 'asistent'),
	   ('tehnician medical', 'tehnician'),
       ('tehnician radiolog', 'tehnician'),
       ('tehnician laborator', 'tehnician'),
       ('tehnician anestezist', 'tehnician');
       
      INSERT INTO `policlinica`.`Raport` (`CNP`, `idMedic`, `idAsistent`, `data_consult`, `simptome`, `diagnostic`, `recomandari`, `tip_raport`, `incheiat`) 
VALUES ('1910503040567', 6, 2, '2022-01-01', 'Dureri de cap, ameteala', 'Hipertensiune arteriala', 'Control medical lunar, tratament medicamentos', 'Consultatie', 1),
('2910503040567', 2, 1, '2022-02-01', 'Dureri de spate, amorteala picioarelor', 'Sciatica', 'Fizioterapie, tratament medicamentos', 'Interventie chirurgicala', 0),
('2910503040567', 2, 1, '2022-03-01', 'Dureri articulare, oboseala', 'Reumatism', 'Fizioterapie, tratament medicamentos', 'Consultatie', 1);

INSERT INTO `policlinica`.`consultatii` (`idServicii_Medicale`, `idRaport`, `Rezultat`) 
VALUES (1, 1, 'ECG normal, nu sunt probleme cardiace'),
(2, 2, 'Fractura de radius, se recomanda imobilizare si kinetoterapie'),
(3, 3, 'Vaccinarea copilului a fost efectuata cu succes'),
(4, 4, 'Interventia chirurgicala a fost efectuata cu succes, recuperare rapida'),
(5, 5, 'Sarcina se afla in evolutie normala, se recomanda urmatoarea ecografie in saptamana 32');

INSERT INTO `policlinica`.`programarea`(idMedic, idReceptioner, idUnitate, idConsultatii, Nume_Pacient, Prenume_Pacient, CNP_Pacient, Inceput_Prog, Final_Prog, Today)
VALUES (1, 1, 1, 1, 'John', 'Doe', '123456789', '09:00:00', '10:00:00', '2022-01-01'),
(2, 1, 2, 2, 'Mihail', 'Sadoveanu', '1910503040567', '10:30:00', '11:30:00', '2022-01-02'),
(3, 1, 3, 3, 'Codrean', 'Andreea', '6231201019111', '12:00:00', '13:00:00', '2022-01-03'),
(4, 1, 4, 4, 'Mancas', 'Paula', '1910807422344', '14:00:00', '15:00:00', '2022-01-04');

