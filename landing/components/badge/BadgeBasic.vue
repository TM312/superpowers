<template>
    <span
        :class="`bg-${color}-700 text-${color}-200`"
        class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full"
    >
        {{ word }}
    </span>
</template>

<script>
    export default {
        name: "BadgeBasic",
        props: {
            word: {
                type: String,
                required: true,
            },
            color: {
                type: String,
                required: true,
            },
        },
    };
</script>

<style>
</style>
