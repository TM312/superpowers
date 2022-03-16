<template>
    <div>
        res: {{ res }} <br><br>
        serviceName: {{ serviceName }} <br />
        serviceData: {{ serviceData }} <br />
        serviceConfig: {{ serviceConfig }}
        <div v-for="config in serviceConfig" :key=config.id>
            {{ config.key }} : {{ config.value }}
        </div>
        <button
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
            @click="sendRequest()"
        >
            <solid-paper-airplane-icon
                class="h-5 w-5 mr-2 text-gray-400 transform rotate-90"
                aria-hidden="true"
            />
            Send Request
        </button>
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
            serviceData: {
                type: String,
                required: true,
            },
            serviceConfig: {
                type: Array,
                required: true,
            },
        },
         data() {
            return {
                res: null,
            };
        },
        methods: {
            async sendRequest() {
                const payload = {
                   "data": [1,2.2334],
                   "services": [
                       {
                           "name": this.serviceName,
                           "config": {
                               "decPlaces": 2
                           }
                       }
                   ]
                }
                console.log(payload)
                const res = await this.$axios.$post('', payload)
                this.res = res
              
           }
        },
    };
</script>

<style>
</style>
