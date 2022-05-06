# Q6. 2020년 7월의 평균 DAU를 구해주세요, Active User 수가 증가하는 추세인가요?
# DAU : Daily Active User
# 일별로 확인해야합니다.

# 7월의 평균 DAU
select avg(users)
from (
select date_format(visited_at - interval 9 hour, '%Y-%m-%d') as date_at
	 , count(distinct customer_id) as users
from fastcampus.tbl_visit
where visited_at >= '2020-07-01'
  and visited_at <  '2020-08-01'
group by date_at
order by date_at ) foo


# 추세를 확인하기 위해서는 
select avg(users)
from (
select date_format(visited_at - interval 9 hour, '%Y-%m-%d') as date_at
	 , count(distinct customer_id) as users
from fastcampus.tbl_visit
where visited_at >= '2020-07-01'
  and visited_at <  '2020-08-01'
# 위 구절을 실행 후 excel 을 통해 시각화 해서 확인