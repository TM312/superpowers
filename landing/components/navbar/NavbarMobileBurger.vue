<template>
    <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
        <button
            type="button"
            class="
                inline-flex
                items-center
                justify-center
                p-2
                rounded-md
                text-gray-400
                hover:text-white
                hover:bg-gray-700
                focus:outline-none
                focus:ring-2 focus:ring-inset focus:ring-white
            "
            aria-controls="mobile-menu"
            aria-expanded="false"
            @click="changeState()"
        >
            <span class="sr-only">Open main menu</span>
            <svg
                :class="showMobileMenu ? 'hidden' : 'block'"
                class="h-6 w-6"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                aria-hidden="true"
            >
                <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M4 6h16M4 12h16M4 18h16"
                />
            </svg>
            <svg
                :class="showMobileMenu ? 'block' : 'hidden'"
                class="h-6 w-6"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                aria-hidden="true"
            >
                <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M6 18L18 6M6 6l12 12"
                />
            </svg>
        </button>
    </div>
</template>

<script>
    export default {
        name: "NavbarMobileBurger",
        data() {
            return {
                showMobileMenu: false,
            };
        },
        methods: {
            changeState() {
                this.showMobileMenu = !this.showMobileMenu;
                this.$emit("newState", this.showMobileMenu);
            },
        },
    };
</script>

<style>
</style>
