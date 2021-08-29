<template>
    <div>
        <container-request-test
            :type="request.test_box_type"
            :service_name="request.service_name"
        />
    </div>
</template>

<script>
    export default {
        name: "SectionRequestTest",
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
