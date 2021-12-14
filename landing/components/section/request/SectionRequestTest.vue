<template>
    <section class="space-y-5">
        <container-request-test-header />

        <div v-if="sampleParams !== null">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <input-field-data-sample-request
                    :service-data-default="sampleParams.data"
                    @dataSelected="updateRequestData($event)"
                />

                <div v-for="(param, i) in paramDocs" :key="i">
                    <input-field-service-config-sample-request
                        :param-options="param.options"
                        :param-key="param.key"
                        :param-name="param.name"
                        :sample-params-public-id="sampleParams.public_id"
                    />                    
                </div>
                
            </div>
            <button-send-sample-request
                :service-name="sampleParams.service_name"
                :service-config="sampleParams.config"
                :service-data="sampleParams.data"
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
                    .withAll()
                    .first();
            },
        },
       
        methods: {
            updateRequestData(value) {
                this.SampleParams.update({
                    where: this.sampleParams.id,
                    data: {
                        data: value,
                    },
                });
            },
        },
    };
</script>

<style>
</style>
