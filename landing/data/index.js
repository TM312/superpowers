
// Emulating todo records which should be returned from API backend
// in the real world.
export default async function data() {
  return [
    {
      'public_id': 'superscale',
      'name': 'Superscale',
      'description': 'A machine learning based service to increase the resolution of images.',
      'updated_at': '2021-08-13 06:35:22.083874',
      'price': 0.001,
      'response_time': 200,
      'regions': ['US East', 'Southeast Asia'],
      'request_params': [
        { request_param_public_id: 'superscale', 'name': 'Test', 'description':'We aregoing to add a description here', 'p_type': 'int', 'required': true, 'default': 'None'},
        { request_param_public_id: 'superscale', 'name': 'Test2', 'description': 'Another description', 'p_type': 'str', 'required': true, 'default': 'DEFAULT' }

      ]
    }
  ]
}
