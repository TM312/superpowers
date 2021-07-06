<template>
    <div class="container">
        <div>
            <Logo />
            <br />
            <h1 class="title">Welcome to Superpowers</h1>
            <br />
            <br />
            <div class="links">
                <span @click="getAdd()" class="button--green">
                    Get API Response
                </span>
                <span>{{ result ? "" : "Not called yet" }}</span>
            </div>
            <div>
                params =
                {"data":[1,2.2,3,4],"services":[{"position":0,"name":"get_sum"},{"position":1,"name":"get_round"}]},
                'visualization': None, 'meta': { 'fields': {} } }
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
                const data = {
                    data: [1, 2, 3, 4],
                    services: [
                        {
                            position: 0,
                            name: "get_sum",
                        },
                        { position: 1, name: "get_round" },
                    ],
                    visualization: null,
                    meta: { fields: {} },
                };
                //this.result = await this.$axios.$post("", data);
                // post request including data
                this.result = await this.$axios.post("", {
                    headers: {
                        "Content-Type": "application/json",
                        "Access-Control-Allow-Origin": "*",
                    },
                    data: data,
                });
            },
        },
        computed: {
            testHtml() {
                return `<h2 class='subtitle'>We render the html-preformatted result <i>${this.result}</i> from the response directly after calling the API</h2></p>`;
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
