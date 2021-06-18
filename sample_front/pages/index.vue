<template>
    <div class="container">
        <div>
            <Logo />
            <br />
            <h1 class="title">Welcome to Superpowers</h1>
            <br />
            <br />
            <div class="links">
                <span @click="getAdd()" class="button--green"> Get IP </span>
                <span>{{ result ? result : "Not called yet" }}</span>
            </div>
            <div>
                params = { 'data': [1,2,3,4], 'service_pipeline': [ {
                'position':0, 'name': 'get_sum', }, { 'position':1, 'name':
                'get_rounded', } ], 'visualization': None, 'meta': { 'fields':
                {} } }
            </div>
            <br />
            <br />
            <div>
                Below is generated HTML:<br />
                <br />
                <render-component :html="testHtml" />
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                result: null,
            };
        },
        methods: {
            async getAdd() {
                const result = await this.$axios.$get("https://icanhazip.com");
                this.result = result;
            },
        },
        computed: {
            testHtml() {
                return "<h2 class='subtitle'>Welcome to The Inner Component</h2>";
            },
        },
    };
</script>

<style>
    .container {
        margin: 0 auto;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
    }

    .title {
        font-family: "Inter Var", -apple-system, BlinkMacSystemFont, "Segoe UI",
            Roboto, "Helvetica Neue", Arial, sans-serif;
        display: block;
        font-weight: 300;
        font-size: 100px;
        color: #35495e;
        letter-spacing: 1px;
    }

    .subtitle {
        font-weight: 300;
        font-size: 42px;
        color: #526488;
        word-spacing: 5px;
        padding-bottom: 15px;
    }

    .links {
        padding-top: 15px;
    }
</style>
