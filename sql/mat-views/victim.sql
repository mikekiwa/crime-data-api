-- Builds the Materialized views for grouping/counts on the denormalized nibrs_victim table (by year)

SET work_mem='4096MB'; -- Go Super Saiyan.
SET effective_cache_size='4GB'; -- Go Super Saiyan 2.

drop materialized view victim_counts_2014;
create materialized view victim_counts_2014 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2014' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2013;
create materialized view victim_counts_2013 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2013' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2012;
create materialized view victim_counts_2012 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2012' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';


drop materialized view victim_counts_2011;
create materialized view victim_counts_2011 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2011' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2010;
create materialized view victim_counts_2010 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2010' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2009;
create materialized view victim_counts_2009 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2009' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

drop materialized view victim_counts_2008;
create materialized view victim_counts_2008 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2008' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2007;
create materialized view victim_counts_2007 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2007' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2006;
create materialized view victim_counts_2006 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2006' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);


SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2005;
create materialized view victim_counts_2005 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2005' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2004;
create materialized view victim_counts_2004 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2004' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2003;
create materialized view victim_counts_2003 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2003' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2002;
create materialized view victim_counts_2002 as select count(victim_id),prop_desc_name,bias_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2002' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2001;
create materialized view victim_counts_2001 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2001' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_2000;
create materialized view victim_counts_2000 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '2000' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_1999;
create materialized view victim_counts_1999 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, age_num,bias_name,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1999' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);


SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_1998;
create materialized view victim_counts_1998 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1998' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_1997;
create materialized view victim_counts_1997 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1997' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';


drop materialized view victim_counts_1996;
create materialized view victim_counts_1996 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1996' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_1995;
create materialized view victim_counts_1995 as select count(victim_id),prop_desc_name,bias_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), age_code, bias_name,age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1995' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_1994;
create materialized view victim_counts_1994 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1994' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_1993;
create materialized view victim_counts_1993 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1993' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_1992;
create materialized view victim_counts_1992 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1992' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);

SET work_mem='4096MB';
SET effective_cache_size='4GB';

drop materialized view victim_counts_1991;
create materialized view victim_counts_1991 as select count(victim_id),bias_name,prop_desc_name,offense_name, state_id, race_code,location_name, age_num, sex_code, county_id 
from ( SELECT DISTINCT(victim_id), bias_name,age_code, age_num,race_code,year,prop_desc_name,offense_name,location_name, sex_code, state_id,county_id from nibrs_victim_denorm where year = '1991' ) as temp
GROUP BY GROUPING SETS (
    (year, state_id, race_code),
    (year, state_id, sex_code), -- U, F, M
    (year, state_id, age_num), -- Count -> (age_num-10, age_num)
    (year, state_id, location_name), 
    (year, state_id, offense_name),
    (year, state_id, prop_desc_name),
    (year, state_id, bias_name),
    (year, county_id, race_code),
    (year, county_id, sex_code), -- U, F, M
    (year, county_id, age_num), -- Count -> (age_num-10, age_num)
    (year, county_id, location_name), 
    (year, county_id, offense_name),
    (year, county_id, prop_desc_name),
    (year, county_id, bias_name)
);