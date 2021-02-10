

--union
select clubName as bName, buildingNum as bLocation from clubTbl
union
select stdName, region from stdTbl;

--union all
select stdName, region from stdtbl
intersect --union all
select stdName, region from stdtbl;