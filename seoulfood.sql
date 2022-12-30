--------------------------------------------------------
--  DDL for Table SEOULFOOD
--------------------------------------------------------

  CREATE TABLE "HR"."SEOULFOOD" 
   (	"상호명" VARCHAR2(200 BYTE), 
	"지점명" VARCHAR2(200 BYTE), 
	"상권업종중분류코드" VARCHAR2(26 BYTE), 
	"상권업종중분류명" VARCHAR2(200 BYTE), 
	"상권업종소분류코드" VARCHAR2(26 BYTE), 
	"상권업종소분류명" VARCHAR2(200 BYTE), 
	"표준산업분류명" VARCHAR2(200 BYTE), 
	"시군구코드" NUMBER(38,0), 
	"시군구명" VARCHAR2(200 BYTE), 
	"행정동코드" NUMBER(38,0), 
	"행정동명" VARCHAR2(200 BYTE), 
	"법정동코드" NUMBER(38,0), 
	"법정동명" VARCHAR2(200 BYTE), 
	"지번코드" VARCHAR2(26 BYTE), 
	"지번본번지" NUMBER(38,0), 
	"지번부번지" NUMBER(38,0), 
	"지번주소" VARCHAR2(200 BYTE), 
	"도로명" VARCHAR2(200 BYTE), 
	"건물명" VARCHAR2(200 BYTE), 
	"신우편번호" NUMBER(38,0), 
	"X" NUMBER(38,7), 
	"Y" NUMBER(38,8)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table SEOULFOOD
--------------------------------------------------------

  ALTER TABLE "HR"."SEOULFOOD" MODIFY ("상호명" NOT NULL ENABLE);
