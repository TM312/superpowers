// Request Model

import { Model } from '@vuex-orm/core'
import Faq from './Faq'
import Param from './Param'
import RequestParamsSample from './RequestParamsSample'


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
        name: this.string(''),
        description: this.string(''),
        updated_at: this.string(''),

        // attributes
        price: this.number(0),
        response_time: this.number(100),
        regions: this.attr([]),


        // relationships
        request_params_sample: this.hasOne(RequestParamsSample, 'request_public_id'),
        request_params: this.hasMany(Param, 'request_param_public_id', 'public_id'),
        faqs: this.hasMany(Faq, 'request_param_public_id', 'public_id'),
      }
    }
}
