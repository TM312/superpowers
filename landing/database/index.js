import { Database } from '@vuex-orm/core'
import Base from '@/models/Base'
import ConfigParam from '~/models/ConfigParam'
import RequestDocs from '~/models/RequestDocs'
import ParamDocs from '~/models/ParamDocs'
import SampleParams from '~/models/SampleParams'
import Faq from '@/models/Faq'


const database = new Database()

database.register(Base)
database.register(ConfigParam)
database.register(RequestDocs)
database.register(ParamDocs)
database.register(SampleParams)
database.register(Faq)

export default database
