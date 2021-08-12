<!-- This example requires Tailwind CSS v2.0+ -->
<template>
    <div class="bg-gray-700 shadow-lg rounded sm:rounded-lg">
        <div class="px-4 py-5 sm:p-6">
            <h3
                class="
                    text-lg
                    uppercase
                    tracking-wide
                    font-semibold
                    text-teal-600
                "
                v-text="request.name"
            />
            <div class="mt-2 max-w-xl text-gray-300">
                <p v-text="request.description" />
            </div>
            <div class="mt-3">
                <nuxt-link
                    :to="`/requests/${request.id}`"
                    class="font-medium text-gray-400 hover:text-gray-300"
                >
                    More details
                    <span
                        class="transform hover:translate-x-1"
                        aria-hidden="true"
                        >&rarr;</span
                    >
                </nuxt-link>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "CardApiCall",
        props: {
            request: {
                type: Object,
                required: true,
            },
        },
    };
</script>

<style>
</style>
