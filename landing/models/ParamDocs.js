// RequestParamsSample Model

import { Model } from '@vuex-orm/core'




export default class ParamDocs extends Model {

  static entity = 'param-docs'

  static primaryKey = 'id'


  // // Reference to base entity name.
  // static baseEntity = 'base'

  // List of all fields (schema) of the  model. `this.attr` is used

  static fields() {
    return {
      // Base
      id: this.uid(),
      request_docs_public_id: this.string(''),
      key: this.string(''),
      name: this.string(''),
      options: this.attr(null),
    }
  }
}
