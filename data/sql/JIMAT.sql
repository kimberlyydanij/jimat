CREATE TABLE "tb_member_setting" (
	"Seq_Member_ID"	CLOB		NOT NULL,
	"Member_Grade"	INT		NOT NULL,
	"Allow_GPS_Info"	INT	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "tb_member_setting"."Seq_Member_ID" IS '멤버아이디';

COMMENT ON COLUMN "tb_member_setting"."Member_Grade" IS '운영자/사용자';

COMMENT ON COLUMN "tb_member_setting"."Allow_GPS_Info" IS 'GPS허용';

CREATE TABLE "tb_member_api" (
	"Seq_Member_ID"	CLOB		NOT NULL,
	"Member_ID"	VARCHAR2(100)		NOT NULL,
	"Nickname"	VARCHAR2(30)		NOT NULL,
	"Session_Code"	VARCHAR2(100)		NOT NULL,
	"Gender"	INT		NULL,
	"Age"	INT		NULL,
	"Photo"	VARCHAR2(255)		NULL
);

COMMENT ON COLUMN "tb_member_api"."Seq_Member_ID" IS '멤버아이디';

COMMENT ON COLUMN "tb_member_api"."Member_ID" IS 'API아이디';

COMMENT ON COLUMN "tb_member_api"."Nickname" IS '닉네임';

COMMENT ON COLUMN "tb_member_api"."Gender" IS '성별';

COMMENT ON COLUMN "tb_member_api"."Age" IS '나이';

COMMENT ON COLUMN "tb_member_api"."Photo" IS '프로필사진';

CREATE TABLE "tb_place_api" (
	"Place_ID"	VARCHAR2(100)		NOT NULL,
	"Latitude"	CLOB		NOT NULL,
	"Longitude"	CLOB		NOT NULL
);

COMMENT ON COLUMN "tb_place_api"."Place_ID" IS '업소고유번호';

COMMENT ON COLUMN "tb_place_api"."Latitude" IS '위도';

COMMENT ON COLUMN "tb_place_api"."Longitude" IS '경도';

CREATE TABLE "tb_review" (
	"Seq_Review_ID"	CLOB		NOT NULL,
	"Place_ID"	VARCHAR2(100)		NOT NULL,
	"Seq_Member_ID"	CLOB		NOT NULL,
	"Content"	VARCHAR2(255)		NOT NULL,
	"user_rating"	INT		NOT NULL,
	"Member_Tag"	INT		NULL,
	"Rag_Time"	DATETIIME		NOT NULL
);

COMMENT ON COLUMN "tb_review"."Seq_Review_ID" IS '리뷰번호';

COMMENT ON COLUMN "tb_review"."Place_ID" IS '업소고유번호';

COMMENT ON COLUMN "tb_review"."Seq_Member_ID" IS '멤버아이디';

COMMENT ON COLUMN "tb_review"."Content" IS '리뷰내용';

COMMENT ON COLUMN "tb_review"."user_rating" IS '별점';

COMMENT ON COLUMN "tb_review"."Member_Tag" IS 'TAG';

COMMENT ON COLUMN "tb_review"."Rag_Time" IS '작성일자';

CREATE TABLE "tb_picture_file" (
	"SeqPicture_ID"	CLOB		NOT NULL,
	"SeqReview_ID"	CLOB		NOT NULL,
	"Filename"	CLOB		NOT NULL
);

COMMENT ON COLUMN "tb_picture_file"."SeqReview_ID" IS '리뷰번호';

COMMENT ON COLUMN "tb_picture_file"."Filename" IS '첨부파일';

CREATE TABLE "tb_hit_info" (
	"Seq_Member_ID"	CLOB		NOT NULL,
	"Place_ID"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "tb_hit_info"."Seq_Member_ID" IS '멤버아이디';

COMMENT ON COLUMN "tb_hit_info"."Place_ID" IS '업소고유번호';

CREATE TABLE "tb_place_info" (
	"Place_ID"	VARCHAR2(100)		NOT NULL,
	"Place_name"	VARCHAR2(30)		NOT NULL,
	"Address"	VARCHAR2(100)		NULL,
	"Road_Address"	VARCHAR2(100)		NOT NULL,
	"Area_Code"	VARCHAR2(30)		NOT NULL,
	"Rating"	INT		NOT NULL,
	"Place_Category1"	VARCHAR2(30)		NOT NULL,
	"Place_Category2"	VARCHAR2(30)		NULL
);

COMMENT ON COLUMN "tb_place_info"."Place_ID" IS '업소고유번호';

COMMENT ON COLUMN "tb_place_info"."Place_name" IS '업소명';

COMMENT ON COLUMN "tb_place_info"."Address" IS '지번주소';

COMMENT ON COLUMN "tb_place_info"."Road_Address" IS '도로명주소';

COMMENT ON COLUMN "tb_place_info"."Area_Code" IS '동 코드';

CREATE TABLE "tb_address_info" (
	"Area_Code"	VARCHAR2(30)		NOT NULL,
	"Area_Name"	VARCHAR2(30)		NOT NULL,
	"State_Code"	VARCHAR2(30)		NOT NULL,
	"State_Name"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "tb_address_info"."Area_Code" IS '동 코드';

COMMENT ON COLUMN "tb_address_info"."Area_Name" IS '동 이름';

COMMENT ON COLUMN "tb_address_info"."State_Code" IS '구 코드';

COMMENT ON COLUMN "tb_address_info"."State_Name" IS '구 이름';

CREATE TABLE "tb_category1" (
	"Place_Category1"	VARCHAR2(30)		NOT NULL,
	"Category_Name1"	VARCHAR2(30)		NOT NULL
);

CREATE TABLE "tb_category2" (
	"Place_Category2"	VARCHAR2(30)		NOT NULL,
	"Category_Name2"	VARCHAR2(30)		NOT NULL
);

ALTER TABLE "tb_member_setting" ADD CONSTRAINT "PK_TB_MEMBER_SETTING" PRIMARY KEY (
	"Seq_Member_ID"
);

ALTER TABLE "tb_member_api" ADD CONSTRAINT "PK_TB_MEMBER_API" PRIMARY KEY (
	"Seq_Member_ID"
);

ALTER TABLE "tb_place_api" ADD CONSTRAINT "PK_TB_PLACE_API" PRIMARY KEY (
	"Place_ID"
);

ALTER TABLE "tb_review" ADD CONSTRAINT "PK_TB_REVIEW" PRIMARY KEY (
	"Seq_Review_ID"
);

ALTER TABLE "tb_picture_file" ADD CONSTRAINT "PK_TB_PICTURE_FILE" PRIMARY KEY (
	"SeqPicture_ID"
);

ALTER TABLE "tb_hit_info" ADD CONSTRAINT "PK_TB_HIT_INFO" PRIMARY KEY (
	"Seq_Member_ID",
	"Place_ID"
);

ALTER TABLE "tb_address_info" ADD CONSTRAINT "PK_TB_ADDRESS_INFO" PRIMARY KEY (
	"Area_Code"
);

ALTER TABLE "tb_category1" ADD CONSTRAINT "PK_TB_CATEGORY1" PRIMARY KEY (
	"Place_Category1"
);

ALTER TABLE "tb_category2" ADD CONSTRAINT "PK_TB_CATEGORY2" PRIMARY KEY (
	"Place_Category2"
);

ALTER TABLE "tb_member_setting" ADD CONSTRAINT "FK_tb_member_api_TO_tb_member_setting_1" FOREIGN KEY (
	"Seq_Member_ID"
)
REFERENCES "tb_member_api" (
	"Seq_Member_ID"
);

ALTER TABLE "tb_hit_info" ADD CONSTRAINT "FK_tb_member_api_TO_tb_hit_info_1" FOREIGN KEY (
	"Seq_Member_ID"
)
REFERENCES "tb_member_api" (
	"Seq_Member_ID"
);

ALTER TABLE "tb_hit_info" ADD CONSTRAINT "FK_tb_place_api_TO_tb_hit_info_1" FOREIGN KEY (
	"Place_ID"
)
REFERENCES "tb_place_api" (
	"Place_ID"
);

