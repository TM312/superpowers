<template>
    <div class="text-gray-300 bg-gray-800">
        <the-header />
        <nuxt />
        <the-footer />
    </div>
</template>

<script>
    import data from "@/data";

    export default {
        computed: {
            requestsDocs() {
                return this.$store.$db().model("request-docs").exists();
            },
        },
        async fetch() {
            if (this.requestsDocs === false) {
                // Here we are stubbing the initial data. In the real world, this
                // should be the response from the API Backend.
                const initialData = await data();
                this.$store
                    .$db()
                    .model("request-docs")
                    .create({ data: initialData });
            }
        },
    };
</script>

<style>
    .fade-enter-active,
    .fade-leave-active {
        transition: opacity 0.3s;
    }
    .fade-enter,
    .fade-leave-to {
        opacity: 0;
    }
</style>
