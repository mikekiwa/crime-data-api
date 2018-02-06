 CREATE MATERIALIZED VIEW public.leoka_assault_by_group_national_totals AS
 select lc.data_year, lc.activity_name, lc.activity_id,a.population_group_code,
 sum(lc.firearm_actual)+sum(lc.knife_actual)+sum(lc.hands_fists_feet_actual)+sum(lc.other_actual) as group_count,
 sum(lc.cleared_count) as cleared_count
 FROM public.leoka_assault_activity_assignment_data lc
 JOIN public.agency_data a on a.agency_id=lc.agency_id and lc.data_year = a.data_year
 GROUP BY lc.data_year,lc.activity_name, lc.activity_id, a.population_group_code
 ORDER BY lc.data_year, lc.activity_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_group_national AS
 SELECT
    data_year,
    activity_id,
    activity_name,
    sum(CASE WHEN population_group_code like '1%' then group_count else 0 end) as group_1_actual_ct,
    sum(CASE WHEN population_group_code like '1%' then cleared_count else 0 end) as group_1_cleared_ct,
    sum(CASE WHEN population_group_code like '2%' then group_count else 0 end) as group_2_actual_ct,
    sum(CASE WHEN population_group_code like '2%' then cleared_count else 0 end) as group_2_cleared_ct,
    sum(CASE WHEN population_group_code like '3%' then group_count else 0 end) as group_3_actual_ct,
    sum(CASE WHEN population_group_code like '3%' then cleared_count else 0 end) as group_3_cleared_ct,
    sum(CASE WHEN population_group_code like '4%' then group_count else 0 end) as group_4_actual_ct,
    sum(CASE WHEN population_group_code like '4%' then cleared_count else 0 end) as group_4_cleared_ct,
    sum(CASE WHEN population_group_code like '5%' then group_count else 0 end) as group_5_actual_ct,
    sum(CASE WHEN population_group_code like '5%' then cleared_count else 0 end) as group_5_cleared_ct,
    sum(CASE WHEN population_group_code like '6%' then group_count else 0 end) as group_6_actual_ct,
    sum(CASE WHEN population_group_code like '6%' then cleared_count else 0 end) as group_6_cleared_ct,
    sum(CASE WHEN population_group_code like '7%' then group_count else 0 end) as group_7_actual_ct,
    sum(CASE WHEN population_group_code like '7%' then cleared_count else 0 end) as group_7_cleared_ct,
    sum(CASE WHEN population_group_code like '8%' then group_count else 0 end) as group_8_actual_ct,
    sum(CASE WHEN population_group_code like '8%' then cleared_count else 0 end) as group_8_cleared_ct,
    sum(CASE WHEN population_group_code like '9%' then group_count else 0 end) as group_9_actual_ct,
    sum(CASE WHEN population_group_code like '9%' then cleared_count else 0 end) as group_9_cleared_ct
 from public.leoka_assault_by_group_national_totals
 group by data_year, activity_id,activity_name
 ORDER BY data_year, activity_id;



 CREATE MATERIALIZED VIEW public.leoka_assault_by_group_regional_totals AS
 select lc.data_year, lc.activity_name, lc.activity_id, a.region_name,a.region_code,a.population_group_code,
 sum(lc.firearm_actual)+sum(lc.knife_actual)+sum(lc.hands_fists_feet_actual)+sum(lc.other_actual) as group_count,
 sum(lc.cleared_count) as cleared_count
 FROM public.leoka_assault_activity_assignment_data lc
 JOIN public.agency_data a on a.agency_id=lc.agency_id and a.data_year = lc.data_year
 GROUP BY lc.data_year, a.region_code,a.region_name,lc.activity_name, lc.activity_id, a.population_group_code
 ORDER BY lc.data_year, lc.activity_id;


 CREATE MATERIALIZED VIEW public.leoka_assault_by_group_regional AS
 SELECT
    data_year,
    region_code,
    region_name,
    activity_id,
    activity_name,
    sum(CASE WHEN population_group_code like '1%' then group_count else 0 end) as group_1_actual_ct,
    sum(CASE WHEN population_group_code like '1%' then cleared_count else 0 end) as group_1_cleared_ct,
    sum(CASE WHEN population_group_code like '2%' then group_count else 0 end) as group_2_actual_ct,
    sum(CASE WHEN population_group_code like '2%' then cleared_count else 0 end) as group_2_cleared_ct,
    sum(CASE WHEN population_group_code like '3%' then group_count else 0 end) as group_3_actual_ct,
    sum(CASE WHEN population_group_code like '3%' then cleared_count else 0 end) as group_3_cleared_ct,
    sum(CASE WHEN population_group_code like '4%' then group_count else 0 end) as group_4_actual_ct,
    sum(CASE WHEN population_group_code like '4%' then cleared_count else 0 end) as group_4_cleared_ct,
    sum(CASE WHEN population_group_code like '5%' then group_count else 0 end) as group_5_actual_ct,
    sum(CASE WHEN population_group_code like '5%' then cleared_count else 0 end) as group_5_cleared_ct,
    sum(CASE WHEN population_group_code like '6%' then group_count else 0 end) as group_6_actual_ct,
    sum(CASE WHEN population_group_code like '6%' then cleared_count else 0 end) as group_6_cleared_ct,
    sum(CASE WHEN population_group_code like '7%' then group_count else 0 end) as group_7_actual_ct,
    sum(CASE WHEN population_group_code like '7%' then cleared_count else 0 end) as group_7_cleared_ct,
    sum(CASE WHEN population_group_code like '8%' then group_count else 0 end) as group_8_actual_ct,
    sum(CASE WHEN population_group_code like '8%' then cleared_count else 0 end) as group_8_cleared_ct,
    sum(CASE WHEN population_group_code like '9%' then group_count else 0 end) as group_9_actual_ct,
    sum(CASE WHEN population_group_code like '9%' then cleared_count else 0 end) as group_9_cleared_ct
 from public.leoka_assault_by_group_regional_totals
 group by data_year, region_code,region_name,activity_id,activity_name
 ORDER BY data_year, activity_id,region_code;


 CREATE MATERIALIZED VIEW public.leoka_assault_by_group_state_totals AS
 select lc.data_year, lc.activity_name, lc.activity_id, a.state_abbr,a.state_id,a.population_group_code,
 sum(lc.firearm_actual)+sum(lc.knife_actual)+sum(lc.hands_fists_feet_actual)+sum(lc.other_actual) as group_count,
 sum(lc.cleared_count) as cleared_count
 FROM public.leoka_assault_activity_assignment_data lc
 JOIN public.agency_data a on a.agency_id=lc.agency_id and a.data_year = lc.data_year
 GROUP BY lc.data_year, a.state_abbr,a.state_id,lc.activity_name, lc.activity_id, a.population_group_code
 ORDER BY lc.data_year, lc.activity_id;


 CREATE MATERIALIZED VIEW public.leoka_assault_by_group_state AS
 SELECT
    data_year,
    state_abbr,
    state_id,
    activity_id,
    activity_name,
    sum(CASE WHEN population_group_code like '1%' then group_count else 0 end) as group_1_actual_ct,
    sum(CASE WHEN population_group_code like '1%' then cleared_count else 0 end) as group_1_cleared_ct,
    sum(CASE WHEN population_group_code like '2%' then group_count else 0 end) as group_2_actual_ct,
    sum(CASE WHEN population_group_code like '2%' then cleared_count else 0 end) as group_2_cleared_ct,
    sum(CASE WHEN population_group_code like '3%' then group_count else 0 end) as group_3_actual_ct,
    sum(CASE WHEN population_group_code like '3%' then cleared_count else 0 end) as group_3_cleared_ct,
    sum(CASE WHEN population_group_code like '4%' then group_count else 0 end) as group_4_actual_ct,
    sum(CASE WHEN population_group_code like '4%' then cleared_count else 0 end) as group_4_cleared_ct,
    sum(CASE WHEN population_group_code like '5%' then group_count else 0 end) as group_5_actual_ct,
    sum(CASE WHEN population_group_code like '5%' then cleared_count else 0 end) as group_5_cleared_ct,
    sum(CASE WHEN population_group_code like '6%' then group_count else 0 end) as group_6_actual_ct,
    sum(CASE WHEN population_group_code like '6%' then cleared_count else 0 end) as group_6_cleared_ct,
    sum(CASE WHEN population_group_code like '7%' then group_count else 0 end) as group_7_actual_ct,
    sum(CASE WHEN population_group_code like '7%' then cleared_count else 0 end) as group_7_cleared_ct,
    sum(CASE WHEN population_group_code like '8%' then group_count else 0 end) as group_8_actual_ct,
    sum(CASE WHEN population_group_code like '8%' then cleared_count else 0 end) as group_8_cleared_ct,
    sum(CASE WHEN population_group_code like '9%' then group_count else 0 end) as group_9_actual_ct,
    sum(CASE WHEN population_group_code like '9%' then cleared_count else 0 end) as group_9_cleared_ct
 from public.leoka_assault_by_group_state_totals
 group by data_year, state_abbr,state_id,activity_id,activity_name
 ORDER BY data_year, activity_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_assign_dist_national AS
 SELECT data_year,
   activity_name,
   activity_id,
   sum(TWO_OFFICER_VEHICLE_ACTUAL) as TWO_OFFICER_VEHICLE_ACTUAL,
   sum(ONE_OFFICER_VEHICLE_ACTUAL) as ONE_OFFICER_VEHICLE_ACTUAL,
   sum(ONE_OFFICER_ASSISTED_ACTUAL) as ONE_OFFICER_ASSISTED_ACTUAL,
   sum(DET_SPE_ASS_ALONE_ACTUAL) as DET_SPE_ASS_ALONE_ACTUAL,
   sum(DET_SPE_ASS_ASSISTED_ACTUAL) as DET_SPE_ASS_ASSISTED_ACTUAL,
   sum(OTHER_ALONE_ACTUAL) as OTHER_ALONE_ACTUAL,
   sum(OTHER_ASSISTED_ACTUAL) as OTHER_ASSISTED_ACTUAL
 FROM public.leoka_assault_activity_assignment_data
 GROUP BY data_year, activity_name, activity_id
 ORDER BY data_year, activity_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_assign_dist_regional AS
 SELECT a.data_year,
   b.region_code,
   b.region_name,
   a.activity_name,
   a.activity_id,
   sum(TWO_OFFICER_VEHICLE_ACTUAL) as TWO_OFFICER_VEHICLE_ACTUAL,
   sum(ONE_OFFICER_VEHICLE_ACTUAL) as ONE_OFFICER_VEHICLE_ACTUAL,
   sum(ONE_OFFICER_ASSISTED_ACTUAL) as ONE_OFFICER_ASSISTED_ACTUAL,
   sum(DET_SPE_ASS_ALONE_ACTUAL) as DET_SPE_ASS_ALONE_ACTUAL,
   sum(DET_SPE_ASS_ASSISTED_ACTUAL) as DET_SPE_ASS_ASSISTED_ACTUAL,
   sum(OTHER_ALONE_ACTUAL) as OTHER_ALONE_ACTUAL,
   sum(OTHER_ASSISTED_ACTUAL) as OTHER_ASSISTED_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id and a.data_year = b.data_year
 GROUP BY a.data_year, b.region_code, b.region_name,a.activity_name, a.activity_id
 ORDER BY a.data_year, b.region_code, b.region_name,a.activity_id;


 CREATE MATERIALIZED VIEW public.leoka_assault_by_assign_dist_state AS
 SELECT a.data_year,
   b.state_abbr,
   a.activity_name,
   a.activity_id,
   sum(TWO_OFFICER_VEHICLE_ACTUAL) as TWO_OFFICER_VEHICLE_ACTUAL,
   sum(ONE_OFFICER_VEHICLE_ACTUAL) as ONE_OFFICER_VEHICLE_ACTUAL,
   sum(ONE_OFFICER_ASSISTED_ACTUAL) as ONE_OFFICER_ASSISTED_ACTUAL,
   sum(DET_SPE_ASS_ALONE_ACTUAL) as DET_SPE_ASS_ALONE_ACTUAL,
   sum(DET_SPE_ASS_ASSISTED_ACTUAL) as DET_SPE_ASS_ASSISTED_ACTUAL,
   sum(OTHER_ALONE_ACTUAL) as OTHER_ALONE_ACTUAL,
   sum(OTHER_ASSISTED_ACTUAL) as OTHER_ASSISTED_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id and a.data_year = b.data_year
 GROUP BY a.data_year, b.state_abbr, b.state_id, a.activity_name,  a.activity_id
 ORDER BY  a.data_year, b.state_abbr,   b.state_id,a.activity_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_assign_dist_agency AS
 SELECT a.data_year,
   b.ori,
   b.agency_id,
   b.state_abbr,
   a.activity_name,
   a.activity_id,
   sum(a.TWO_OFFICER_VEHICLE_ACTUAL) as TWO_OFFICER_VEHICLE_ACTUAL,
   sum(a.ONE_OFFICER_VEHICLE_ACTUAL) as ONE_OFFICER_VEHICLE_ACTUAL,
   sum(a.ONE_OFFICER_ASSISTED_ACTUAL) as ONE_OFFICER_ASSISTED_ACTUAL,
   sum(a.DET_SPE_ASS_ALONE_ACTUAL) as DET_SPE_ASS_ALONE_ACTUAL,
   sum(a.DET_SPE_ASS_ASSISTED_ACTUAL) as DET_SPE_ASS_ASSISTED_ACTUAL,
   sum(a.OTHER_ALONE_ACTUAL) as OTHER_ALONE_ACTUAL,
   sum(a.OTHER_ASSISTED_ACTUAL) as OTHER_ASSISTED_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id and a.data_year = b.data_year
 GROUP BY a.data_year, b.ori, b.state_abbr, b.agency_id,a.activity_name, a.activity_id
 ORDER BY a.data_year, b.ori, b.state_abbr, a.activity_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_national AS
 SELECT data_year,
   sum(FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.leoka_assault_activity_assignment_data
 GROUP BY data_year
 ORDER BY data_year;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_regional AS
 SELECT a.data_year,
   b.region_code,
   b.region_name,
   sum(a.FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(a.KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(a.HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(a.OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id
 GROUP BY a.data_year,  b.region_name,b.region_code
 ORDER BY a.data_year,  b.region_name,b.region_code;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_state AS
 SELECT a.data_year,
   b.state_abbr,
   b.state_id,
   sum(a.FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(a.KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(a.HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(a.OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id
 GROUP BY a.data_year, b.state_abbr, b.state_id
 ORDER BY a.data_year, b.state_abbr, b.state_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_agency AS
 SELECT a.data_year,
   b.ori,
   b.agency_id,
   b.state_abbr,
   b.state_id,
   sum(a.FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(a.KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(a.HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(a.OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id
 GROUP BY a.data_year, b.ori, b.state_abbr, b.state_id, b.agency_id
 ORDER BY a.data_year, b.ori, b.state_abbr, b.state_id, b.agency_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_per_group_national AS
 SELECT distinct a.population_group_code,
   a.population_group_desc,
   b.data_year,
   sum(b.FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(b.KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(b.HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(b.OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.agency_data a
 JOIN public.leoka_assault_activity_assignment_data b on a.agency_id=b.agency_id and a.data_year = b.data_year
 GROUP BY b.data_year, a.population_group_code, a.population_group_desc
 ORDER BY b.data_year, a.population_group_code;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_per_group_regional AS
 SELECT distinct a.population_group_code,
   a.population_group_desc,
   b.data_year,
   a.region_code,
   a.region_name,
   sum(b.FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(b.KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(b.HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(b.OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.agency_data a
 JOIN public.leoka_assault_activity_assignment_data b on a.agency_id=b.agency_id and a.data_year = b.data_year
 GROUP BY b.data_year, a.region_code,a.region_name, a.population_group_code, a.population_group_desc
 ORDER BY b.data_year, a.region_code, a.region_name,a.population_group_code;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_per_group_state AS
 SELECT distinct a.population_group_code,
   a.population_group_desc,
   b.data_year,
   a.state_abbr,
   a.state_id,
   sum(b.FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(b.KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(b.HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(b.OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.agency_data a
 JOIN public.leoka_assault_activity_assignment_data b on a.agency_id=b.agency_id and a.data_year = b.data_year
 GROUP BY b.data_year, a.state_abbr,  a.state_id, a.population_group_code, a.population_group_desc
 ORDER BY b.data_year, a.state_abbr,   a.state_id,a.population_group_code;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_per_activity_national AS
 SELECT data_year,
   activity_name,
   activity_id,
   sum(FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.leoka_assault_activity_assignment_data
 GROUP BY data_year, activity_name, activity_id
 ORDER BY data_year, activity_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_per_activity_regional AS
 SELECT a.data_year,
   b.region_code,
   b.region_name,
   a.activity_name,
   a.activity_id,
   sum(a.FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(a.KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(a.HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(a.OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id  and a.data_year = b.data_year
 GROUP BY a.data_year, b.region_code, b.region_name, a.activity_name, a.activity_id
 ORDER BY a.data_year, b.region_code,b.region_name, a.activity_id;


 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_per_activity_state AS
 SELECT a.data_year,
   b.state_abbr,
   b.state_id,
   a.activity_name,
   a.activity_id,
   sum(FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id  and a.data_year = b.data_year
 GROUP BY a.data_year, b.state_abbr, b.state_id,a.activity_name, a.activity_id
 ORDER BY a.data_year, b.state_abbr, b.state_id,a.activity_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_weapon_per_activity_agency AS
 SELECT a.data_year,
   b.ori,
   b.agency_id,
   b.state_abbr,
   b.state_id,
   a.activity_name,
   a.activity_id,
   sum(a.FIREARM_ACTUAL) as FIREARM_ACTUAL,
   sum(a.KNIFE_ACTUAL) as KNIFE_ACTUAL,
   sum(a.HANDS_FISTS_FEET_ACTUAL) as HANDS_FISTS_FEET_ACTUAL,
   sum(a.OTHER_ACTUAL) as OTHER_ACTUAL
 FROM public.leoka_assault_activity_assignment_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id  and a.data_year = b.data_year
 GROUP BY a.data_year, b.ori,b.agency_id, b.state_abbr, b.state_id,a.activity_name, a.activity_id
 ORDER BY a.data_year, b.ori, b.agency_id , b.state_abbr, b.state_id,a.activity_id;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_time_dist_national AS
 SELECT a.data_year,
 sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt) as total_cnt,
 sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt) as total_am_cnt,
 (sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)*1.0)/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+ sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)) *100 as total_am_dist,
 sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt) as total_pm_cnt,
 (sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)*1.0)/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)) *100 as total_pm_dist,
 sum(a.time_0001_0200_cnt) as time_0001_0200_cnt,
 sum(a.time_0001_0200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0001_0200_dist,
 sum(a.time_0201_0400_cnt) as time_0201_0400_cnt,
 sum(a.time_0201_0400_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0201_0400_dist,
 sum(a.time_0401_0600_cnt) as time_0401_0600_cnt,
 sum(a.time_0401_0600_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0401_0600_dist,
 sum(a.time_0601_0800_cnt) as time_0601_0800_cnt,
 sum(a.time_0601_0800_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0601_0800_dist,
 sum(a.time_0801_1000_cnt) as time_0801_1000_cnt,
 sum(a.time_0801_1000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0801_1000_dist,
 sum(a.time_1001_1200_cnt) as time_1001_1200_cnt,
 sum(a.time_1001_1200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1001_1200_dist,
 sum(a.time_1201_1400_cnt) as time_1201_1400_cnt,
 sum(a.time_1201_1400_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1201_1400_dist,
 sum(a.time_1401_1600_cnt) as time_1401_1600_cnt,
 sum(a.time_1401_1600_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1401_1600_dist,
 sum(a.time_1601_1800_cnt) as time_1601_1800_cnt,
 sum(a.time_1601_1800_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1601_1800_dist,
 sum(a.time_1801_2000_cnt) as time_1801_2000_cnt,
 sum(a.time_1801_2000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1801_2000_dist,
 sum(a.time_2001_2200_cnt) as time_2001_2200_cnt,
 sum(a.time_2001_2200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_2001_2200_dist,
 sum(a.time_2201_0000_cnt) as time_2201_0000_cnt,
 sum(a.time_2201_0000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_2201_0000_dist
FROM public.leoka_assault_time_injury_data a
GROUP BY a.data_year;

CREATE MATERIALIZED VIEW public.leoka_assault_weapon_injury_national AS
SELECT a.data_year,
sum(firearm_injury_cnt) + sum(knife_injury_cnt) + sum(hands_fists_feet_injury_cnt) + sum(other_injury_cnt) as total_injury_cnt,
sum(firearm_injury_cnt) as firearm_injury_cnt,
sum(knife_injury_cnt) as knife_injury_cnt,
sum(hands_fists_feet_injury_cnt) as hands_fists_feet_injury_cnt,
sum(other_injury_cnt) as other_injury_cnt,
sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) as total_no_injury_cnt,
sum(firearm_no_injury_cnt) as firearm_no_injury_cnt,
sum(knife_no_injury_cnt) as knife_no_injury_cnt,
sum(hands_fists_feet_no_injury_cnt) as hands_fists_feet_no_injury_cnt,
sum(other_no_injury_cnt) as other_no_injury_cnt,
sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) + sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) as total_cnt,
sum(firearm_no_injury_cnt) + sum(firearm_injury_cnt) as firearm_total_cnt,
sum(knife_no_injury_cnt) + sum(knife_injury_cnt) as knife_total_cnt,
sum(hands_fists_feet_no_injury_cnt) + sum(hands_fists_feet_injury_cnt) as hands_fists_feet_total_cnt,
sum(other_no_injury_cnt) + sum(other_injury_cnt) as other_total_cnt
FROM public.leoka_assault_time_injury_data a
GROUP BY a.data_year;

CREATE MATERIALIZED VIEW public.leoka_assault_weapon_injury_region AS
SELECT a.data_year,
b.region_code,
b.region_name,
sum(firearm_injury_cnt) + sum(knife_injury_cnt) + sum(hands_fists_feet_injury_cnt) + sum(other_injury_cnt) as total_injury_cnt,
sum(firearm_injury_cnt) as firearm_injury_cnt,
sum(knife_injury_cnt) as knife_injury_cnt,
sum(hands_fists_feet_injury_cnt) as hands_fists_feet_injury_cnt,
sum(other_injury_cnt) as other_injury_cnt,
sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) as total_no_injury_cnt,
sum(firearm_no_injury_cnt) as firearm_no_injury_cnt,
sum(knife_no_injury_cnt) as knife_no_injury_cnt,
sum(hands_fists_feet_no_injury_cnt) as hands_fists_feet_no_injury_cnt,
sum(other_no_injury_cnt) as other_no_injury_cnt,
sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) + sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) as total_cnt,
sum(firearm_no_injury_cnt) + sum(firearm_injury_cnt) as firearm_total_cnt,
sum(knife_no_injury_cnt) + sum(knife_injury_cnt) as knife_total_cnt,
sum(hands_fists_feet_no_injury_cnt) + sum(hands_fists_feet_injury_cnt) as hands_fists_feet_total_cnt,
sum(other_no_injury_cnt) + sum(other_injury_cnt) as other_total_cnt
FROM public.leoka_assault_time_injury_data a
JOIN public.agency_data b on b.agency_id=a.agency_id  and a.data_year = b.data_year
GROUP BY a.data_year, b.ori,b.agency_id, b.region_code, b.region_name;

CREATE MATERIALIZED VIEW public.leoka_assault_weapon_injury_state AS
SELECT a.data_year,
b.state_id,
b.state_abbr,
sum(firearm_injury_cnt) + sum(knife_injury_cnt) + sum(hands_fists_feet_injury_cnt) + sum(other_injury_cnt) as total_injury_cnt,
sum(firearm_injury_cnt) as firearm_injury_cnt,
sum(knife_injury_cnt) as knife_injury_cnt,
sum(hands_fists_feet_injury_cnt) as hands_fists_feet_injury_cnt,
sum(other_injury_cnt) as other_injury_cnt,
sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) as total_no_injury_cnt,
sum(firearm_no_injury_cnt) as firearm_no_injury_cnt,
sum(knife_no_injury_cnt) as knife_no_injury_cnt,
sum(hands_fists_feet_no_injury_cnt) as hands_fists_feet_no_injury_cnt,
sum(other_no_injury_cnt) as other_no_injury_cnt,
sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) + sum(firearm_no_injury_cnt) + sum(knife_no_injury_cnt) + sum(hands_fists_feet_no_injury_cnt) + sum(other_no_injury_cnt) as total_cnt,
sum(firearm_no_injury_cnt) + sum(firearm_injury_cnt) as firearm_total_cnt,
sum(knife_no_injury_cnt) + sum(knife_injury_cnt) as knife_total_cnt,
sum(hands_fists_feet_no_injury_cnt) + sum(hands_fists_feet_injury_cnt) as hands_fists_feet_total_cnt,
sum(other_no_injury_cnt) + sum(other_injury_cnt) as other_total_cnt
FROM public.leoka_assault_time_injury_data a
JOIN public.agency_data b on b.agency_id=a.agency_id  and a.data_year = b.data_year
GROUP BY a.data_year, b.ori,b.agency_id, b.state_id, b.state_abbr;

/*
 CREATE MATERIALIZED VIEW public.leoka_assault_by_time_dist_region AS
 SELECT a.data_year,
   b.region_code,
   b.region_name,
   sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt) as total_cnt,
   sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt) as total_am_cnt,
   (sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)*1.0)/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+ sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)) *100 as total_am_dist,
   sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt) as total_pm_cnt,
   (sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)*1.0)/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)) *100 as total_pm_dist,
   sum(a.time_0001_0200_cnt) as time_0001_0200_cnt,
   sum(a.time_0001_0200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0001_0200_dist,
   sum(a.time_0201_0400_cnt) as time_0201_0400_cnt,
   sum(a.time_0201_0400_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0201_0400_dist,
   sum(a.time_0401_0600_cnt) as time_0401_0600_cnt,
   sum(a.time_0401_0600_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0401_0600_dist,
   sum(a.time_0601_0800_cnt) as time_0601_0800_cnt,
   sum(a.time_0601_0800_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0601_0800_dist,
   sum(a.time_0801_1000_cnt) as time_0801_1000_cnt,
   sum(a.time_0801_1000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0801_1000_dist,
   sum(a.time_1001_1200_cnt) as time_1001_1200_cnt,
   sum(a.time_1001_1200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1001_1200_dist,
   sum(a.time_1201_1400_cnt) as time_1201_1400_cnt,
   sum(a.time_1201_1400_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1201_1400_dist,
   sum(a.time_1401_1600_cnt) as time_1401_1600_cnt,
   sum(a.time_1401_1600_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1401_1600_dist,
   sum(a.time_1601_1800_cnt) as time_1601_1800_cnt,
   sum(a.time_1601_1800_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1601_1800_dist,
   sum(a.time_1801_2000_cnt) as time_1801_2000_cnt,
   sum(a.time_1801_2000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1801_2000_dist,
   sum(a.time_2001_2200_cnt) as time_2001_2200_cnt,
   sum(a.time_2001_2200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_2001_2200_dist,
   sum(a.time_2201_0000_cnt) as time_2201_0000_cnt,
   sum(a.time_2201_0000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_2201_0000_dist
 FROM public.leoka_assault_time_injury_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id  and a.data_year = b.data_year
 GROUP BY a.data_year, b.ori,b.agency_id, b.region_code, b.region_name;

 CREATE MATERIALIZED VIEW public.leoka_assault_by_time_dist_state AS
 SELECT a.data_year,
   b.state_abbr,
   b.state_id,
   sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt) as total_cnt,
   sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt) as total_am_cnt,
   (sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)*1.0)/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+ sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)) *100 as total_am_dist,
   sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt) as total_pm_cnt,
   (sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)*1.0)/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt)) *100 as total_pm_dist,
   sum(a.time_0001_0200_cnt) as time_0001_0200_cnt,
   sum(a.time_0001_0200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0001_0200_dist,
   sum(a.time_0201_0400_cnt) as time_0201_0400_cnt,
   sum(a.time_0201_0400_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0201_0400_dist,
   sum(a.time_0401_0600_cnt) as time_0401_0600_cnt,
   sum(a.time_0401_0600_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0401_0600_dist,
   sum(a.time_0601_0800_cnt) as time_0601_0800_cnt,
   sum(a.time_0601_0800_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0601_0800_dist,
   sum(a.time_0801_1000_cnt) as time_0801_1000_cnt,
   sum(a.time_0801_1000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_0801_1000_dist,
   sum(a.time_1001_1200_cnt) as time_1001_1200_cnt,
   sum(a.time_1001_1200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1001_1200_dist,
   sum(a.time_1201_1400_cnt) as time_1201_1400_cnt,
   sum(a.time_1201_1400_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1201_1400_dist,
   sum(a.time_1401_1600_cnt) as time_1401_1600_cnt,
   sum(a.time_1401_1600_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1401_1600_dist,
   sum(a.time_1601_1800_cnt) as time_1601_1800_cnt,
   sum(a.time_1601_1800_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1601_1800_dist,
   sum(a.time_1801_2000_cnt) as time_1801_2000_cnt,
   sum(a.time_1801_2000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_1801_2000_dist,
   sum(a.time_2001_2200_cnt) as time_2001_2200_cnt,
   sum(a.time_2001_2200_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_2001_2200_dist,
   sum(a.time_2201_0000_cnt) as time_2201_0000_cnt,
   sum(a.time_2201_0000_cnt)*1.0/(sum(a.time_0001_0200_cnt)+sum(a.time_0201_0400_cnt)+sum(a.time_0401_0600_cnt)+sum(a.time_0601_0800_cnt)+sum(a.time_0801_1000_cnt)+sum(a.time_1001_1200_cnt)+sum(a.time_1201_1400_cnt)+sum(a.time_1401_1600_cnt)+sum(a.time_1601_1800_cnt)+sum(a.time_1801_2000_cnt)+sum(a.time_2001_2200_cnt)+sum(a.time_2201_0000_cnt))*100 as time_2201_0000_dist
 FROM public.leoka_assault_time_injury_data a
 JOIN public.agency_data b on b.agency_id=a.agency_id  and a.data_year = b.data_year
 GROUP BY a.data_year, b.ori,b.agency_id, b.state_abbr, b.state_id;
*/
