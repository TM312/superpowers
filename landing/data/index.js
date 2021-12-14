
// Emulating todo records which should be returned from API backend
// in the real world.
export default async function data() {
  return [
    {
      public_id: 'get-round',
      name: 'Get Round',
      description: 'Round an array of numeric values.',
      updated_at: '2021-11-16',
      price: 0.001,
      response_time: 200,
      regions: ['US East', 'Southeast Asia'],
      param_docs: [
          {
            key: "decPlaces",
            request_docs_public_id: 'get-round',
            name: "Decimal Places",
            options: [0,1,2,3,4,5]
          },
          {
            key: "roundType",
            request_docs_public_id: 'get-round',
            name: "Rounding Type",
            options: ["default", "ceil", "floor", "truncate"]
          }

        ],
      sample_params: {
        request_docs_public_id: 'get-round',
        public_id: 'get-round-sample-params',
        service_name: 'get_round',
        data: "1.32, 2.35, 5.11, 71.2996",
        config: [
          {
            sample_params_public_id: 'get-round-sample-params',
            key: "decPlaces",
            value: 2,
            value_type: "int"
          },
          {
            sample_params_public_id: 'get-round-sample-params',
            key: "roundType",
            value: "floor",
            value_type: "str"
          }
        ]
      },

      // ],
      faqs: [
        {
          request_docs_public_id: 'get-round',
          q: 'What can this image scale?',
          a: 'It can scale nothing.'
        }
      ]
    }
  ]
}
