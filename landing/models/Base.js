// Base Model

import { Model } from '@vuex-orm/core'

export default class Base extends Model {
    // This is the name used as module name of the Vuex Store.
    static entity = 'base'

    // List of all fields (schema) of the post model. `this.attr` is used
    // for the generic field type. The argument is the default value.
    static fields() {
      return {
        id: this.number(null).nullable(),
        public_id: this.string(''),
        created_on: this.string(''),
        updated_at: this.string(null).nullable()
      }
    }
}
