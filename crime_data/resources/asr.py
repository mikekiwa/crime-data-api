from webargs.flaskparser import use_args
from itertools import filterfalse
from crime_data.common import marshmallow_schemas, cdemodels, lookupmodels, munger
from crime_data.common.base import CdeResource, tuning_page, ExplorerOffenseMapping
from crime_data.extensions import DEFAULT_MAX_AGE
from flask.ext.cachecontrol import cache
from flask import jsonify
from crime_data.common.marshmallow_schemas import ArgumentsSchema

class ASRMaleByAgeCount(CdeResource):
    schema = marshmallow_schemas.ASRMaleByAgeCountAgencySchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args, level=None, level_value=None):
        self.verify_api_key(args)
        if level == 'agency':
            query = cdemodels.ASRMaleByAgeCountAgency.get(level_value)
            creator = munger.UIComponentCreator(query.all(),'asr_age_male_count','offense_name')
        elif level == 'state':
            self.schema = marshmallow_schemas.ASRMaleByAgeCountStateSchema(many=True)
            query = cdemodels.ASRMaleByAgeCountState.get(level_value)
            creator = munger.UIComponentCreator(query.all(),'asr_age_male_count','offense_name')
        elif level == 'region':
            self.schema = marshmallow_schemas.ASRMaleByAgeCountRegionSchema(many=True)
            query = cdemodels.ASRMaleByAgeCountRegion.get(level_value)
            creator = munger.UIComponentCreator(query.all(),'asr_age_male_count','offense_name')
        else:
            self.schema = marshmallow_schemas.ASRMaleByAgeCountNationalSchema(many=True)
            query = cdemodels.ASRMaleByAgeCountNational.query
            creator = munger.UIComponentCreator(query.all(),'asr_age_male_count','offense_name')
        ui = creator.munge_set()
        return self.without_metadata(ui, args)

class ASRFemaleByAgeCount(CdeResource):
    schema = marshmallow_schemas.ASRFemaleByAgeCountAgencySchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args, level=None, level_value=None):
        self.verify_api_key(args)
        if level == 'agency':
            query = cdemodels.ASRFemaleByAgeCountAgency.get(level_value)
            creator = munger.UIComponentCreator(query.all(),'asr_age_female_count','offense_name')
        elif level == 'state':
            self.schema = marshmallow_schemas.ASRFemaleByAgeCountStateSchema(many=True)
            query = cdemodels.ASRFemaleByAgeCountState.get(level_value)
            creator = munger.UIComponentCreator(query.all(),'asr_age_female_count','offense_name')
        elif level == 'region':
            self.schema = marshmallow_schemas.ASRFemaleByAgeCountRegionSchema(many=True)
            query = cdemodels.ASRFemaleByAgeCountRegion.get(level_value)
            creator = munger.UIComponentCreator(query.all(),'asr_age_female_count','offense_name')
        else:
            self.schema = marshmallow_schemas.ASRFemaleByAgeCountNationalSchema(many=True)
            query = cdemodels.ASRFemaleByAgeCountNational.query
            creator = munger.UIComponentCreator(query.all(),'asr_age_female_count','offense_name')
        ui = creator.munge_set()
        return self.without_metadata(ui, args)

class ASRRaceCount(CdeResource):
    schema = marshmallow_schemas.ASRRaceCountSchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args):
        self.verify_api_key(args)
        result = cdemodels.ASRRaceCount.query
        return self.with_metadata(result, args)

class ASRRaceYouthCount(CdeResource):
    schema = marshmallow_schemas.ASRRaceYouthCountSchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args):
        self.verify_api_key(args)
        result = cdemodels.ASRRaceYouthCount.query
        return self.with_metadata(result, args)