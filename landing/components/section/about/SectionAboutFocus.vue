<template>
    <section>
        <p class="mt-10">
            We think we can create the greatest value by focusing on a few key
            parameters
        </p>
        <!-- This example requires Tailwind CSS v2.0+ -->
        <ul class="grid grid-cols-1 gap-6 md:grid-cols-2">
            <li
                class="
                    col-span-1
                    bg-gray-900
                    rounded-lg
                    shadow
                    divide-y divide-gray-200
                "
            >
                <div class="relative">
                    <dt>
                        <div
                            class="
                                absolute
                                flex
                                items-center
                                justify-center
                                h-12
                                w-12
                                rounded-md
                                bg-indigo-500
                                text-white
                            "
                        >
                            <!-- Heroicon name: outline/globe-alt -->
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
                                    d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"
                                />
                            </svg>
                        </div>
                        <p
                            class="
                                ml-16
                                text-lg
                                leading-6
                                font-medium
                                text-gray-900
                            "
                        >
                            Competitive exchange rates
                        </p>
                    </dt>
                    <dd class="mt-2 ml-16 text-base text-gray-500">
                        Lorem ipsum, dolor sit amet consectetur adipisicing
                        elit. Maiores impedit perferendis suscipit eaque, iste
                        dolor cupiditate blanditiis ratione.
                    </dd>
                </div>
            </li>

            <!-- More people... -->
        </ul>
    </section>
</template>

<script>
    export default {
        name: "SectionAboutFocus",
    };
</script>

<style>
</style>
