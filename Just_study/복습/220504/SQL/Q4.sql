# Q4. 7월에 구매유저의 월 평균 구매금액은 어떻게 되나요?
# 월 평균 구매금액 = 7월 매출액 / 구매유저 수

# 7월 매출액 = 21060206300
select sum(price)
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01'
  and purchased_at < '2020-08-01';

# 구매유저 수 = 11174
select count(distinct customer_id)
from tbl_purchase
where purchased_at >= '2020-07-01'
  and purchased_at < '2020-08-01';

select 21060206300 / 11174 as '월 평균 구매금액';

# Q4-1. 고객 당 7월 평균 구매액은?
# ARPPU = Average Revenue Per Paying User

select avg(revenue)
from (select customer_id
	 , sum(price) as revenue
	 from fastcampus.tbl_purchase
	 where purchased_at >= '2020-07-01'
	 and purchased_at < '2020-08-01'
	 group by customer_id) foo;