<template>
    <div
        class="body bg-gradient-to-r from-indigo-900 to-gray-800 text-gray-300"
    >
        <!-- <the-header /> -->
        <nuxt />
        <the-footer class="footer" />
    </div>
</template>

<style>
    .body {
        height: 100vh;
        margin: 0;
    }

    .body {
        display: flex;
        flex-direction: column;
    }

    .footer {
        margin-top: auto;
    }
</style>
