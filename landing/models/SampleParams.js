// SampleParams Model

import { Model } from '@vuex-orm/core'

export default class SampleParams extends Model {

    static entity = 'sample-params'

    // // Reference to base entity name.
    // static baseEntity = 'base'

    // List of all fields (schema) of the  model. `this.attr` is used

    static fields() {
      return {
        // Base
        id: this.uid(),
        name: this.string(''),

        // relationships
        request_docs_public_id: this.string(''),


        // attributes
        service_name: this.string(''),
        data: this.attr(null),
        config: this.attr(null)

      }
    }
}
