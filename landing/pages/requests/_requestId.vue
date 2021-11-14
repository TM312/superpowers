<template>
    <div class="py-16">
        <section-request-header
            class="max-w-7xl mx-auto"
            :name="request.name"
            :description="request.description"
        />
        <div
            class="max-w-7xl mx-auto mt-4 md:mt-6 lg:mt-10 xl:mt-12 space-y-20"
        >
            <section-request-details :request="request" />
            <section-request-test :request="request" />
            <section-request-faqs v-if="request.faqs" :faqs="request.faqs" />
        </div>
    </div>
</template>

<script>
    export default {
        layout: "default",
        transitions: "fade",
        data() {
            return {
                requestId: this.$route.params.requestId,
            };
        },
        computed: {
            request() {
                return this.$store
                    .$db()
                    .model("requests")
                    .query()
                    .where("public_id", this.$route.params.requestId)
                    .withAll()
                    .first();
            },
        },
    };
</script>

<style>
</style>
