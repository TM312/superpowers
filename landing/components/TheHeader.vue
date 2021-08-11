<template>
    <nav class="bg-gray-800">
        <!-- Mobile menu button-->
        <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
            <div class="relative flex items-center justify-between h-16">
                <div
                    class="
                        absolute
                        inset-y-0
                        left-0
                        flex
                        items-center
                        sm:hidden
                    "
                >
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
                        @click="showMobileMenu = !showMobileMenu"
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

                <div
                    class="
                        flex-1 flex
                        items-center
                        justify-center
                        sm:items-stretch
                        sm:justify-start
                    "
                >
                    <div
                        class="flex-shrink-0 flex items-center"
                        @click="$router.push('/')"
                    >
                        <img
                            class="block lg:hidden h-8 w-auto"
                            src="https://tailwindui.com/img/logos/workflow-mark-indigo-500.svg"
                            alt="Workflow"
                        />
                        <img
                            class="hidden lg:block h-8 w-auto"
                            src="https://tailwindui.com/img/logos/workflow-logo-indigo-500-mark-white-text.svg"
                            alt="Workflow"
                        />
                    </div>
                    <div class="hidden sm:block sm:ml-6">
                        <div class="flex space-x-4">
                            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->

                            <NuxtLink
                                to="/documentation"
                                :class="
                                    $route.name == 'documentation'
                                        ? active
                                        : inactive
                                "
                                class="px-3 py-2 rounded-md text-sm font-medium"
                            >
                                Documentation
                            </NuxtLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile menu, show/hide based on menu state. -->
        <div v-show="showMobileMenu" id="mobile-menu" class="sm:hidden">
            <div class="px-2 pt-2 pb-3 space-y-1">
                <NuxtLink
                    to="/documentation"
                    :class="
                        $route.name == 'documentation'
                            ? classActiveMobile
                            : classInactiveMobile
                    "
                >
                    Documentation
                </NuxtLink>
            </div>
        </div>
    </nav>
</template>

<script>
    export default {
        name: "TheHeader",
        data() {
            return {
                clicked: false,
                showMobileMenu: false,
                showDropdown: false,
                active: "bg-gray-900 text-white",
                inactive: "text-gray-300 hover:bg-gray-700 hover:text-white",
                classActiveMobile:
                    "bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium",
                classInactiveMobile:
                    "text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium",
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
