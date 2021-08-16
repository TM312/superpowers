<template>
    <div
        class="
            flex-1 flex
            items-center
            justify-center
            sm:items-stretch
            sm:justify-start
        "
    >
        <div class="flex-shrink-0 flex items-center" @click="$router.push('/')">
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
                    :class="$route.name == 'documentation' ? active : inactive"
                    class="px-3 py-2 rounded-md text-sm font-medium"
                >
                    Documentation
                </NuxtLink>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "NavbarDesktopLeft",
        data() {
            return {
                active: "bg-gray-900 text-white",
                inactive: "text-gray-300 hover:bg-gray-700 hover:text-white",
            };
        },
    };
</script>
