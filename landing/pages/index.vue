<template>
    <div class="py-4 md:py-6 lg:py-10">
        <section-landing-top />
        <section-landing-main class="px-5 lg:px-10" :requests="requests" />
    </div>
</template>

<script>
    export default {
        layout: "default",
        transition: "fade",
        computed: {
            requests() {
                return this.$store.state.requests;
            },
        },
    };
</script>
