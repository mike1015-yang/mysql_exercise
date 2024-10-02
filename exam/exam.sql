with A_grades as (select category,
				         truncate(sum(grade)/count(*),0) as a_gr
                    from grades
                   where classid in ('A') and
                         grade >= 80
                   group by category),
	 B_grades as (select category,
						 truncate(sum(grade)/count(*),0) as b_gr
					from grades
				   where classid in ('A') and
						 grade between 60 and 79
				   group by category),
	C_grades as (select category,
						truncate(sum(grade)/count(*),0) as c_gr
				   from grades
				  where classid in ('A') and
						grade between 0 and 59
				  group by category),
	A_people as (select category,
						count(*) as a_peo
				   from grades
				  where classid in ('A') and
						grade >= 80
				  group by category),
    B_people as (select category,
						count(*) as B_peo
				   from grades
				  where classid in ('A') and
						grade between 60 and 79
				  group by category),
	C_people as (select category,
						count(*) as c_peo
				   from grades
				  where classid in ('A') and
						grade between 0 and 59
				  group by category)
select ag.category,
	   ap.a_peo as 'A級人數80分以上',
       ifnull(bp.b_peo, 0) as 'B級人數60-79',
       ifnull(cp.c_peo, 0) as 'C級人數0-59',
       ag.a_gr as 'A級平均分數80分以上',
       bg.b_gr as 'B級平均分數60-79',
       cg.c_gr as 'C級平均分數0-59'
from A_grades ag
left join B_grades bg
on ag.category = bg.category
left join C_grades cg
on ag.category = cg.category
left join A_people ap
on ag.category = ap.category
left join B_people bp
on ag.category = bp.category
left join C_people cp
on ag.category = cp.category;
