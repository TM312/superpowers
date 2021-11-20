import { Database } from '@vuex-orm/core'
import Base from '@/models/Base'
import Request from '@/models/Request'
import RequestParamsSample from '~/models/RequestParamsSample'
import Param from '@/models/Param'
import Faq from '@/models/Faq'


const database = new Database()

database.register(Base)
database.register(Request)
database.register(RequestParamsSample)
database.register(Param)
database.register(Faq)


export default database
