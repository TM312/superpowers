<script>
    // https://stackoverflow.com/questions/56013561/nuxt-render-function-for-a-string-of-html-that-contains-vue-components

    export default {
        props: {
            html: {
                type: String,
                default: "",
            },
        },

        render(h) {
            return h({
                template: `<div>${this.html}</div>`,
            });
        },
    };
</script>
