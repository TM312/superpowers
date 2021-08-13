<template>
    <div class="flex flex-col">
        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div
                class="
                    py-2
                    align-middle
                    inline-block
                    min-w-full
                    sm:px-6
                    lg:px-8
                "
            >
                <div
                    class="
                        shadow
                        overflow-hidden
                        border-b border-gray-800
                        sm:rounded-lg
                    "
                >
                    <table class="min-w-full divide-y divide-gray-800">
                        <thead class="bg-gray-900">
                            <tr>
                                <th
                                    v-for="(col, i) in [
                                        'Name',
                                        'Description',
                                        'Type',
                                        'Required',
                                        'Default Value',
                                    ]"
                                    :key="i"
                                    scope="col"
                                    class="
                                        px-6
                                        py-3
                                        text-left text-xs
                                        font-medium
                                        text-gray-400
                                        uppercase
                                        tracking-wider
                                    "
                                    v-text="col"
                                />
                            </tr>
                        </thead>
                        <tbody class="bg-gray-800 divide-y divide-gray-800">
                            <tr v-for="(p, i) in requestParams" :key="i">
                                <td
                                    class="
                                        px-6
                                        py-4
                                        whitespace-nowrap
                                        text-sm
                                        font-medium
                                        text-gray-300
                                    "
                                    v-text="p.name"
                                />
                                <td
                                    class="
                                        px-6
                                        py-4
                                        whitespace-nowrap
                                        text-sm text-gray-300
                                    "
                                    v-text="p.description"
                                />
                                <td
                                    class="
                                        px-6
                                        py-4
                                        whitespace-nowrap
                                        text-sm text-gray-300
                                    "
                                >
                                    <badge-basic
                                        :word="paramsType[i].word"
                                        :color="paramsType[i].color"
                                    />
                                </td>

                                <td
                                    class="
                                        px-6
                                        py-4
                                        whitespace-nowrap
                                        text-sm text-gray-300
                                    "
                                    v-text="p.required"
                                />

                                <td
                                    class="
                                        px-6
                                        py-4
                                        whitespace-nowrap
                                        text-sm text-gray-300
                                    "
                                    v-text="p.default"
                                />
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "TableRequestParams",
        props: {
            requestParams: {
                type: Object,
                required: true,
            },
        },
        computed: {
            paramsType() {
                const wordCoding = {
                    int: "Integer",
                    str: "String",
                    byte: "Byte File",
                    bool: "Boolean",
                    array: "Array",
                    object: "Object",
                };

                const colorCoding = {
                    int: "green",
                    str: "red",
                    byte: "indigo",
                    bool: "yellow",
                };
                let params = this.requestParams.map((param) => {
                    let properties = {
                        value: param.p_type,
                        word: wordCoding[param.p_type],
                        color: colorCoding[param.p_type],
                    };
                    return properties;
                });
                return params;
            },
        },
    };
</script>

<style>
</style>
