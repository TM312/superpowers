// LogType Model

import { Model } from '@vuex-orm/core'



export default class Faq extends Model {

    static entity = 'faqs'



    // // Reference to base entity name.
    // static baseEntity = 'base'

    // List of all fields (schema) of the  model. `this.attr` is used

    static fields() {
      return {
        // Base
        id: this.uid(),

        // attributes
        q: this.string(''),
        a: this.string(''),
        request_param_public_id: this.string('')

      }
    }
}
