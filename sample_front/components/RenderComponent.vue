
<script>
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
