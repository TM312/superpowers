<template>
    <div class="body bg-gradient-to-r from-teal-900 to-gray-800 text-gray-300">
        <the-header />
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

    .background {
        background: linear-gradient(-45deg, #1f37e9, rgb(69, 149, 180));
    }

    @keyframes change {
        0% {
            background-position: 0 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0 50%;
        }
    }
</style>
