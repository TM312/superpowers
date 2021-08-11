<template>
    <section>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <card-api-call v-for="(item, id) in [1, 2, 3, 4, 5, 6]" :key="id" />
        </div>
    </section>
</template>

<script>
    export default {
        name: "SectionLandingMain",
    };
</script>

<style>
</style>
