import { Database } from '@vuex-orm/core'
import Base from '@/models/Base'
import Request from '@/models/Request'
import Param from '@/models/Param'


const database = new Database()

database.register(Base)
database.register(Request)
database.register(Param)

export default database
