<template>
    <div class="hidden lg:flex lg:items-center lg:justify-end xl:col-span-4">
        <NuxtLink
            to="/login"
            :class="$route.name == 'login' ? active : inactive"
            class="
                ml-5
                flex-shrink-0
                text-gray-400
                focus:outline-none
                focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
                text-sm
                font-medium
                rounded-md
                py-2
                px-3
                inline-flex
                items-center
            "
        >
            Log In
        </NuxtLink>

        <NuxtLink
            to="/signup"
            :class="$route.name == 'signup' ? 'hidden' : ''"
            class="
                ml-6
                inline-flex
                items-center
                px-4
                py-2
                border border-transparent
                text-sm
                font-medium
                rounded-md
                shadow-sm
                text-white
                bg-gradient-to-r
                from-teal-500
                to-emerald-800
                border border-teal-700
                hover:bg-indigo-700
                focus:outline-none
                focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
            "
        >
            Sign Up
        </NuxtLink>
    </div>
</template>

<script>
    export default {
        name: "NavbarDesktopRight",
        data() {
            return {
                active: "bg-teal-700 text-gray-100",
                inactive: "text-gray-300 hover:bg-gray-700 hover:text-white",
            };
        },
    };
</script>

<style>
</style>
