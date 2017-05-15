DO
$do$
DECLARE
   arr integer[] := array[2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991];
   i integer;
BEGIN
   FOREACH i IN ARRAY arr
   LOOP
    SET work_mem='4096MB';
    EXECUTE 'drop materialized view victim_counts_' || i::TEXT || ' CASCADE';
    EXECUTE 'create materialized view victim_counts_' || i::TEXT || ' as select count(victim_id), ori,resident_status_code,offender_relationship,circumstance_name,ethnicity,offense_name, state_id, race_code, age_num, sex_code 
    from ( 
        SELECT DISTINCT(victim_id), ref_agency.ori, ethnicity, age_num,race_code,year,resident_status_code,offender_relationship,circumstance_name,offense_name, sex_code, nibrs_victim_denorm.state_id from nibrs_victim_denorm 
        JOIN ref_agency ON ref_agency.agency_id = nibrs_victim_denorm.agency_id
        where year::integer = ' || i || '  and nibrs_victim_denorm.state_id is not null
        ) as temp
    GROUP BY GROUPING SETS (
        (year, race_code),
        (year, sex_code),
        (year, age_num),
        (year, location_name), 
        (year, offense_name),
        (year, prop_desc_name),
        (year, resident_status_code), 
        (year, offender_relationship),
        (year, circumstance_name),
        (year, ethnicity),

        (year, state_id, race_code),
        (year, state_id, sex_code),
        (year, state_id, age_num),
        (year, state_id, location_name), 
        (year, state_id, offense_name),
        (year, state_id, prop_desc_name),
        (year, state_id, resident_status_code), 
        (year, state_id, offender_relationship),
        (year, state_id, circumstance_name),
        (year, state_id, ethnicity),

        (year, ori, race_code),
        (year, ori, sex_code),
        (year, ori, age_num),
        (year, ori, location_name), 
        (year, ori, offense_name),
        (year, ori, prop_desc_name),
        (year, ori, resident_status_code), 
        (year, ori, offender_relationship),
        (year, ori, circumstance_name),
        (year, ori, ethnicity)
    );';
   END LOOP;
END
$do$;

drop materialized view victim_counts;
create materialized view victim_counts as 
    SELECT *, 2014 as year FROM victim_counts_2014 UNION 
    SELECT *, 2013 as year FROM victim_counts_2013 UNION
    SELECT *, 2012 as year FROM victim_counts_2012 UNION 
    SELECT *, 2011 as year FROM victim_counts_2011 UNION 
    SELECT *, 2010 as year FROM victim_counts_2010 UNION
    SELECT *, 2009 as year FROM victim_counts_2009 UNION 
    SELECT *, 2008 as year FROM victim_counts_2008 UNION 
    SELECT *, 2007 as year FROM victim_counts_2007 UNION
    SELECT *, 2006 as year FROM victim_counts_2006 UNION 
    SELECT *, 2005 as year FROM victim_counts_2005 UNION 
    SELECT *, 2004 as year FROM victim_counts_2004 UNION
    SELECT *, 2003 as year FROM victim_counts_2003 UNION 
    SELECT *, 2002 as year FROM victim_counts_2002 UNION 
    SELECT *, 2001 as year FROM victim_counts_2001 UNION
    SELECT *, 2000 as year FROM victim_counts_2000 UNION 
    SELECT *, 1999 as year FROM victim_counts_1999 UNION 
    SELECT *, 1998 as year FROM victim_counts_1998 UNION
    SELECT *, 1997 as year FROM victim_counts_1997 UNION 
    SELECT *, 1996 as year FROM victim_counts_1996 UNION 
    SELECT *, 1995 as year FROM victim_counts_1995 UNION
    SELECT *, 1994 as year FROM victim_counts_1994 UNION 
    SELECT *, 1993 as year FROM victim_counts_1993 UNION 
    SELECT *, 1992 as year FROM victim_counts_1992 UNION
    SELECT *, 1991 as year FROM victim_counts_1991;