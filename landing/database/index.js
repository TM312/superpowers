import { Database } from '@vuex-orm/core'
import Base from '@/models/Base'
import Request from '@/models/Request'


const database = new Database()

database.register(Base)
database.register(Request)


export default database
