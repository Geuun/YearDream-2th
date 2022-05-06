# Q2. 2020년 7월의 MAU를 구해주세요.

select count(distinct customer_id)
from fastcampus.tbl_visit
where visited_at >= '2020-07-01'
  and visited_at < '2020-08-01'

limit 10