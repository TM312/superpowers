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
    };
</script>

<style>
</style>
