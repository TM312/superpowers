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
        computed: {
            requests() {
                return this.$store
                    .$db()
                    .model("requests")
                    .query()
                    .with("id")
                    .with("name")
                    .with("description")
                    .with("updated_at")
                    .get();
            },
        },
    };
</script>

<style>
</style>
