<template>
    <nav id="mobile-menu">
        <div class="max-w-3xl mx-auto px-2 pt-2 pb-3 space-y-1 sm:px-4">
            <a :href="docsUri" class="bg-teal-900 hover:bg-teal-700">
                Documentation
            </a>
        </div>
        <div class="border-t border-gray-500 pt-4 pb-3">
            <div class="mt-3 px-2 space-y-1">
                <a
                    href="#"
                    :class="
                        $route.name == 'login'
                            ? classActiveMobile
                            : classInactiveMobile
                    "
                >
                    Sign In</a
                >

                <a
                    href="#"
                    :class="
                        $route.name == 'signup'
                            ? classActiveMobile
                            : classInactiveMobile
                    "
                    class="bg-teal-900 hover:bg-teal-700"
                >
                    Sign Up
                </a>
            </div>
        </div>
    </nav>
</template>

<script>
    export default {
        name: "NavbarMobileMenu",
        props: {
            docsUri: {
                type: String,
                required: true,
            },
        },
        data() {
            return {
                classActiveMobile:
                    "bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium",
                classInactiveMobile:
                    "text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium",
            };
        },
    };
</script>

<style>
</style>
