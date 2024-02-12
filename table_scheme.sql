CREATE TABLE adresa (
	id_adresa SERIAL NOT NULL,
	cislo VARCHAR(256) NOT NULL,
	ulice VARCHAR(256) NOT NULL
);
ALTER TABLE adresa ADD CONSTRAINT pk_adresa PRIMARY KEY (id_adresa);
 
CREATE TABLE dochazka (
	id_dochazka SERIAL NOT NULL,
	id_student INTEGER NOT NULL,
	mesic VARCHAR(256) NOT NULL,
	procento_dochazky SMALLINT NOT NULL
);
ALTER TABLE dochazka ADD CONSTRAINT pk_dochazka PRIMARY KEY (id_dochazka);
 
CREATE TABLE konzultace (
	id_konzultace SERIAL NOT NULL,
	id_student INTEGER NOT NULL,
	datum DATE NOT NULL,
	doba TIME NOT NULL
);
ALTER TABLE konzultace ADD CONSTRAINT pk_konzultace PRIMARY KEY (id_konzultace);
 
CREATE TABLE kurator (
	id_kurator SERIAL NOT NULL,
	jazyk VARCHAR(256) NOT NULL,
	jmeno VARCHAR(256) NOT NULL,
	prijmeni VARCHAR(256) NOT NULL,
	telefonni_cislo VARCHAR(20) NOT NULL
);
ALTER TABLE kurator ADD CONSTRAINT pk_kurator PRIMARY KEY (id_kurator);
 
CREATE TABLE lektor (
	id_lektor SERIAL NOT NULL,
	email VARCHAR(256) NOT NULL,
	jmeno VARCHAR(70) NOT NULL,
	prijmeni VARCHAR(70) NOT NULL
);
ALTER TABLE lektor ADD CONSTRAINT pk_lektor PRIMARY KEY (id_lektor);
 
CREATE TABLE mistnost (
	id_mistnost SERIAL NOT NULL,
	id_univerzita INTEGER NOT NULL,
	cislo_mistnosti SMALLINT NOT NULL,
	kapacita SMALLINT NOT NULL
);
ALTER TABLE mistnost ADD CONSTRAINT pk_mistnost PRIMARY KEY (id_mistnost);
 
CREATE TABLE skupina (
	id_skupina SERIAL NOT NULL,
	id_mistnost INTEGER NOT NULL,
	id_lektor INTEGER NOT NULL,
	konec TIME NOT NULL,
	zacatek TIME NOT NULL
);
ALTER TABLE skupina ADD CONSTRAINT pk_skupina PRIMARY KEY (id_skupina);
 
CREATE TABLE student (
	id_student SERIAL NOT NULL,
	id_adresa INTEGER NOT NULL,
	id_kurator INTEGER NOT NULL,
	id_skupina INTEGER,
	datum_narozeni DATE NOT NULL,
	jazyk VARCHAR(30) NOT NULL,
	jmeno VARCHAR(70) NOT NULL,
	prijmeni VARCHAR(70) NOT NULL,
	telefonni_cislo VARCHAR(20) NOT NULL,
	discount NUMERIC DEFAULT 0,
	balance NUMERIC DEFAULT 0
);
ALTER TABLE student ADD CONSTRAINT pk_student PRIMARY KEY (id_student);
 
CREATE TABLE univerzita (
	id_univerzita SERIAL NOT NULL,
	id_adresa INTEGER NOT NULL,
	nazev VARCHAR(256) NOT NULL
);
ALTER TABLE univerzita ADD CONSTRAINT pk_univerzita PRIMARY KEY (id_univerzita);
ALTER TABLE univerzita ADD CONSTRAINT u_fk_univerzita_adresa UNIQUE (id_adresa);
 
CREATE TABLE vylet (
	id_vylet SERIAL NOT NULL,
	datum DATE NOT NULL,
	mesto VARCHAR(256) NOT NULL
);
ALTER TABLE vylet ADD CONSTRAINT pk_vylet PRIMARY KEY (id_vylet);
 
CREATE TABLE vylet_student (
	id_student INTEGER NOT NULL,
	id_vylet INTEGER NOT NULL
);

CREATE TABLE student_audit_log (
    id SERIAL PRIMARY KEY,
    id_student INTEGER,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(256)
);