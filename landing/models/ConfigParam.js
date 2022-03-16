// ConfigParam Model

import { Model } from '@vuex-orm/core'

export default class ConfigParam extends Model {

    static entity = 'config-params'

    // // Reference to base entity name.
    // static baseEntity = 'base'

    // List of all fields (schema) of the  model. `this.attr` is used

    static fields() {
      return {
        // Base
        id: this.uid(),
        
        // relationships
        sample_params_public_id: this.string(''),

        // attributes
        key: this.string(''),
        value: this.attr(null),
        value_type: this.attr(null)
      }
    }
}
