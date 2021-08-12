<template>
    <section>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <card-api-call
                v-for="request in requests"
                :key="request.id"
                :request="request"
            />
        </div>
    </section>
</template>

<script>
    export default {
        name: "SectionLandingMain",
        props: {
            requests: {
                type: Array,
                required: true,
            },
        },
    };
</script>

<style>
</style>
