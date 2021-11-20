// RequestParamsSample Model

import { Model } from '@vuex-orm/core'




export default class RequestParamsSample extends Model {

  static entity = 'request-params-samples'

  static primaryKey = 'public_id'


  // // Reference to base entity name.
  // static baseEntity = 'base'

  // List of all fields (schema) of the  model. `this.attr` is used

  static fields() {
    return {
      // Base
      id: this.uid(),
      public_id: this.string(''),
      request_public_id: this.string(''),
      service_name: this.string(''),
      service_config: this.attr(null),
      data: this.attr(null)
    }
  }
}
