--------------------------------------------------------
--  DDL for Table RESTAURANT
--------------------------------------------------------

  CREATE TABLE "HR"."RESTAURANTS" 
   (	"사업장명" VARCHAR2(100 BYTE), 
	"소재지전화" VARCHAR2(100 BYTE), 
	"소재지우편번호" NUMBER(38,0), 
	"소재지전체주소" VARCHAR2(2000 BYTE), 
	"도로명전체주소" VARCHAR2(2000 BYTE), 
	"도로명우편번호" VARCHAR2(26 BYTE), 
	"업태구분명" VARCHAR2(200 BYTE), 
	"X" VARCHAR2(200 BYTE), 
	"Y" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table RESTAURANT
--------------------------------------------------------

  ALTER TABLE "HR"."RESTAURANTS" MODIFY ("Y" NOT NULL ENABLE);
  ALTER TABLE "HR"."RESTAURANTS" MODIFY ("X" NOT NULL ENABLE);
  ALTER TABLE "HR"."RESTAURANTS" MODIFY ("사업장명" NOT NULL ENABLE);
