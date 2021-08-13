// LogType Model

import { Model } from '@vuex-orm/core'



export default class Param extends Model {

    static entity = 'params'



    // // Reference to base entity name.
    // static baseEntity = 'base'

    // List of all fields (schema) of the  model. `this.attr` is used

    static fields() {
      return {
        // Base
        id: this.uid(),
        name: this.string(''),
        description: this.string(''),


        // attributes
        p_type: this.string(''),
        required: this.boolean(true).nullable(),
        default: this.attr('').nullable(),
        request_param_public_id: this.string('')

      }
    }
}
