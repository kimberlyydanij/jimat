CREATE TABLE kakao_login (
    k_seq number constraint kakao_login_k_seq_pk primary key,
    k_id varchar2(20) constraint kakao_login_k_id unique,
    k_nickname varchar2(100),
    k_email varchar2(100),
    k_image varchar2(255),
    k_age_range varchar2(8),
    k_birthday varchar2(4),
    k_birthday_type varchar2(5),
    k_gender varchar2(6)
);

drop sequence k_seq;

CREATE SEQUENCE k_seq
 START WITH 1 
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

INSERT INTO kakao_login(k_seq, k_id, k_nickname, k_email, k_image, 
 k_age_range, k_birthday, k_birthday_type, k_gender)
VALUES(k_seq.nextval, 'test','홍길동',  null, null,
'20-29','1225', 'solar', 'male');

INSERT INTO kakao_login(k_seq, k_id, k_nickname, k_email, k_image, 
 k_age_range, k_birthday, k_birthday_type, k_gender)
VALUES(k_seq.nextval, 'kakao_1234567890','고길동',  null, null,
'20-29','1225', 'solar', 'male');

INSERT INTO kakao_login(k_seq, k_id, k_nickname, k_email, k_image, 
 k_age_range, k_birthday, k_birthday_type, k_gender)
VALUES(k_seq.nextval, 'kakao_1234567891','지현수',  null, null,
'20-29','1225', 'solar', 'male');

COMMIT;

SELECT * FROM kakao_login;

DROP TABLE kakao_login;