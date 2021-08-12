<template>
    <div class="py-16">
        <section-requests-details
            class="max-w-7xl mx-auto"
            :request="request"
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
                    .with("id")
                    .with("public_id")
                    .with("name")
                    .with("description")
                    .with("updated_at")
                    .first();
            },
        },
    };
</script>

<style>
</style>
