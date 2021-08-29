<template>
    <section>
        <div class="max-w-7xl mx-auto py-16 px-4 sm:px-6 lg:py-20 lg:px-8">
            <div class="lg:grid lg:grid-cols-3 lg:gap-8">
                <div>
                    <h2 class="text-3xl font-extrabold text-gray-300">
                        Frequently asked questions
                    </h2>
                    <p class="mt-4 text-md text-gray-400">
                        Can’t find the answer you’re looking for? Reach out to
                        our
                        <a
                            href="#"
                            class="
                                font-medium
                                text-teal-400
                                hover:text-teal-300
                            "
                            >customer support</a
                        >
                        team.
                    </p>
                </div>
                <div class="mt-12 lg:mt-0 lg:col-span-2">
                    <dl class="space-y-12">
                        <div v-for="(item, i) in faqs" :key="i">
                            <dt
                                class="
                                    text-lg
                                    leading-6
                                    font-medium
                                    text-gray-300
                                "
                                v-text="item.q"
                            />
                            <dd
                                class="mt-2 text-base text-gray-400"
                                v-text="item.a"
                            />
                        </div>
                    </dl>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        name: "SectionRequestFaqs",
        props: {
            faqs: {
                type: Array,
                required: false,
            },
        },
    };
</script>

<style>
</style>
