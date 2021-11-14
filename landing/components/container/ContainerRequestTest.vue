<template>
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
            <div
                class="
                    shadow
                    overflow-hidden
                    border-b border-gray-800
                    sm:rounded-lg
                "
            >
                <button
                    type="button"
                    class="
                        inline-flex
                        items-center
                        px-4
                        py-2
                        border border-gray-300
                        shadow-sm
                        text-sm
                        font-medium
                        rounded-md
                        text-gray-700
                        bg-white
                        hover:bg-gray-50
                        focus:outline-none
                        focus:ring-2
                        focus:ring-offset-2
                        focus:ring-indigo-500
                    "
                    @click="sendRequest"
                >
                    Click for test
                </button>
            </div>
            responseData: {{ responseData }}
        </div>
    </div>
</template>

<script>
    export default {
        name: "ContainerRequestTest",
        data() {
            return {
                responseData: null,
                payload: {
                    services: [
                        {
                            name: "get_round",
                            config: { decPlaces: 1, roundType: "ceil" },
                            position: 1,
                        },
                    ],
                    data: [2.23, 3.45, 4.12],
                },
            };
        },
        methods: {
            sendRequest() {
                this.$axios
                    .post("", { data: this.payload })

                    .then(function (res) {
                        this.responseData = res.data;
                    })

                    .catch(function (error) {
                        console.log(error);
                    });
            },
        },
    };
</script>

<style>
</style>
