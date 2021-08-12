// LogType Model

import { Model } from '@vuex-orm/core'



export default class Request extends Model {

    static entity = 'requests'

    static primaryKey = 'public_id'


    // // Reference to base entity name.
    // static baseEntity = 'base'

    // List of all fields (schema) of the  model. `this.attr` is used

    static fields() {
      return {
        // Base
        id: this.uid(),
        public_id: this.string(''),

        // attributes
        name: this.string(''),
        description: this.string(''),
        updated_at: this.string('')
      }
    }
}
