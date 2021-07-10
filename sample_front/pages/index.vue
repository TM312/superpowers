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
            </div>

            <h5>
                Payload: { <br />
                data: {{ payload.data }}, <br />
                services: {{ payload.services }}, <br />
                visualization: {{ payload.visualization }} <br />
                }
            </h5>
            <br />
            <br />
            <h2>
                We render the html-preformatted result directly from the API
                response
            </h2>
            <div>Result: <render-component :html="testHtml" /></div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                result: {},
                payload: {
                    data: [1.1, 2.2, 3.1],
                    services: [
                        { position: 0, name: "get_sum" },
                        {
                            position: 1,
                            name: "get_round",
                            config: {
                                roundType: "floor",
                            },
                        },
                    ],
                    visualization: { renderType: "basic", mainElement: "i" },
                },
            };
        },
        methods: {
            async getAdd() {
                const payload = this.payload;
                //this.result = await this.$axios.$post("", data);
                // post request including data
                const res = await this.$axios.post("", {
                    headers: {
                        "Content-Type": "application/json",
                        "Access-Control-Allow-Origin": "*",
                    },
                    data: payload,
                });

                this.result = res.data;
            },
        },
        computed: {
            testHtml() {
                return this.result;
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
