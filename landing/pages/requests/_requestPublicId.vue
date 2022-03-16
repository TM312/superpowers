<template>
    <div class="py-16" v-if="requestDocs !== null">
        <section-request-header
            class="max-w-7xl mx-auto"
            :name="requestDocs.name"
            :description="requestDocs.description"
        />
        <div
            class="
                max-w-7xl
                mx-auto
                mt-4
                md:mt-6
                lg:mt-10
                xl:mt-12
                space-y-20
                px-4
                sm:px-6
                lg:px-8
            "
        >
            <section-request-details :request="requestDocs" />
            <section-request-test
                :param-docs="requestDocs.param_docs"
                :request-public-id="$route.params.requestPublicId"
            />
            <section-request-faqs
                v-if="requestDocs.faqs"
                :faqs="requestDocs.faqs"
            />
        </div>
    </div>
</template>

<script>
    export default {
        layout: "default",
        transitions: "fade",
        data() {
            return {
                requestDocs: null,
            };
        },
        mounted() {
            this.requestDocs = this.$store
                .$db()
                .model("request-docs")
                .query()
                .where("public_id", this.$route.params.requestPublicId)
                .withAll()
                .first();
        },
    };
</script>

<style>
</style>
