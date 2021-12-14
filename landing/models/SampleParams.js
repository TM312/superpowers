// SampleParams Model

import { Model } from '@vuex-orm/core'
import ConfigParam from './ConfigParam'

export default class SampleParams extends Model {

    static entity = 'sample-params'

    static primaryKey = 'public_id'

    // // Reference to base entity name.
    // static baseEntity = 'base'

    // List of all fields (schema) of the  model. `this.attr` is used

    static fields() {
      return {
        // Base
        id: this.uid(),
        public_id: this.string(''),

        // relationships
        request_docs_public_id: this.string(''),

        // attributes
        service_name: this.string(''),
        data: this.attr(null),
        config: this.hasMany(ConfigParam, 'sample_params_public_id'),
      }
    }
}
