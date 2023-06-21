# Creación de esquema y tablas

CREATE SCHEMA hospital_prueba;
USE hospital_prueba;

CREATE TABLE medical_plan(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE provinces(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE cities(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE adresses(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    adress_line VARCHAR(50) NOT NULL,
    cp VARCHAR(15) NOT NULL,
    province_id INT NOT NULL,
    city_id INT NOT NULL,
		FOREIGN KEY (province_id) REFERENCES provinces(id),
        FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE contacts(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE patients(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    document VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    sex VARCHAR(10) NOT NULL,
    contact_id INT NOT NULL UNIQUE,
    adress_id INT NOT NULL UNIQUE,
    medical_plan_id INT NOT NULL,
		FOREIGN KEY (medical_plan_id) REFERENCES medical_plan(id),
		FOREIGN KEY (contact_id) REFERENCES contacts(id),
		FOREIGN KEY (adress_id) REFERENCES adresses(id)
);

CREATE TABLE doctors(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    document VARCHAR(50) NOT NULL
);

CREATE TABLE specialities(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    speciality_name VARCHAR(50) NOT NULL
);

CREATE TABLE doctor_specialities(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    speciality_id INT NOT NULL,
		FOREIGN KEY (doctor_id) REFERENCES doctors(id),
		FOREIGN KEY (speciality_id) REFERENCES specialities(id)
);

CREATE TABLE consultations(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    consultation_date DATE NOT NULL,
    notes TEXT(1000),
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
		FOREIGN KEY (patient_id) REFERENCES patients(id),
		FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

CREATE TABLE prescriptions(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    consultation_id INT NOT NULL,
	notes TEXT(1000),
		FOREIGN KEY (consultation_id) REFERENCES consultations(id)
);

CREATE TABLE medicines(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    medicine_laboratory VARCHAR(50) NOT NULL,
    description text(500)
);

CREATE TABLE prescripted_medicines(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT NOT NULL,
    prescription_id INT NOT NULL,
    FOREIGN KEY (medicine_id) REFERENCES medicines(id),
    FOREIGN KEY (prescription_id) REFERENCES prescriptions(id)
);

CREATE TABLE _log (
	id INT PRIMARY KEY auto_increment,
    entity varchar(100),
    entity_id int,
    insert_dt datetime,
    created_by varchar(100),
    last_update_dt datetime,
    last_updated_by varchar(100)
);

# Inserción de datos

#insert de datos de obras sociales
insert into medical_plan (name) values ('Particular');
insert into medical_plan (name) values ('Swiss Medical');
insert into medical_plan (name) values ('OSDE');
insert into medical_plan (name) values ('Galeno');
insert into medical_plan (name) values ('Medicus');
insert into medical_plan (name) values ('Omint');
insert into medical_plan (name) values ('Sancor Salud');
insert into medical_plan (name) values ('Medifé');
insert into medical_plan (name) values ('Prevención Salud');
insert into medical_plan (name) values ('Accord Salud');
insert into medical_plan (name) values ('Federada Salud');

#insert de datos de provincias
insert into provinces (id, name) values (1, 'Buenos Aires');
insert into provinces (id, name) values (2, 'Catamarca');
insert into provinces (id, name) values (3, 'Chaco');
insert into provinces (id, name) values (4, 'Chubut');
insert into provinces (id, name) values (5, 'Córdoba');
insert into provinces (id, name) values (6, 'Corrientes');
insert into provinces (id, name) values (7, 'Entre Ríos');
insert into provinces (id, name) values (8, 'Formosa');
insert into provinces (id, name) values (9, 'Jujuy');
insert into provinces (id, name) values (10, 'La Pampa');
insert into provinces (id, name) values (11, 'La Rioja');
insert into provinces (id, name) values (12, 'Mendoza');
insert into provinces (id, name) values (13, 'Misiones');
insert into provinces (id, name) values (14, 'Neuquén');
insert into provinces (id, name) values (15, 'Río Negro');
insert into provinces (id, name) values (16, 'Salta');
insert into provinces (id, name) values (17, 'San Juan');
insert into provinces (id, name) values (18, 'San Luis');
insert into provinces (id, name) values (19, 'Santa Cruz');
insert into provinces (id, name) values (20, 'Santa Fe');
insert into provinces (id, name) values (21, 'Santiago del Estero');
insert into provinces (id, name) values (22, 'Tierra del Fuego');
insert into provinces (id, name) values (23, 'Tucumán');

#insert de datos de ciudades
insert into cities (id, name) values (1, 'La Falda');
insert into cities (id, name) values (2, 'Capilla del Monte');
insert into cities (id, name) values (3, 'Cruz del Eje');
insert into cities (id, name) values (4, 'Villa Giardino');
insert into cities (id, name) values (5, 'Villa de Soto');
insert into cities (id, name) values (6, 'Huerta Grande');
insert into cities (id, name) values (7, 'Valle Hermoso');
insert into cities (id, name) values (8, 'Villa Carlos Paz');
insert into cities (id, name) values (9, 'Tanti');
insert into cities (id, name) values (10, 'Villa General Belgrano');
insert into cities (id, name) values (11, 'Cosquín');
insert into cities (id, name) values (12, 'Casa Grande');

#insert de datos de direcciones
insert into adresses (id, adress_line, cp, province_id, city_id) values (1, 'Calle 1 123', 4146, 5, 5);
insert into adresses (id, adress_line, cp, province_id, city_id) values (2, 'Avenida 2 456', 6240, 5, 2);
insert into adresses (id, adress_line, cp, province_id, city_id) values (3, 'Calle 3 789', 4938, 14, 5);
insert into adresses (id, adress_line, cp, province_id, city_id) values (4, 'Calle 4 321', 2920, 16, 5);
insert into adresses (id, adress_line, cp, province_id, city_id) values (5, 'Avenida 5 654', 1711, 5, 5);
insert into adresses (id, adress_line, cp, province_id, city_id) values (6, 'Calle 6 987', 3550, 22, 5);
insert into adresses (id, adress_line, cp, province_id, city_id) values (7, 'Avenida 7 1234', 9466, 5, 6);
insert into adresses (id, adress_line, cp, province_id, city_id) values (8, 'Calle 8 567', 2824, 5, 5);
insert into adresses (id, adress_line, cp, province_id, city_id) values (9, 'Calle 9 890', 1811, 5, 7);
insert into adresses (id, adress_line, cp, province_id, city_id) values (10, 'Avenida 10 123', 7880, 5, 8);
insert into adresses (id, adress_line, cp, province_id, city_id) values (11, 'Calle 11 456', 4974, 5, 9);
insert into adresses (id, adress_line, cp, province_id, city_id) values (12, 'Calle 12 789', 9307, 4, 1);
insert into adresses (id, adress_line, cp, province_id, city_id) values (13, 'Avenida 13 321', 8186, 10, 1);
insert into adresses (id, adress_line, cp, province_id, city_id) values (14, 'Calle 14 654', 2719, 19, 5);
insert into adresses (id, adress_line, cp, province_id, city_id) values (15, 'Avenida 15 987', 6131, 7, 6);
insert into adresses (id, adress_line, cp, province_id, city_id) values (16, 'Calle 16 1234', 6795, 3, 2);
insert into adresses (id, adress_line, cp, province_id, city_id) values (17, 'Calle 17 567', 3528, 22, 2);
insert into adresses (id, adress_line, cp, province_id, city_id) values (18, 'Avenida 18 890', 1901, 7, 2);
insert into adresses (id, adress_line, cp, province_id, city_id) values (19, 'Calle 19 123', 2292, 17, 1);
insert into adresses (id, adress_line, cp, province_id, city_id) values (20, 'Avenida 20 456', 7785, 15, 1);

#insert de datos de contactos
insert into contacts (id, phone, email) values (1, '1006247206', 'atavener0@bravesites.com');
insert into contacts (id, phone, email) values (2, '5604558035', 'gwhitlow1@qq.com');
insert into contacts (id, phone, email) values (3, '2528527949', 'kgotling2@cbsnews.com');
insert into contacts (id, phone, email) values (4, '6622961606', 'fmcavey3@seesaa.net');
insert into contacts (id, phone, email) values (5, '7038096800', 'ggreveson4@yellowbook.com');
insert into contacts (id, phone, email) values (6, '2487106413', 'lkyneton5@archive.org');
insert into contacts (id, phone, email) values (7, '4845864979', 'bmordecai6@cmu.edu');
insert into contacts (id, phone, email) values (8, '2054081564', 'sshrimptone7@shutterfly.com');
insert into contacts (id, phone, email) values (9, '2524378397', 'cclyma8@mozilla.org');
insert into contacts (id, phone, email) values (10, '9007379675', 'csivills9@mapquest.com');
insert into contacts (id, phone, email) values (11, '3455136704', 'pleblanca@hp.com');
insert into contacts (id, phone, email) values (12, '8169476174', 'hgenthnerb@pcworld.com');
insert into contacts (id, phone, email) values (13, '4489104305', 'gdawidowitzc@wikimedia.org');
insert into contacts (id, phone, email) values (14, '9931002640', 'rwitterd@furl.net');
insert into contacts (id, phone, email) values (15, '1674139795', 'khempele@ucoz.com');
insert into contacts (id, phone, email) values (16, '4233846211', 'bchreef@economist.com');
insert into contacts (id, phone, email) values (17, '2329334325', 'gnodeg@tuttocitta.it');
insert into contacts (id, phone, email) values (18, '9884369313', 'jstrephanh@pinterest.com');
insert into contacts (id, phone, email) values (19, '1497461163', 'acurzeyi@tripod.com');
insert into contacts (id, phone, email) values (20, '5491204689', 'mdonhardtj@t-online.de');

#insert de datos de pacientes
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (1, 'Sofía', 'García', 11960611, '1965-10-10', 'Femenino', 1, 1, 1);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (2, 'Mateo', 'Martínez', 21103500, '1981-12-10', 'Femenino', 2, 2, 6);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (3, 'Valentina', 'López', 38563788, '2003-03-20', 'Femenino', 3, 3, 7);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (4, 'Lucas', 'González', 42727248, '1988-05-09', 'Masculino', 4, 4, 4);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (5, 'Isabella', 'Hernández', 28935694, '2001-08-04', 'Femenino', 5, 5, 5);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (6, 'Santiago', 'Pérez', 44283182, '1975-08-03', 'Femenino', 6, 6, 1);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (7, 'Camila', 'Rodríguez', 38267540, '1961-06-10', 'Masculino', 7, 7, 2);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (8, 'Benjamín', 'Sánchez', 22041430, '1995-09-18', 'Masculino', 8, 8, 8);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (9, 'Mía', 'Ramírez', 20989786, '1998-09-10', 'Femenino', 9, 9, 4);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (10, 'Samuel', 'Flores', 44639036, '2005-01-30', 'Masculino', 10, 10, 8);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (11, 'Emma', 'Torres', 14949665, '1960-11-24', 'Femenino', 11, 11, 4);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (12, 'Daniel', 'Díaz', 39017278, '1991-04-22', 'Masculino', 12, 12, 1);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (13, 'Victoria', 'Moreno', 13644322, '1967-06-15', 'Femenino', 13, 13, 2);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (14, 'David', 'Álvarez', 11322650, '1998-04-28', 'Masculino', 14, 14, 3);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (15, 'María', 'Ruiz', 40893363, '1984-03-11', 'Femenino', 15, 15, 2);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (16, 'Alejandro', 'Mendoza', 35124098, '2000-02-15', 'Masculino', 16, 16, 4);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (17, 'Martina', 'Castro', 28319710, '1962-06-12', 'Femenino', 17, 17, 7);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (18, 'José', 'Vargas', 33186044, '1967-10-31', 'Femenino', 18, 18, 7);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (19, 'Renata', 'Fernández', 26446427, '1961-05-09', 'Femenino', 19, 19, 1);
insert into patients (id, first_name, last_name, document, birthdate, sex, contact_id, adress_id, medical_plan_id) values (20, 'Juan', 'Rojas', 44620469, '1965-09-08', 'Masculino', 20, 20, 3);

#insert de datos de doctores
insert into doctors (id, first_name, last_name, document) values (1, 'Gayle', 'Heather', 23883663);
insert into doctors (id, first_name, last_name, document) values (2, 'Mahalia', 'Wealthall', 17730213);
insert into doctors (id, first_name, last_name, document) values (3, 'Astrix', 'Malling', 25930054);
insert into doctors (id, first_name, last_name, document) values (4, 'Alisha', 'Copas', 35852920);
insert into doctors (id, first_name, last_name, document) values (5, 'Alexi', 'Caton', 36573583);
insert into doctors (id, first_name, last_name, document) values (6, 'Aldwin', 'Sivier', 46744939);
insert into doctors (id, first_name, last_name, document) values (7, 'Klarrisa', 'Marchant', 33403145);
insert into doctors (id, first_name, last_name, document) values (8, 'Lionel', 'Shelmardine', 41803875);
insert into doctors (id, first_name, last_name, document) values (9, 'Adiana', 'Boscott', 28699431);
insert into doctors (id, first_name, last_name, document) values (10, 'Ilysa', 'Keri', 28471714);
insert into doctors (id, first_name, last_name, document) values (11, 'Ludovico', 'Kilgannon', 17368845);
insert into doctors (id, first_name, last_name, document) values (12, 'Tibold', 'Henri', 18866316);
insert into doctors (id, first_name, last_name, document) values (13, 'Marchelle', 'Pavlenkov', 21199680);
insert into doctors (id, first_name, last_name, document) values (14, 'Ross', 'Erwin', 13029779);
insert into doctors (id, first_name, last_name, document) values (15, 'Benni', 'Mustill', 14229305);
insert into doctors (id, first_name, last_name, document) values (16, 'Noe', 'Barbary', 22503719);
insert into doctors (id, first_name, last_name, document) values (17, 'Barney', 'Greswell', 27759338);
insert into doctors (id, first_name, last_name, document) values (18, 'Keslie', 'Ivanenko', 27200565);
insert into doctors (id, first_name, last_name, document) values (19, 'Kaleena', 'Purveys', 28883309);
insert into doctors (id, first_name, last_name, document) values (20, 'Bunni', 'Rummings', 24262541);

#insert de datos de especialidades
insert into specialities (id, speciality_name) values (1, 'Cardiología');
insert into specialities (id, speciality_name) values (2, 'Dermatología');
insert into specialities (id, speciality_name) values (3, 'Endocrinología');
insert into specialities (id, speciality_name) values (4, 'Gastroenterología');
insert into specialities (id, speciality_name) values (5, 'Hematología');
insert into specialities (id, speciality_name) values (6, 'Neurología');
insert into specialities (id, speciality_name) values (7, 'Oftalmología');
insert into specialities (id, speciality_name) values (8, 'Oncología');
insert into specialities (id, speciality_name) values (9, 'Pediatría');
insert into specialities (id, speciality_name) values (10, 'Psiquiatría');

#insert de datos de relaciones de doctores y especialidades
insert into doctor_specialities (id, doctor_id, speciality_id) values (1, 10, 2);
insert into doctor_specialities (id, doctor_id, speciality_id) values (2, 14, 6);
insert into doctor_specialities (id, doctor_id, speciality_id) values (3, 13, 8);
insert into doctor_specialities (id, doctor_id, speciality_id) values (4, 15, 7);
insert into doctor_specialities (id, doctor_id, speciality_id) values (5, 19, 3);
insert into doctor_specialities (id, doctor_id, speciality_id) values (6, 10, 3);
insert into doctor_specialities (id, doctor_id, speciality_id) values (7, 18, 3);
insert into doctor_specialities (id, doctor_id, speciality_id) values (8, 4, 8);
insert into doctor_specialities (id, doctor_id, speciality_id) values (9, 18, 8);
insert into doctor_specialities (id, doctor_id, speciality_id) values (10, 16, 10);
insert into doctor_specialities (id, doctor_id, speciality_id) values (11, 4, 4);
insert into doctor_specialities (id, doctor_id, speciality_id) values (12, 15, 4);
insert into doctor_specialities (id, doctor_id, speciality_id) values (13, 10, 1);
insert into doctor_specialities (id, doctor_id, speciality_id) values (14, 8, 3);
insert into doctor_specialities (id, doctor_id, speciality_id) values (15, 16, 8);
insert into doctor_specialities (id, doctor_id, speciality_id) values (16, 20, 1);
insert into doctor_specialities (id, doctor_id, speciality_id) values (17, 9, 4);
insert into doctor_specialities (id, doctor_id, speciality_id) values (18, 17, 2);
insert into doctor_specialities (id, doctor_id, speciality_id) values (19, 9, 9);
insert into doctor_specialities (id, doctor_id, speciality_id) values (20, 3, 9);
insert into doctor_specialities (id, doctor_id, speciality_id) values (21, 16, 10);
insert into doctor_specialities (id, doctor_id, speciality_id) values (22, 15, 6);
insert into doctor_specialities (id, doctor_id, speciality_id) values (23, 6, 2);
insert into doctor_specialities (id, doctor_id, speciality_id) values (24, 19, 3);
insert into doctor_specialities (id, doctor_id, speciality_id) values (25, 4, 4);
insert into doctor_specialities (id, doctor_id, speciality_id) values (26, 7, 9);
insert into doctor_specialities (id, doctor_id, speciality_id) values (27, 10, 3);
insert into doctor_specialities (id, doctor_id, speciality_id) values (28, 9, 10);
insert into doctor_specialities (id, doctor_id, speciality_id) values (29, 8, 8);
insert into doctor_specialities (id, doctor_id, speciality_id) values (30, 1, 3);

#insert de datos de consultas
insert into consultations (id, consultation_date, patient_id, doctor_id) values (1, '2022-05-14', 8, 1);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (2, '2023-04-17', 1, 10);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (3, '2022-08-13', 14, 17);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (4, '2022-11-12', 5, 4);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (5, '2023-02-25', 1, 4);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (6, '2022-11-23', 11, 11);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (7, '2022-04-26', 10, 2);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (8, '2022-10-29', 9, 1);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (9, '2022-09-23', 1, 5);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (10, '2022-05-30', 4, 11);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (11, '2022-10-30', 4, 6);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (12, '2022-05-27', 12, 7);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (13, '2022-05-24', 6, 9);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (14, '2022-08-16', 18, 1);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (15, '2023-02-09', 9, 10);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (16, '2023-01-05', 5, 19);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (17, '2022-06-21', 10, 14);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (18, '2022-04-28', 17, 12);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (19, '2022-12-24', 17, 8);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (20, '2022-10-25', 6, 12);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (21, '2023-03-25', 3, 4);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (22, '2022-05-19', 1, 8);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (23, '2022-10-03', 1, 15);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (24, '2023-03-12', 3, 20);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (25, '2022-10-05', 2, 10);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (26, '2022-06-09', 3, 10);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (27, '2022-04-26', 1, 7);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (28, '2023-03-16', 12, 9);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (29, '2022-12-03', 15, 14);
insert into consultations (id, consultation_date, patient_id, doctor_id) values (30, '2023-01-02', 8, 2);

#insert de datos de recetas
insert into prescriptions (id, consultation_id) values (1, 29);
insert into prescriptions (id, consultation_id) values (2, 24);
insert into prescriptions (id, consultation_id) values (3, 26);
insert into prescriptions (id, consultation_id) values (4, 15);
insert into prescriptions (id, consultation_id) values (5, 7);
insert into prescriptions (id, consultation_id) values (6, 17);
insert into prescriptions (id, consultation_id) values (7, 9);
insert into prescriptions (id, consultation_id) values (8, 19);
insert into prescriptions (id, consultation_id) values (9, 1);
insert into prescriptions (id, consultation_id) values (10, 16);
insert into prescriptions (id, consultation_id) values (11, 21);
insert into prescriptions (id, consultation_id) values (12, 27);
insert into prescriptions (id, consultation_id) values (13, 3);
insert into prescriptions (id, consultation_id) values (14, 14);
insert into prescriptions (id, consultation_id) values (15, 8);
insert into prescriptions (id, consultation_id) values (16, 28);
insert into prescriptions (id, consultation_id) values (17, 5);
insert into prescriptions (id, consultation_id) values (18, 14);
insert into prescriptions (id, consultation_id) values (19, 30);
insert into prescriptions (id, consultation_id) values (20, 28);

#insert de datos de medicamentos
insert into medicines (id, name, medicine_laboratory) values (1, 'Paracetamol', 'Lab. Clínico San José');
insert into medicines (id, name, medicine_laboratory) values (2, 'Ibuprofeno', 'Lab. Médico Ramírez');
insert into medicines (id, name, medicine_laboratory) values (3, 'Aspirina', 'Lab. Clínico Martínez');
insert into medicines (id, name, medicine_laboratory) values (4, 'Amoxicilina', 'Lab. Clínico San Rafael');
insert into medicines (id, name, medicine_laboratory) values (5, 'Diclofenaco', 'Lab. Médico Ramírez');
insert into medicines (id, name, medicine_laboratory) values (6, 'Omeprazol', 'Lab. Médico Ramírez');
insert into medicines (id, name, medicine_laboratory) values (7, 'Loratadina', 'Lab. Clínico San Rafael');
insert into medicines (id, name, medicine_laboratory) values (8, 'Clonazepam', 'Lab. Clínico Martínez');
insert into medicines (id, name, medicine_laboratory) values (9, 'Diazepam', 'Lab. Clínico San Rafael');
insert into medicines (id, name, medicine_laboratory) values (10, 'Ciprofloxacino', 'Lab. Clínico García');
insert into medicines (id, name, medicine_laboratory) values (11, 'Metronidazol', 'Lab. Médico Pasteur');
insert into medicines (id, name, medicine_laboratory) values (12, 'Fluconazol', 'Lab. Clínico San Rafael');
insert into medicines (id, name, medicine_laboratory) values (13, 'Acetaminofén', 'Lab. Médico López');
insert into medicines (id, name, medicine_laboratory) values (14, 'Naproxeno', 'Lab. Clínico Santa María');
insert into medicines (id, name, medicine_laboratory) values (15, 'Ketorolaco', 'Lab. Médico López');
insert into medicines (id, name, medicine_laboratory) values (16, 'Furosemida', 'Lab. Médico Ramírez');
insert into medicines (id, name, medicine_laboratory) values (17, 'Losartán', 'Lab. Médico Pasteur');
insert into medicines (id, name, medicine_laboratory) values (18, 'Enalapril', 'Lab. Médico López');
insert into medicines (id, name, medicine_laboratory) values (19, 'Simvastatina', 'Lab. Médico Ramírez');
insert into medicines (id, name, medicine_laboratory) values (20, 'Levotiroxina', 'Lab. Clínico García');
insert into medicines (id, name, medicine_laboratory) values (21, 'Metformina', 'Lab. Clínico Santa María');
insert into medicines (id, name, medicine_laboratory) values (22, 'Insulina', 'Lab. Médico López');
insert into medicines (id, name, medicine_laboratory) values (23, 'Salbutamol', 'Lab. Clínico Martínez');
insert into medicines (id, name, medicine_laboratory) values (24, 'Bromhexina', 'Lab. Médico Ramírez');
insert into medicines (id, name, medicine_laboratory) values (25, 'Ambroxol', 'Lab. Clínico San José');
insert into medicines (id, name, medicine_laboratory) values (26, 'Dextrometorfano', 'Lab. Clínico Santa María');
insert into medicines (id, name, medicine_laboratory) values (27, 'Guaifenesina', 'Lab. Médico Hernández');
insert into medicines (id, name, medicine_laboratory) values (28, 'Ranitidina', 'Lab. Médico Ramírez');
insert into medicines (id, name, medicine_laboratory) values (29, 'Pantoprazol', 'Lab. Clínico Martínez');
insert into medicines (id, name, medicine_laboratory) values (30, 'Metoclopramida', 'Lab. Clínico San Rafael');

#insert de datos de relaciones de medicamentos y recetas
insert into prescripted_medicines (id, medicine_id, prescription_id) values (1, 10, 1);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (2, 14, 8);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (3, 16, 19);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (4, 6, 15);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (5, 6, 8);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (6, 12, 9);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (7, 10, 17);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (8, 7, 6);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (9, 14, 18);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (10, 11, 4);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (11, 7, 13);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (12, 1, 7);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (13, 16, 14);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (14, 4, 19);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (15, 8, 14);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (16, 5, 7);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (17, 14, 11);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (18, 17, 3);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (19, 2, 4);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (20, 14, 3);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (21, 15, 5);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (22, 13, 20);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (23, 19, 5);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (24, 20, 4);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (25, 12, 17);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (26, 1, 5);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (27, 6, 12);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (28, 6, 5);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (29, 8, 19);
insert into prescripted_medicines (id, medicine_id, prescription_id) values (30, 17, 16);

# VISTAS

# Todos los pacientes que no tienen obra social

CREATE OR REPLACE VIEW particular_patients AS
	(SELECT p.first_name, p.last_name, mp.name AS medical_plan
    FROM patients p INNER JOIN medical_plan mp ON (p.medical_plan_id = mp.id)
	WHERE name like '%Particular%'
    ORDER BY name ASC);

SELECT * FROM particular_patients;


# Todos los doctores de una especialidad en concreto

CREATE OR REPLACE VIEW speciality_doctors AS
	(SELECT d.first_name, d.last_name
    FROM doctors d
		INNER JOIN doctor_specialities ds ON (d.id = ds.doctor_id)
		INNER JOIN specialities s ON (s.id = ds.speciality_id)
	WHERE s.speciality_name like '%Neurología%'
    ORDER BY d.first_name ASC);

SELECT * FROM speciality_doctors;

# Nombres y apellidos de los pacientes de un doctor en concreto

CREATE OR REPLACE VIEW doctor_patients AS (
	SELECT p.first_name, p.last_name
	FROM patients p
		INNER JOIN consultations c ON p.id = c.patient_id
		INNER JOIN doctors d ON c.doctor_id = d.id
	WHERE d.last_name LIKE 'Keri'
	ORDER BY p.first_name ASC);
    
SELECT * FROM doctor_patients;
    
# Cantidad de pacientes atendidos por doctor

CREATE OR REPLACE VIEW total_doctor_patients AS (
	SELECT d.first_name, d.last_name, COUNT(p.id) AS total_doctor_patients
	FROM patients p
		INNER JOIN consultations c ON p.id = c.patient_id
		INNER JOIN doctors d ON c.doctor_id = d.id
	GROUP BY d.first_name, d.last_name);
    
SELECT * FROM total_doctor_patients;

# Cantidad de consultas realizadas por especialidad

CREATE OR REPLACE VIEW speciality_consultations AS (
	SELECT s.speciality_name, COUNT(c.id) AS cantidad_consultas
	FROM specialities s
		INNER JOIN doctor_specialities ds ON s.id = ds.speciality_id
		INNER JOIN doctors d ON d.id = ds.doctor_id
		INNER JOIN consultations c ON c.doctor_id = d.id
	GROUP BY s.speciality_name);

SELECT * FROM speciality_consultations; 

# FUNCIONES

# Creación de una función para clasificar los pacientes como activos o inactivos en caso de que hayan tenido o no consultas en el hospital

DELIMITER $$
CREATE FUNCTION `patient_status` (consultations_qty INT)
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	DECLARE response varchar(50);
	IF consultations_qty > 0 THEN SET response = 'Activo';
        ELSE SET response = 'Inactivo';
	END IF;
RETURN response;
END
$$

#Prueba de la función de forma aislada

SELECT patient_status(0);

#Prueba de la función  dentro de una consulta para ver el estado de todos los pacientes

SELECT p.first_name, patient_status(COUNT(c.id)) AS estado_paciente
FROM consultations c RIGHT JOIN patients p ON c.patient_id = p.id
GROUP BY p.first_name;

# Creación de una función para saber la cantidad de consultas que atendió un doctor en un rango de tiempo (buscando por apellido)

DELIMITER $$
CREATE FUNCTION `doc_cons_date` (date1 DATE, date2 DATE, doc_lastname VARCHAR(50))
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE total_cons INT;
    DECLARE response VARCHAR(100);
    SET total_cons = (
		SELECT COUNT(c.id) AS cantidad_consultas
		FROM doctors d INNER JOIN consultations c ON d.id = c.doctor_id
		WHERE d.last_name LIKE CONCAT('%', doc_lastname, '%') AND c.consultation_date BETWEEN date1 AND date2
		GROUP BY d.last_name);
	IF total_cons > 0
		THEN SET response = CONCAT('El doctor ', doc_lastname, ' atendió ', total_cons,' consultas'); 
	ELSE SET response = CONCAT('El doctor ', doc_lastname, ' no atendió consultas en este periodo de tiempo');
    END IF;
RETURN response;
END
$$

# Prueba de la función con un rango de fecha que da resultados de 1 o más consultas

SELECT doc_cons_date('2022-01-01', '2023-01-01', 'Heather') AS total_consultas;

# Prueba de la función con un rango de fecha que no da ninguna consulta

SELECT doc_cons_date('2020-01-01', '2020-01-01', 'Heather') AS total_consultas;

# STORED PROCEDURES

# Store Procedure para consultar los pacientes de un doctor y poder ordenarlos por apellido de forma ASC o DESC

DROP PROCEDURE IF EXISTS sp_doctor_patients;
DELIMITER $$
CREATE PROCEDURE `sp_doctor_patients` (
	IN doctor VARCHAR(20),
    IN order_by VARCHAR(20))
BEGIN
	IF order_by <> '' THEN
		SET @order_by = CONCAT('ORDER BY p.last_name ', order_by);
	ELSE
		SET @order_by = CONCAT('ORDER BY p.last_name ');	
	END IF;
    SET @clausula = CONCAT("
	SELECT p.last_name, p.first_name, COUNT(p.id) as total_consultations
	FROM patients p
		INNER JOIN consultations c ON p.id = c.patient_id
		INNER JOIN doctors d ON c.doctor_id = d.id
	WHERE d.last_name LIKE ", CONCAT("'%", doctor, "%' "),
		"GROUP BY p.first_name, p.last_name ",
    	@order_by);
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END
$$

# Prueba con diferentes doctores y con valor por defecto

CALL sp_doctor_patients('Keri', 'ASC');
CALL sp_doctor_patients('Heather', '');


# Store Procedure para insertar un registro de doctor

DROP PROCEDURE IF EXISTS sp_insert_doctor;
DELIMITER $$
CREATE PROCEDURE sp_insert_doctor(
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_document VARCHAR(10)
)
BEGIN
    IF (p_first_name IS NULL OR p_first_name = '' OR
        p_last_name IS NULL OR p_last_name = '' OR
        p_document IS NULL OR p_document = '') THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Error: Todos los campos son obligatorios';
    ELSE
        INSERT INTO doctors(first_name, last_name, document)
        VALUES(p_first_name, p_last_name, p_document);
        SELECT 'Registro insertado exitosamente';
    END IF;
END;
$$

# Prueba sin datos con error de resultado
CALL sp_insert_doctor('Juan', 'Pérez', '');
CALL sp_insert_doctor('Juan', '', '12345678');
CALL sp_insert_doctor('', 'Pérez', '12345678');

# Prueba exitosa
CALL sp_insert_doctor('Juan', 'Pérez', '12345678');

SELECT * FROM doctors;

# TRIGGERS

# Trigger para auditoria de creacion de consultas

DELIMITER $$
CREATE TRIGGER `tr_insert_consultations`
AFTER INSERT ON `consultations`
FOR EACH ROW
INSERT INTO `_log`(entity, entity_id, insert_dt, created_by, last_update_dt, last_updated_by) 
VALUES ('consultations', NEW.id, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER());
$$

INSERT INTO consultations (consultation_date, notes, patient_id, doctor_id)
VALUES (CURRENT_DATE(),'El paciente presenta sintomas de dolor de garganta y fiebre', 1, 3);

SELECT * FROM consultations;
SELECT * FROM _log;

# Trigger para auditoria de actualización de consultas

DELIMITER $$
CREATE TRIGGER `tr_update_consultations`
AFTER UPDATE ON `consultations`
FOR EACH ROW
UPDATE `_log` SET last_update_dt = CURRENT_TIMESTAMP(), last_updated_by = USER() 
WHERE entity_id = OLD.id;
$$

UPDATE consultations SET notes = "nota actualizada" WHERE id = 31 ; 

SELECT * FROM consultations;
SELECT * FROM _log;
