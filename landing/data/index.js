
// Emulating todo records which should be returned from API backend
// in the real world.
export default async function data() {
  return [
    // {
    //   public_id: 'sample',
    //   name: 'Sample',
    //   description: 'A machine learning based service to increase the resolution of images.',
    //   updated_at: '2021-08-13 06:35:22.083874',
    //   price: 0.001,
    //   response_time: 200,
    //   regions: ['US East', 'Southeast Asia'],
    //   request_params: [
    //     { request_param_public_id: 'superscale', name: 'Test', description:'We aregoing to add a description here', p_type: 'int', required: true, default: 'None'},
    //     { request_param_public_id: 'superscale', name: 'Test2', description: 'Another description', p_type: 'str', required: true, default: 'DEFAULT' }

    //   ],
    //   faqs: [
    //     {
    //       request_param_public_id: 'superscale',
    //       q:'What can this image scale?',
    //       a: 'It can scale nothing.'
    //     }
    //   ]
    // },
    {
      public_id: 'sample',
      name: 'Sample',
      description: 'A sample service for testing purposes.',
      updated_at: '2021-11-14',
      price: 0.001,
      response_time: 200,
      regions: ['US East', 'Southeast Asia'],
      // request_params: [
      //   { request_param_public_id: 'superscale', name: 'Test', description: 'We aregoing to add a description here', p_type: 'int', required: true, default: 'None' },
      //   { request_param_public_id: 'superscale', name: 'Test2', description: 'Another description', p_type: 'str', required: true, default: 'DEFAULT' }

      // ],
      faqs: [
        {
          request_param_public_id: 'superscale',
          q: 'What can this image scale?',
          a: 'It can scale nothing.'
        }
      ]
    },
    {
      public_id: 'get-round',
      name: 'Get Round',
      description: 'Round an array of numeric values.',
      updated_at: '2021-11-16',
      price: 0.001,
      response_time: 200,
      regions: ['US East', 'Southeast Asia'],
      request_params_sample: {
        request_public_id: 'get-round',
        service_name: 'get_round',
        service_config: {
          decPlaces: {
            name: "Decimal Places",
            options: [0,1,2,3,4,5]
          },
          roundType: {
              name: "Rounding Type",
              options: ["default", "ceil", "floor", "truncate"]
          }
        },
        data: "1.32, 2.35, 5.11, 71.2996"
      },
      // ],
      faqs: [
        {
          request_param_public_id: 'superscale',
          q: 'What can this image scale?',
          a: 'It can scale nothing.'
        }
      ]
    }
  ]
}
