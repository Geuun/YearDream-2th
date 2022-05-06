# Q5. 7월에 가장 많이 구매한 고객 TOP3와 Top10 ~ 15 고객을 뽑아주세요

# Top 3
select customer_id
	 , sum(price) as revenue
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01'
  and purchased_at <  '2020-08-01'
group by 1
order by revenue desc
limit 3;

# Top 10 ~ 15
select customer_id
	 , sum(price) as revenue
from fastcampus.tbl_purchase
where purchased_at >= '2020-07-01'
  and purchased_at <  '2020-08-01'
group by 1
order by revenue desc
limit 5 offset 10;