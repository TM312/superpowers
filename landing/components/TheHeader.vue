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
                                to="/"
                                :class="
                                    $route.name == '/' ||
                                    $route.name == 'dashboard'
                                        ? active
                                        : inactive
                                "
                                class="px-3 py-2 rounded-md text-sm font-medium"
                            >
                                Dashboard
                            </NuxtLink>
                            <NuxtLink
                                to="/projects"
                                :class="
                                    $route.name == 'projects'
                                        ? active
                                        : inactive
                                "
                                class="px-3 py-2 rounded-md text-sm font-medium"
                            >
                                Projects
                            </NuxtLink>
                        </div>
                    </div>
                </div>

                <div
                    class="
                        absolute
                        inset-y-0
                        right-0
                        flex
                        items-center
                        pr-2
                        sm:static
                        sm:inset-auto
                        sm:ml-6
                        sm:pr-0
                    "
                >
                    <button
                        class="
                            bg-gray-800
                            p-1
                            rounded-full
                            text-gray-400
                            hover:text-white
                            focus:outline-none
                            focus:ring-2
                            focus:ring-offset-2
                            focus:ring-offset-gray-800
                            focus:ring-white
                        "
                    >
                        <span class="sr-only">View notifications</span>
                        <!-- Heroicon name: outline/bell -->
                        <svg
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
                                d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"
                            />
                        </svg>
                    </button>

                    <!-- Profile dropdown -->
                    <div id="profile_dropdown" class="ml-3 relative">
                        <div>
                            <button
                                id="user-menu"
                                class="
                                    bg-gray-800
                                    flex
                                    text-sm
                                    rounded-full
                                    focus:outline-none
                                    focus:ring-2
                                    focus:ring-offset-2
                                    focus:ring-offset-gray-800
                                    focus:ring-white
                                "
                                aria-haspopup="true"
                                @click="setDropdown"
                            >
                                <span class="sr-only">Open user menu</span>
                                <img
                                    class="h-8 w-8 rounded-full"
                                    src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixqx=8iilOWHssh&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                    alt=""
                                />
                            </button>
                        </div>

                        <transition
                            enter-active-class="transition ease-out duration-100 transform"
                            enter-from-class="opacity-0 scale-95"
                            enter-to-class="opacity-100 scale-100"
                            leave-active-class="transition ease-in duration-75 transform"
                            leave-from-class="opacity-100 scale-100"
                            leave-to-class="opacity-0 scale-95"
                        >
                            <div
                                v-show="showDropdown"
                                class="
                                    origin-top-right
                                    absolute
                                    right-0
                                    mt-2
                                    w-48
                                    rounded-md
                                    shadow-lg
                                    py-1
                                    bg-white
                                    ring-1 ring-black ring-opacity-5
                                "
                                role="menu"
                                aria-orientation="vertical"
                                aria-labelledby="user-menu"
                            >
                                <div v-click-outside="cancelDropdown">
                                    <NuxtLink
                                        to="/profile"
                                        class="
                                            block
                                            px-4
                                            py-2
                                            text-sm text-gray-700
                                            hover:bg-gray-100
                                        "
                                        role="menuitem"
                                        @click="showDropdown = false"
                                    >
                                        Profile
                                    </NuxtLink>
                                    <NuxtLink
                                        to="/settings"
                                        class="
                                            block
                                            px-4
                                            py-2
                                            text-sm text-gray-700
                                            hover:bg-gray-100
                                        "
                                        role="menuitem"
                                        @click="showDropdown = false"
                                    >
                                        Settings
                                    </NuxtLink>
                                    <NuxtLink
                                        to="/logout"
                                        class="
                                            block
                                            px-4
                                            py-2
                                            text-sm text-gray-700
                                            hover:bg-gray-100
                                        "
                                        role="menuitem"
                                        @click="logout"
                                    >
                                        Sign out
                                    </NuxtLink>
                                </div>
                            </div>
                        </transition>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile menu, show/hide based on menu state. -->
        <div v-show="showMobileMenu" id="mobile-menu" class="sm:hidden">
            <div class="px-2 pt-2 pb-3 space-y-1">
                <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                <NuxtLink
                    to="/dashboard"
                    :class="
                        $route.name == '/' || 'dashboard'
                            ? classActiveMobile
                            : classInactiveMobile
                    "
                >
                    Dashboard
                </NuxtLink>
                <NuxtLink
                    to="/projects"
                    :class="
                        $route.name == 'projects'
                            ? classActiveMobile
                            : classInactiveMobile
                    "
                >
                    Projects
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
