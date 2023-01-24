CREATE TABLE review(
    review_seq number constraint review_review_number_pk primary key,
    review_writer_id varchar2(20),
    review_write_date varchar2(8),
    review_content varchar2(2000) constraint review_review_content not null,
    review_foodstore_seq varchar2(50),
    review_upload varchar2(2000),
    review_tag varchar2(10),
    review_rating number
);

ALTER TABLE review
ADD FOREIGN KEY(review_writer_id) REFERENCES kakao_login(k_id);

ALTER TABLE review
ADD FOREIGN KEY(review_foodstore_seq) REFERENCES seoulfoodstore(FOODSTORE_ID);

CREATE SEQUENCE review_num_seq
 START WITH 1 
 INCREMENT BY 1
 NOCACHE
 NOCYCLE;

COMMIT;

SELECT * FROM review ORDER BY review_foodstore_seq desc, review_seq DESC;