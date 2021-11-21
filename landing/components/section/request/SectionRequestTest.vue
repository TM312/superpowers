<template>
    <section class="space-y-5">
        <container-request-test-header />

        <div v-if="sampleParams !== null">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <input-field-data-sample-request
                    :service-data-default="sampleParams.data"
                />

                <div v-for="(param, i) in paramDocs" :key="i">
                    <input-field-service-config-sample-request
                        :param-options="param.options"
                        :param-config-default="sampleParams.config[param.key]"
                        :param-name="param.name"
                        @paramOptionSelected="
                            updateRequestConfig(param.key, $event)
                        "
                    />
                </div>
            </div>
            <button-send-sample-request
                :service-name="sampleParams.service_name"
                :service-config-default="sampleParams.config"
                :service-data-default="sampleParams.data"
            />
        </div>
    </section>
</template>

<script>
    export default {
        name: "SectionRequestTest",
        props: {
            paramDocs: {
                type: Array,
                required: true,
            },
            requestPublicId: {
                type: String,
                required: true,
            },
        },
        data() {
            return {
                serviceName: "",
                serviceConfig: {},
                serviceData: [],
            };
        },
        computed: {
            SampleParams() {
                return this.$store.$db().model("sample-params");
            },
            sampleParams() {
                return this.SampleParams.query()
                    .where("request_docs_public_id", this.requestPublicId)
                    .first();
            },
        },
        methods: {
            updateRequestConfig(key, value) {
                console.log("EMIT:", key, value);
                serviceConfig[key] = value;
                this.SampleParams.update({
                    data: {
                        config: serviceConfig,
                    },
                });
            },
            // updateName() {
            //     this.test = 2;
            //     this.SampleParams.update({
            //         data: {
            //             data: "Hello world",
            //         },
            //     });
            // },
        },
        // mounted() {
        //     this.serviceName = this.paramDocs.service_name;
        //     this.serviceData = this.paramDocs.data;

        //     for (const [key, value] of Object.entries(
        //         this.paramDocs.service_config
        //     )) {
        //         this.serviceConfig[key] = value.options[0];
        //     }
        // },
        // methods: {
        //     // @dataSelected="updateServiceData($event)"
        //     //                         <!-- @configSelected="updateServiceConfig(key, $event)" -->

        //     updateServiceConfig(configName, configValue) {
        //         this.serviceConfig[configName] = configValue;
        //     },

        //     updateServiceData(data) {
        //         this.serviceData = data;
        //     },
        // },
    };
</script>

<style>
</style>
