# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-10-03 18:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CrimeType',
            fields=[
                ('crime_type_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('crime_type_name', models.CharField(blank=True, max_length=50, null=True)),
                ('crime_type_sort_order', models.SmallIntegerField(blank=True, null=True)),
                ('crime_flag', models.CharField(blank=True, max_length=1, null=True)),
            ],
            options={
                'db_table': 'crime_type',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='OffenseClassification',
            fields=[
                ('classification_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('classification_name', models.CharField(blank=True, max_length=50, null=True)),
                ('class_sort_order', models.SmallIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'offense_classification',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefAgency',
            fields=[
                ('agency_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('ori', models.CharField(max_length=9, unique=True)),
                ('legacy_ori', models.CharField(max_length=9)),
                ('ucr_agency_name', models.CharField(blank=True, max_length=100, null=True)),
                ('ncic_agency_name', models.CharField(blank=True, max_length=100, null=True)),
                ('pub_agency_name', models.CharField(blank=True, max_length=100, null=True)),
                ('special_mailing_group', models.CharField(blank=True, max_length=1, null=True)),
                ('special_mailing_address', models.CharField(blank=True, max_length=1, null=True)),
                ('agency_status', models.CharField(max_length=1)),
                ('judicial_dist_code', models.CharField(blank=True, max_length=4, null=True)),
                ('fid_code', models.CharField(blank=True, max_length=2, null=True)),
                ('added_date', models.DateTimeField(blank=True, null=True)),
                ('change_timestamp', models.DateTimeField(blank=True, null=True)),
                ('change_user', models.CharField(blank=True, max_length=100, null=True)),
                ('legacy_notify_agency', models.CharField(blank=True, max_length=1, null=True)),
                ('dormant_year', models.SmallIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'ref_agency',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefAgencyCounty',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('core_city_flag', models.CharField(blank=True, max_length=1, null=True)),
                ('data_year', models.SmallIntegerField()),
                ('population', models.BigIntegerField(blank=True, null=True)),
                ('census', models.BigIntegerField(blank=True, null=True)),
                ('legacy_county_code', models.CharField(blank=True, max_length=20, null=True)),
                ('legacy_msa_code', models.CharField(blank=True, max_length=20, null=True)),
                ('source_flag', models.CharField(blank=True, max_length=1, null=True)),
                ('change_timestamp', models.DateTimeField(blank=True, null=True)),
                ('change_user', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_agency_county',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefAgencyCoveredBy',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_year', models.SmallIntegerField()),
            ],
            options={
                'db_table': 'ref_agency_covered_by',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefAgencyDataContent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_year', models.SmallIntegerField()),
                ('reporting_type', models.CharField(blank=True, max_length=1, null=True)),
                ('nibrs_ct_flag', models.CharField(blank=True, max_length=1, null=True)),
                ('nibrs_hc_flag', models.CharField(blank=True, max_length=1, null=True)),
                ('nibrs_leoka_flag', models.CharField(blank=True, max_length=1, null=True)),
                ('nibrs_arson_flag', models.CharField(blank=True, max_length=1, null=True)),
                ('summary_rape_def', models.CharField(blank=True, max_length=1, null=True)),
                ('nibrs_ht_flag', models.CharField(blank=True, max_length=1, null=True)),
            ],
            options={
                'db_table': 'ref_agency_data_content',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefAgencyPoc',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('agency_id', models.BigIntegerField()),
                ('primary_poc_flag', models.CharField(blank=True, max_length=1, null=True)),
            ],
            options={
                'db_table': 'ref_agency_poc',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefAgencyType',
            fields=[
                ('agency_type_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('agency_type_name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_agency_type',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefCampusPopulation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_year', models.SmallIntegerField()),
                ('population', models.BigIntegerField(blank=True, null=True)),
                ('source_flag', models.CharField(max_length=1)),
                ('census', models.BigIntegerField(blank=True, null=True)),
                ('change_timestamp', models.DateTimeField(blank=True, null=True)),
                ('change_user', models.CharField(blank=True, max_length=100, null=True)),
                ('reporting_population', models.BigIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'ref_campus_population',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefCity',
            fields=[
                ('city_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('city_name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_city',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefContinent',
            fields=[
                ('continent_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('continent_desc', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'ref_continent',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefCountry',
            fields=[
                ('country_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('country_desc', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'ref_country',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefCounty',
            fields=[
                ('county_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('county_name', models.CharField(blank=True, max_length=100, null=True)),
                ('county_ansi_code', models.CharField(blank=True, max_length=5, null=True)),
                ('county_fips_code', models.CharField(blank=True, max_length=5, null=True)),
                ('legacy_county_code', models.CharField(blank=True, max_length=5, null=True)),
                ('comments', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'ref_county',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefCountyPopulation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_year', models.SmallIntegerField()),
                ('population', models.BigIntegerField(blank=True, null=True)),
                ('source_flag', models.CharField(max_length=1)),
                ('change_timestamp', models.DateTimeField(blank=True, null=True)),
                ('change_user', models.CharField(blank=True, max_length=100, null=True)),
                ('reporting_population', models.BigIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'ref_county_population',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefDepartment',
            fields=[
                ('department_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('department_name', models.CharField(max_length=100)),
                ('active_flag', models.CharField(max_length=1)),
                ('sort_order', models.SmallIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'ref_department',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefDivision',
            fields=[
                ('division_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('division_code', models.CharField(blank=True, max_length=2, null=True)),
                ('division_name', models.CharField(blank=True, max_length=100, null=True)),
                ('division_desc', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_division',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefFieldOffice',
            fields=[
                ('field_office_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('field_office_code', models.CharField(blank=True, max_length=10, null=True)),
                ('field_office_name', models.CharField(blank=True, max_length=100, null=True)),
                ('field_office_alpha_code', models.CharField(blank=True, max_length=2, null=True)),
                ('field_office_numeric_code', models.CharField(blank=True, max_length=10, null=True)),
            ],
            options={
                'db_table': 'ref_field_office',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefGlobalLocation',
            fields=[
                ('global_location_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('global_location_desc', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'ref_global_location',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefMetroDivision',
            fields=[
                ('metro_div_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('metro_div_name', models.CharField(blank=True, max_length=100, null=True)),
                ('msa_flag', models.CharField(blank=True, max_length=1, null=True)),
                ('metro_div_omb_code', models.CharField(blank=True, max_length=5, null=True)),
                ('legacy_msa_code', models.CharField(blank=True, max_length=5, null=True)),
            ],
            options={
                'db_table': 'ref_metro_division',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefMetroDivPopulation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_year', models.SmallIntegerField()),
                ('population', models.BigIntegerField(blank=True, null=True)),
                ('source_flag', models.CharField(max_length=1)),
                ('census', models.BigIntegerField(blank=True, null=True)),
                ('change_timestamp', models.DateTimeField(blank=True, null=True)),
                ('change_user', models.CharField(blank=True, max_length=100, null=True)),
                ('reporting_population', models.BigIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'ref_metro_div_population',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefMsa',
            fields=[
                ('msa_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('msa_name', models.CharField(blank=True, max_length=100, null=True)),
                ('msa_omb_code', models.CharField(blank=True, max_length=5, null=True)),
            ],
            options={
                'db_table': 'ref_msa',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefParentPopulationGroup',
            fields=[
                ('parent_pop_group_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('parent_pop_group_code', models.CharField(blank=True, max_length=2, null=True)),
                ('parent_pop_group_desc', models.CharField(blank=True, max_length=100, null=True)),
                ('publication_name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_parent_population_group',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefPoc',
            fields=[
                ('poc_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('poc_name', models.CharField(blank=True, max_length=200, null=True)),
                ('poc_title', models.CharField(blank=True, max_length=200, null=True)),
                ('poc_email', models.CharField(blank=True, max_length=200, null=True)),
                ('poc_phone1', models.CharField(blank=True, max_length=50, null=True)),
                ('poc_phone2', models.CharField(blank=True, max_length=50, null=True)),
                ('mailing_address_1', models.CharField(blank=True, max_length=150, null=True)),
                ('mailing_address_2', models.CharField(blank=True, max_length=150, null=True)),
                ('mailing_address_3', models.CharField(blank=True, max_length=150, null=True)),
                ('mailing_address_4', models.CharField(blank=True, max_length=150, null=True)),
                ('zip_code', models.CharField(blank=True, max_length=10, null=True)),
                ('city_name', models.CharField(blank=True, max_length=100, null=True)),
                ('poc_fax1', models.CharField(blank=True, max_length=20, null=True)),
                ('poc_fax2', models.CharField(blank=True, max_length=20, null=True)),
            ],
            options={
                'db_table': 'ref_poc',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefPocRole',
            fields=[
                ('poc_role_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('poc_role_name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_poc_role',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefPocRoleAssign',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'ref_poc_role_assign',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefPopulationFamily',
            fields=[
                ('population_family_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('population_family_name', models.CharField(blank=True, max_length=100, null=True)),
                ('population_family_desc', models.CharField(blank=True, max_length=200, null=True)),
                ('sort_order', models.SmallIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'ref_population_family',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefPopulationGroup',
            fields=[
                ('population_group_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('population_group_code', models.CharField(blank=True, max_length=2, null=True)),
                ('population_group_desc', models.CharField(blank=True, max_length=150, null=True)),
                ('publication_name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_population_group',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefRace',
            fields=[
                ('race_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('race_code', models.CharField(max_length=2, unique=True)),
                ('race_desc', models.CharField(max_length=100)),
                ('sort_order', models.SmallIntegerField(blank=True, null=True)),
                ('start_year', models.SmallIntegerField(blank=True, null=True)),
                ('end_year', models.SmallIntegerField(blank=True, null=True)),
                ('notes', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'ref_race',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefRegion',
            fields=[
                ('region_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('region_code', models.CharField(blank=True, max_length=2, null=True)),
                ('region_name', models.CharField(blank=True, max_length=100, null=True)),
                ('region_desc', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_region',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefState',
            fields=[
                ('state_id', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('state_name', models.CharField(blank=True, max_length=100, null=True)),
                ('state_code', models.CharField(blank=True, max_length=2, null=True)),
                ('state_abbr', models.CharField(blank=True, max_length=2, null=True)),
                ('state_postal_abbr', models.CharField(blank=True, max_length=2, null=True)),
                ('state_fips_code', models.CharField(blank=True, max_length=2, null=True)),
                ('state_pub_freq_months', models.SmallIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'ref_state',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefSubmittingAgency',
            fields=[
                ('agency_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('sai', models.CharField(blank=True, max_length=9, null=True)),
                ('agency_name', models.CharField(blank=True, max_length=150, null=True)),
                ('notify_agency', models.CharField(blank=True, max_length=1, null=True)),
                ('agency_email', models.CharField(blank=True, max_length=200, null=True)),
                ('agency_website', models.CharField(blank=True, max_length=2000, null=True)),
                ('comments', models.CharField(blank=True, max_length=2000, null=True)),
            ],
            options={
                'db_table': 'ref_submitting_agency',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefTribe',
            fields=[
                ('tribe_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('tribe_name', models.CharField(blank=True, max_length=100, null=True, unique=True)),
            ],
            options={
                'db_table': 'ref_tribe',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefTribePopulation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_year', models.SmallIntegerField()),
                ('population', models.BigIntegerField(blank=True, null=True)),
                ('source_flag', models.CharField(max_length=1)),
                ('census', models.BigIntegerField(blank=True, null=True)),
                ('change_timestamp', models.DateTimeField(blank=True, null=True)),
                ('change_user', models.CharField(blank=True, max_length=100, null=True)),
                ('reporting_population', models.BigIntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'ref_tribe_population',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefUniversity',
            fields=[
                ('university_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('university_abbr', models.CharField(blank=True, max_length=20, null=True)),
                ('university_name', models.CharField(blank=True, max_length=100, null=True, unique=True)),
            ],
            options={
                'db_table': 'ref_university',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RefUniversityCampus',
            fields=[
                ('campus_id', models.BigIntegerField(primary_key=True, serialize=False)),
                ('campus_name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'ref_university_campus',
                'managed': False,
            },
        ),
    ]
