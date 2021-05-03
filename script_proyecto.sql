CREATE DATABASE BD_RESERVA
GO

USE BD_RESERVA
GO

CREATE TABLE sede
(
id_sede int identity(1,1) primary key,
nom_sede varchar(30),
tel_sede varchar(20),
direc_sede varchar(200),
distrito_sede varchar(30),
provincia varchar(30)
)

CREATE TABLE especialidad
(
id_especialidad int identity(1,1) primary key,
descrip_especialidad varchar(30),
)

CREATE TABLE doctor
(
id_doctor int identity(1,1) primary key,
nom_doctor varchar(30),
ape_doctor varchar(30),
doc_iden_doctor varchar(12),
fec_nac_doctor date,
sexo_doctor char(1),
tel_doctor varchar(20),
email_doctor varchar(100),
estado_doctor bit,

id_especialidad int,
id_sede int
)

ALTER TABLE doctor ADD CONSTRAINT fk_especialidad_doctor
FOREIGN KEY(id_especialidad) REFERENCES especialidad(id_especialidad)

ALTER TABLE doctor ADD CONSTRAINT fk_sede_doctor
FOREIGN KEY(id_sede) REFERENCES sede(id_sede)

CREATE TABLE paciente
(
id_paciente int identity(1,1) primary key,
nom_paciente varchar(30),
ape_paciente varchar(30),
doc_iden_paciente varchar(12),
fec_nac_paciente date,
sexo_paciente char(1),
tel_paciente varchar(20),
email_paciente varchar(100),
grup_sang varchar(4)
)

CREATE TABLE turno
(
id_turno int identity(1,1) primary key,
nom_turno varchar(30),
descrip_turno varchar(30)
)

CREATE TABLE metodo_pago
(
id_pago int identity(1,1) primary key,
tipo_pago varchar(30)
)

CREATE TABLE reserva
(
id_reserva int identity(1,1) primary key,
estado_reserva varchar(20),
precio_reserva money,
fec_reserva date,
fec_creacion datetime,
sintomas_reserva varchar(70),

id_sede int,
id_doctor int,
id_paciente int,
id_especialidad int,
id_turno int,
id_pago int,
)

ALTER TABLE reserva ADD CONSTRAINT fk_sede_reserva
FOREIGN KEY(id_sede) REFERENCES sede(id_sede)

ALTER TABLE reserva ADD CONSTRAINT fk_doctor_reserva
FOREIGN KEY(id_doctor) REFERENCES doctor(id_doctor)

ALTER TABLE reserva ADD CONSTRAINT fk_paciente_reserva
FOREIGN KEY(id_paciente) REFERENCES paciente(id_paciente)

ALTER TABLE reserva ADD CONSTRAINT fk_especialidad_reserva
FOREIGN KEY(id_especialidad) REFERENCES especialidad(id_especialidad)

ALTER TABLE reserva ADD CONSTRAINT fk_turno_reserva
FOREIGN KEY(id_turno) REFERENCES turno(id_turno)

ALTER TABLE reserva ADD CONSTRAINT fk_pago_reserva
FOREIGN KEY(id_pago) REFERENCES metodo_pago(id_pago)

CREATE TABLE usuario
(
id_usuario int identity(1,1) primary key,
nom_usuario varchar(30),
ape_usuario varchar(30),
doc_iden_usuario varchar(12),
fec_nac_usuario date,
sexo_usuario char(1),
tel_usuario int,
email_usuario varchar(100),
estado_usuario bit
)