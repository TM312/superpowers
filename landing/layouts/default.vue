<template>
    <div class="body text-gray-300">
        <the-header />
        <nuxt class="bg-gray-800" />
        <the-footer class="footer" />
    </div>
</template>

<style>
    .body {
        height: 100vh;
        margin: 0;
    }

    .footer {
        margin-top: auto;
    }

    .fade-enter-active,
    .fade-leave-active {
        transition: opacity 0.3s;
    }
    .fade-enter,
    .fade-leave-to {
        opacity: 0;
    }
</style>
