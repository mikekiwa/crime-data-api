from webargs.flaskparser import use_args
from crime_data.extensions import DEFAULT_MAX_AGE
from flask.ext.cachecontrol import cache
from sqlalchemy import func

from crime_data.common import cdemodels, marshmallow_schemas
from crime_data.common.base import CdeResource, tuning_page
from crime_data.common.marshmallow_schemas import ArgumentsSchema

class SummarizedData(CdeResource):
    schema = marshmallow_schemas.SummarizedDataSchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args):
        self.verify_api_key(args)
        query = cdemodels.SummarizedData.get(state_abbr=state_abbr,ori=ori)
        return self.with_metadata(query,args)

class SummarizedDataAgency(CdeResource):
    schema = marshmallow_schemas.SummarizedDataAgencySchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args, ori=None, state_abbr=None):
        self.verify_api_key(args)
        query = cdemodels.SummarizedDataAgency.get(state_abbr=state_abbr,ori=ori)
        return self.with_metadata(query,args)

class SummarizedDataState(CdeResource):
    schema = marshmallow_schemas.SummarizedDataStateSchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args,state_abbr=None):
        self.verify_api_key(args)
        query = cdemodels.SummarizedDataState.get(state_abbr=state_abbr)
        return self.with_metadata(query,args)

class SummarizedDataRegion(CdeResource):
    schema = marshmallow_schemas.SummarizedDataRegionSchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args,region_name=None):
        self.verify_api_key(args)
        query = cdemodels.SummarizedDataRegion.get(region_name=region_name)
        return self.with_metadata(query,args)

class SummarizedDataNational(CdeResource):
    schema = marshmallow_schemas.SummarizedDataNationalSchema(many=True)
    @use_args(ArgumentsSchema)
    @cache(max_age=DEFAULT_MAX_AGE, public=True)
    def get(self, args,):
        self.verify_api_key(args)
        query = cdemodels.SummarizedDataNational.query
        return self.with_metadata(query,args)