<template>
    <section>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="lg:grid lg:grid-cols-3 lg:gap-8">
                <div>
                    <h2
                        class="text-3xl font-extrabold text-gray-300"
                        v-text="name"
                    />
                    <p
                        class="mt-4 text-md text-gray-400"
                        v-text="description"
                    />
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    export default {
        name: "SectionRequestHeader",
        props: {
            name: {
                type: String,
                required: true,
            },
            description: {
                type: String,
                required: true,
            },
        },
    };
</script>

<style>
</style>
