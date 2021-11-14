<!-- This example requires Tailwind CSS v2.0+ -->
<template>
    <div class="bg-gray-700 shadow overflow-hidden sm:rounded-lg">
        <div class="px-4 py-5 sm:px-6">
            <h3 class="text-lg leading-6 font-medium text-gray-200">Details</h3>
        </div>
        <div class="border-t border-gray-900 px-4 py-5 sm:px-6">
            <dl class="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-2">
                <div class="sm:col-span-1">
                    <dt class="text-sm font-medium text-gray-400">
                        Available Regions
                    </dt>
                    <dd class="mt-1 text-sm text-gray-200">
                        <span v-for="(region, i) in request.regions" :key="i">
                            <span v-if="i + 1 !== request.regions.length">
                                {{ region }},
                            </span>
                            <span v-else v-text="region" />
                        </span>
                    </dd>
                </div>
                <div class="sm:col-span-1">
                    <dt class="text-sm font-medium text-gray-400">Price</dt>
                    <dd class="mt-1 text-sm text-gray-200">
                        US${{ request.price }} per request
                    </dd>
                </div>
                <div class="sm:col-span-1">
                    <dt class="text-sm font-medium text-gray-400">
                        Average Response Time
                    </dt>
                    <dd class="mt-1 text-sm text-gray-200">
                        {{ request.response_time }}ms
                    </dd>
                </div>
                <div class="sm:col-span-1">
                    <dt class="text-sm font-medium text-gray-400">
                        Last Updated
                    </dt>
                    <dd class="mt-1 text-sm text-gray-200">
                        {{ request.updated_at }}
                    </dd>
                </div>
            </dl>
        </div>
    </div>
</template>


<script>
    export default {
        name: "SectionRequestDetails",
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
