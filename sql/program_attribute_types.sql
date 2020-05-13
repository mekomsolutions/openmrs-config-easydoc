-- update program names: This is done because the initializer sets the name as the concept name but we want to use a key instead
update program set name = 'HIV_PROGRAM_KEY' where name = 'HIV';
update program set name = 'TB_PROGRAM_KEY' where name = 'Tuberculosis Templates';

-- add program attribute types if they don't exist
insert ignore into program_attribute_type(name, description, datatype,creator, date_created, uuid, datatype_config) values("ID_Number","ID Number","org.openmrs.customdatatype.datatype.RegexValidatedTextDatatype", 1, NOW(), "c41f844e-a707-11e6-91e9-0800270d80ce", "[0-9]*");
insert ignore into program_attribute_type(name, description, datatype,creator, date_created, uuid, datatype_config) values("Date","Treatment Date","org.openmrs.customdatatype.datatype.DateDatatype", 1, NOW(), "2dc1aafd-a708-11e6-91e9-0800270d80ce", 'NULL');
insert ignore into program_attribute_type(name, description, datatype,creator, date_created, uuid, datatype_config) values("Co-morbidites","Co-morbidites","org.openmrs.customdatatype.datatype.BooleanDatatype", 1, NOW(), "62346a80-a708-11e6-91e9-0800270d80ce", 'NULL');
insert ignore into program_attribute_type(name, description, datatype,creator, date_created, uuid, datatype_config) values("Doctor","Doctor-In-Charge","org.openmrs.customdatatype.datatype.FreeTextDatatype", 1, NOW(), "1172915f-a709-11e6-91e9-0800270d80ce", 'NULL');
insert ignore into program_attribute_type(name, description, datatype,creator, date_created, uuid, datatype_config) values("Stage","Patient Stage","org.bahmni.module.bahmnicore.customdatatype.datatype.CodedConceptDatatype", 1, NOW(), "39202f47-a709-11e6-91e9-0800270d80ce", (select concept_id from concept where uuid = '08277dd9-14e1-4792-8e61-6368bd2a2c48'));

-- update existing program attribute types
update program_attribute_type set description = 'PROGRAM_MANAGEMENT_ART_NUMBER', name = 'PROGRAM_MANAGEMENT_ART_NUMBER' where name = 'ID_Number';
update program_attribute_type set description = 'PROGRAM_MANAGEMENT_PATIENT_TREATMENT_DATE', name = 'PROGRAM_MANAGEMENT_PATIENT_TREATMENT_DATE' where name = 'Date';
update program_attribute_type set description = 'PROGRAM_MANAGEMENT_PATIENT_COMORBIDITES', name = 'PROGRAM_MANAGEMENT_PATIENT_COMORBIDITES' where name = 'Co-morbidites';
update program_attribute_type set description = 'PROGRAM_MANAGEMENT_PATIENT_DOCTOR_IN_CHARGE', name = 'PROGRAM_MANAGEMENT_PATIENT_DOCTOR_IN_CHARGE' where name = 'Doctor';
update program_attribute_type set description = 'PROGRAM_MANAGEMENT_PATIENT_STAGE', name = 'PROGRAM_MANAGEMENT_PATIENT_STAGE' where name = 'Stage';
