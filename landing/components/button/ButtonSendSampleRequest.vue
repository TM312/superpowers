<template>
    <div>
        serviceName: {{ serviceName }} <br />
        serviceDataDefault: {{ serviceDataDefault }} <br />
        serviceConfigDefault: {{ serviceConfigDefault }} <br />
        <!-- <button
            type="button"
            class="
                inline-flex
                items-center
                px-5
                py-2
                border border-transparent
                text-base
                font-medium
                rounded-full
                shadow-sm
                text-white
                bg-indigo-600
                hover:bg-indigo-700
                focus:outline-none
                focus:ring-2
                focus:ring-offset-2
                focus:ring-indigo-500
            "
        >
            <solid-paper-airplane-icon
                class="h-5 w-5 mr-2 text-gray-400 transform rotate-90"
                aria-hidden="true"
            />
            Send Request
        </button> -->
    </div>
</template>

<script>
    export default {
        name: "ButtonSendSampleRequest",
        props: {
            serviceName: {
                type: String,
                required: true,
            },
            serviceDataDefault: {
                type: String,
                required: true,
            },
            serviceConfigDefault: {
                type: Object,
                required: true,
            },
        },
        data() {
            return {
                serviceData: "",
                serviceConfig: {},
            };
        },

        created() {
            this.$nuxt.$on("dataSelected", ($event) => {
                console.log("dataSelected", $event);
                this.serviceData = $event;
            });
            this.$nuxt.$on("configSelected", ($event) => {
                console.log("configSelected > $event:", $event);
                console.log("$event key:", $event.key);
                console.log("$event value:", $event.value);

                this.updateServiceConfig($event.key, $event.value);
            });
        },
        mounted() {
            this.serviceConfig = this.serviceConfigDefault;
            this.serviceData = this.serviceDataDefault;
        },

        methods: {
            updateServiceConfig(configKey, configValue) {
                this.$set(this.serviceConfig, configKey, configValue);
                // this.serviceConfig[configKey] = configValue;
            },

            updateServiceData(data) {
                this.serviceData = data;
            },
        },
        beforeDestroy() {
            // removes event listener
            this.$nuxt.$off("dataSelected");
            this.$nuxt.$off("configSelected");
        },
    };
</script>

<style>
</style>
