<template>
    <section class="space-y-5">
        <container-request-test-header />

        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <input-field-data-sample-request
                :service-data-default="request.request_params_sample.data"
            />

            <div
                v-for="(value, key, i) in request.request_params_sample
                    .service_config"
                :key="i"
            >
                <input-field-service-config-sample-request
                    :service-config-key="key"
                    :service-config-option="value"
                />
            </div>
        </div>

        <button-send-sample-request
            :service-name="request.request_params_sample.service_name"
            :service-config-default="
                request.request_params_sample.service_config
            "
            :service-data-default="request.request_params_sample.data"
        />
    </section>
</template>

<script>
    export default {
        name: "SectionRequestTest",
        props: {
            request: {
                type: Object,
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
        // mounted() {
        //     this.serviceName = this.request.request_params_sample.service_name;
        //     this.serviceData = this.request.request_params_sample.data;

        //     for (const [key, value] of Object.entries(
        //         this.request.request_params_sample.service_config
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
