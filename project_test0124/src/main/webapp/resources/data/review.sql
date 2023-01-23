CREATE TABLE review(
    review_seq number constraint review_review_number_pk primary key,
    review_writer_id varchar2(20),
    review_write_date varchar2(8),
    review_content varchar(2000) constraint review_review_content not null,
    review_foodstore_seq number,
    review_good_number number default 0,
    review_upload varchar(2000),
    review_tag varchar(10)
    
);

drop table review;


SELECT * FROM review;

CREATE SEQUENCE review_num_seq
 START WITH 1 
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_1111111111', 
            to_char(sysdate), 'test', 1, 
             0, null);

INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_2222222222', 
            to_char(sysdate), 'test', 2, 
            1, null);
             
INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_3333333333', 
            to_char(sysdate), 'test', 2, 
             1, null);
             
INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_4444444444', 
            to_char(sysdate), 'test', 2, 
             1, null);

INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_5555555555', 
            to_char(sysdate), 'test', 2, 
             1, null);
             
INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_6666666666', 
            to_char(sysdate), 'test', 2, 
             1, null);

INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_7777777777', 
            to_char(sysdate), 'test', 2, 
             1, null);

INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_8888888888', 
            to_char(sysdate), 'test', 2, 
             1, null);

INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_9999999999', 
            to_char(sysdate), 'test', 2, 
             1, null);

INSERT INTO review(review_seq, review_writer_id,
            review_write_date, review_content, review_foodstore_seq,
            review_good_number, review_upload)
VALUES(review_num_seq.nextval, 'kakao_0000000000', 
            to_char(sysdate), 'test', 2, 
             1, null);

COMMIT;

SELECT * FROM review ORDER BY review_foodstore_seq desc, review_seq DESC;

SELECT * FROM user_constraints ORDER BY TABLE_NAME desc;

select b.* from
(select rownum as rm, a.* from(
select * from review
where review_foodstore_seq = 2
order by review_seq desc, review_write_date desc) a)b;

select b.* from
(select rownum as rm, a.* from(
select * from review where review_foodstore_seq = 2
order by review_seq desc, review_write_date desc) a)b
where review_foodstore_seq = 2 and 
b.rm >=1 and b.rm<=5;

select count(*) from review where review_foodstore_seq = 2;

commit;

DROP TABLE review;

DROP SEQUENCE review_num_seq;



ALTER TABLE review
ADD FOREIGN KEY(review_writer_id) REFERENCES kakao_login(k_id);

ALTER TABLE review
ADD FOREIGN KEY(review_main_number) REFERENCES seoulfood(foodstore_seq);
