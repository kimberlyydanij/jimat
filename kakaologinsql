CREATE TABLE kakao_login (
    k_number number(10) constraint kakao_login_k_number_pk primary key,
    k_id varchar2(20),
    k_nickname varchar2(100),
    k_has_email varchar2(5),
    k_email varchar2(100),
    k_image varchar2(255),
    k_has_age_range varchar2(5),
    k_age_range varchar2(8),
    k_has_birthday varchar2(5),
    k_birthday varchar2(4),
    k_birthday_type varchar2(5),
    k_has_gender varchar2(5),
    k_gender varchar2(6)
);

CREATE SEQUENCE kakao_login_k_number_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

SELECT * FROM user_sequences;

DROP SEQUENCE kakao_login_k_number_seq;

INSERT INTO kakao_login(k_number, k_id, k_nickname, k_has_email, k_email,k_image, 
k_has_age_range, k_age_range, k_has_birthday, k_birthday, 
k_birthday_type, k_has_gender, k_gender)
VALUES(kakao_login_k_number_seq.nextval, 'test','홍길동', null, null, null, 'true', '20-29', 'true',
'1225', 'solar', 'true', 'male');

SELECT * FROM kakao_login ORDER BY k_number DESC;

DELETE FROM kakao_login
WHERE k_nickname = '오세덕';

DELETE FROM kakao_login
WHERE k_number in(5,6);

ALTER TABLE kakao_login
ADD k_email varchar2(100);

DROP TABLE kakao_login;

COMMIT;