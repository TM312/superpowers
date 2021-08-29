<template>
    <div class="py-16">
        <section-request-details class="max-w-7xl mx-auto" :request="request" />
        <section-request-faqs
            v-if="request.faqs"
            class="mx-auto mt-10 md:12 lg:16 xl:20"
            :faqs="request.faqs"
        />
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
