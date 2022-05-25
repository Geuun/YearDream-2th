# Q3. 7월에 우리 Active 유저의 구매율(Paying Rate)은 어떻게 되나요?
# 구매유저 수 / 전체 Active 유저

/*
# Active 유저
select count(distinct customer_id)
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01'
and purchased_at < '2020-08-01'
*/

/*
select count(distinct customer_id)
from fastcampus.tbl_visit
where visited_at >= '2020-07-01'
and visited_at < '2020-08-01'
*/

 
select round(11174 / 16414 * 100, 2) as 'Paying Rate'