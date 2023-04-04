with not_banned as (Select users_id as id from Users where banned = 'Yes')

Select distinct request_at as Day, round(sum(if(status != 'completed',1,0))/count(*),2) as "Cancellation Rate"
from Trips where (client_id not in (select id from not_banned)) AND (driver_id not in (select id from not_banned)) AND (request_at BETWEEN '2013-10-01' AND '2013-10-03')
group by request_at;
