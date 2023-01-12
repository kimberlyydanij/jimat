--------------------------------------------------------
--  파일이 생성됨 - 금요일-1월-06-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SEOULFOODSAMPLE
--------------------------------------------------------

  CREATE TABLE "HR"."SEOULFOODSAMPLE" 
   (	
    "FOODSTORE_ID" VARCHAR2(26 BYTE),
    "FOODSTORE_NAME" VARCHAR2(225 BYTE), 
	"FOODCATEGORY_CODE" VARCHAR2(26 BYTE), 
	"FOODCATEGORY" VARCHAR2(225 BYTE), 
	"FOODTYPE_CODE" VARCHAR2(26 BYTE), 
	"FOODTYPE" VARCHAR2(225 BYTE), 
	"STATES_CODE" NUMBER(38,0), 
	"STATES" VARCHAR2(225 BYTE), 
	"AREA_CODE" NUMBER(38,0), 
	"AREA" VARCHAR2(225 BYTE), 
	"ADRESS_CODE" VARCHAR2(26 BYTE), 
	"ADDRESS" VARCHAR2(225 BYTE), 
	"ROAD_NAME" VARCHAR2(225 BYTE), 
	"LATITUDE" NUMBER(38,8), 
	"LONGITUDE" NUMBER(38,7), 
	"IMG_URL" VARCHAR2(1024 BYTE), 
	"FOODSTROE_NUM" VARCHAR2(26 BYTE),
    "TAG_STORE" VARCHAR2(50 BYTE),
    "TAG_GENDER"VARCHAR2(26 BYTE),
    "TAG_AGE" VARCHAR2(26 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  


