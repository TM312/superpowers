<template>
    <div class="bg-gray-800">
        <!-- Mobile menu button-->
        <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
            <div class="relative flex items-center justify-between h-16">
                <navbar-desktop-left :docs-uri="docsUri" />

                <navbar-desktop-right />

                <navbar-mobile-burger @newState="showMobileMenu = $event" />
            </div>
        </div>

        <!-- Mobile menu, show/hide based on menu state. -->
        <navbar-mobile-menu
            v-show="showMobileMenu"
            class="lg:hidden"
            :docs-uri="docsUri"
        />
    </div>
</template>

<script>
    export default {
        name: "TheHeader",
        data() {
            return {
                clicked: false,
                showMobileMenu: false,
                showDropdown: false,
                docsUri: "http://localhost:53408/introduction",
            };
        },

        methods: {
            async logout() {
                await this.$auth.logout();
            },

            cancelDropdown() {
                if (!this.clicked) {
                    this.showDropdown = false;
                }
            },

            async setDropdown() {
                this.clicked = true;
                this.showDropdown = !this.showDropdown;
                await this.sleep(200);
                this.clicked = false;
            },
        },
    };
</script>

<style>
</style>
