CREATE TABLE kakao_login (
    k_seq number constraint kakao_login_k_seq_pk unique,
    k_id varchar2(50) constraint kakao_login_k_id primary key,
    k_name varchar2(50),
    k_nickname varchar2(100),
    k_email varchar2(200),
    k_image varchar2(500),
    k_age_range varchar2(8),
    k_birthday varchar2(4),
    k_birthday_type varchar2(5),
    k_gender varchar2(6)
);

CREATE SEQUENCE k_seq
 START WITH 1 
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

COMMIT;

SELECT * FROM kakao_login;