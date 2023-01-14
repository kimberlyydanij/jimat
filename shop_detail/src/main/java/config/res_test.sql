drop table res_test;

create table res_test(
res varchar2(2000),
latitude varchar2(2000),
longitude varchar2(2000)
);



insert into res_test values('비지트','37.48837454', '126.9913941');
insert into res_test values('쓰리에프','37.48710455','126.9809516');
insert into res_test values('다향','37.48343578', '127.0093822');
insert into res_test values('고향생막걸리','37.52807318', '127.0310125');
insert into res_test values('도전최강달인왕만두','37.55619714', '127.1594713');
insert into res_test values('L.A.D','37.55068898', '126.9198453');
insert into res_test values('양푼이김치찌개','37.51237613', '127.1123188');
insert into res_test values('은진이네','37.55134003', '126.9561643');
insert into res_test values('흥부보쌈','37.52913225', '126.875987');
insert into res_test values('왕십리제일곱창','37.56490119', '127.0367839');
commit;

SELECT  * FROM res_test;

drop  table libmap;

create table libmap(
mart varchar2(2000),
p_num varchar2(2000),
area varchar2(2000),
address varchar2(2000),
latitude varchar2(2000),
longitude varchar2(2000));



insert into libmap values('서울 도서관','02-2122-0300','서울','서울 중구 세종로 110','37.566134','126.977808');
insert into libmap values('지혜의 숲','031-711-8905','경기','경기도 성남시 분당구 금곡동 206','37.386396','127.101900');
insert into libmap values('xx','031-711-8905','경남','통영 수륙해수욕장 ','34.819',' 128.439');
insert into libmap values('ww','031-711-8905','경남','통영 수륙해수욕장 ','34.300',' 128.439');
commit;

select count(*) from libmap where area='서울';

delete from libmap where p_num=2;

SELECT  * FROM libmap;