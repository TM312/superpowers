// Request Model

import { Model } from '@vuex-orm/core'
import Faq from './Faq'
import SampleParams from './SampleParams'
import ParamDocs from './ParamDocs'


export default class RequestDocs extends Model {

    static entity = 'request-docs'

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
        param_docs: this.hasMany(ParamDocs, 'request_docs_public_id'),
        sample_params: this.hasOne(SampleParams, 'request_docs_public_id'),
        faqs: this.hasMany(Faq, 'request_docs_public_id'),
      }
    }
}
