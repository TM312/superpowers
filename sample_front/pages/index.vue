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
            <div class="links">
                <span @click="getSummary()" class="button--green">
                    Get Summary
                </span>
            </div>
            <h5>
                Payload: { <br />
                data: {{ payloadSummary.data }}, <br />
                services: {{ payloadSummary.services }}, <br />
                visualization: {{ payloadSummary.visualization }} <br />
                }
            </h5>
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
                result: "",
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
                payloadSummary: {
                    data: "Data sovereignty is the idea that data are subject to the laws and governance structures within the nation it is collected. The concept of data sovereignty is closely linked with data security, cloud computing and technological sovereignty. Unlike technological sovereignty, which is vaguely defined and can be used as an umbrella term in policymaking,[1] data sovereignty is specifically concerned with questions surrounding the data itself.[2] Data sovereignty is usually discussed in two ways: in relation to Indigenous groups and Indigenous autonomy from post-colonial states or in relation to transnational data flow. With the rise of cloud computing, many countries have passed various laws around control and storage of data, which all reflects measures of data sovereignty.[2] More than 100 countries have some sort of data sovereignty laws in place.[3] With self-sovereign identity (SSI) the individual identity holders can fully create and control their credentials, although a nation can still issue a digital identity in that paradigm.",
                    services: [{ position: 0, name: "get_summary" }],
                    visualization: { renderType: "basic", mainElement: "p" },
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
            async getSummary() {
                const payload = this.payloadSummary;
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
