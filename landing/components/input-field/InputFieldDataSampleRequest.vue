<template>
    <div>
        <label for="comment" class="block text-sm font-medium text-gray-200"
            >Data Input</label
        >
        <div class="mt-1">
            <textarea
                rows="1"
                name="comment"
                id="comment"
                class="
                    shadow-sm
                    focus:ring-indigo-500 focus:border-indigo-500
                    block
                    w-full
                    sm:text-sm
                    border-gray-300
                    rounded-md
                    resize-none
                    text-gray-900
                "
                :value="serviceDataDefault"
                @input="$emit('dataSelected', $event.target.value)"
            />
        </div>
    </div>
</template>

<script>
    export default {
        name: "InputFieldDataSampleRequest",
        props: {
            serviceDataDefault: {
                type: String,
                required: true,
            },
        },
    };
</script>

<style>
</style>
