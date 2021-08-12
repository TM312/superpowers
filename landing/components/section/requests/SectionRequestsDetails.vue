<!-- This example requires Tailwind CSS v2.0+ -->
<template>
    <div class="bg-gray-700 shadow overflow-hidden sm:rounded-lg">
        <div class="px-4 py-5 sm:px-6">
            <h3
                class="text-lg leading-6 font-medium text-gray-200"
                v-text="request.name"
            />
            <p
                class="mt-1 max-w-2xl text-sm text-gray-400"
                v-text="request.description"
            />
        </div>
        <div class="border-t border-gray-900 px-4 py-5 sm:px-6">
            <dl class="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-2">
                <div class="sm:col-span-1">
                    <dt class="text-sm font-medium text-gray-400">Full name</dt>
                    <dd class="mt-1 text-sm text-gray-200">Margot Foster</dd>
                </div>
                <div class="sm:col-span-1">
                    <dt class="text-sm font-medium text-gray-400">
                        Application for
                    </dt>
                    <dd class="mt-1 text-sm text-gray-200">
                        Backend Developer
                    </dd>
                </div>
                <div class="sm:col-span-1">
                    <dt class="text-sm font-medium text-gray-400">
                        Email address
                    </dt>
                    <dd class="mt-1 text-sm text-gray-200">
                        margotfoster@example.com
                    </dd>
                </div>
                <div class="sm:col-span-1">
                    <dt class="text-sm font-medium text-gray-400">
                        Salary expectation
                    </dt>
                    <dd class="mt-1 text-sm text-gray-200">$120,000</dd>
                </div>
                <div class="sm:col-span-2">
                    <dt class="text-sm font-medium text-gray-400">About</dt>
                    <dd class="mt-1 text-sm text-gray-200">
                        Fugiat ipsum ipsum deserunt culpa aute sint do nostrud
                        anim incididunt cillum culpa consequat. Excepteur qui
                        ipsum aliquip consequat sint. Sit id mollit nulla mollit
                        nostrud in ea officia proident. Irure nostrud pariatur
                        mollit ad adipisicing reprehenderit deserunt qui eu.
                    </dd>
                </div>
                <div class="sm:col-span-2">
                    <dt class="text-sm font-medium text-gray-400">
                        Sample Request
                    </dt>
                    <dd class="mt-1 text-sm text-gray-200">
                        <ul
                            class="
                                border border-gray-900
                                rounded-md
                                divide-y divide-gray-200
                            "
                        >
                            <li
                                class="
                                    pl-3
                                    pr-4
                                    py-3
                                    flex
                                    items-center
                                    justify-between
                                    text-sm
                                "
                            >
                                <div class="w-0 flex-1 flex items-center">
                                    <span class="ml-2 flex-1 w-0 truncate">
                                        resume_back_end_developer.pdf
                                    </span>
                                </div>
                                <div class="ml-4 flex-shrink-0">
                                    <a
                                        href="#"
                                        class="
                                            font-medium
                                            text-teal-400
                                            hover:text-teal-300
                                        "
                                    >
                                        Download
                                    </a>
                                </div>
                            </li>
                            <li
                                class="
                                    pl-3
                                    pr-4
                                    py-3
                                    flex
                                    items-center
                                    justify-between
                                    text-sm
                                "
                            >
                                <div class="w-0 flex-1 flex items-center">
                                    <span class="ml-2 flex-1 w-0 truncate">
                                        coverletter_back_end_developer.pdf
                                    </span>
                                </div>
                                <div class="ml-4 flex-shrink-0">
                                    <a
                                        href="#"
                                        class="
                                            font-medium
                                            text-teal-400
                                            hover:text-teal-300
                                        "
                                    >
                                        Download
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </dd>
                </div>
            </dl>
        </div>
    </div>
</template>


<script>
    export default {
        name: "SectionRequestsDetails",
        props: {
            request: {
                type: Object,
                required: true,
            },
        },
    };
</script>

<style>
</style>
