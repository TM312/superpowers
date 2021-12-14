<template>
    <div>
        <label
            id="listbox-label"
            class="block text-sm font-medium text-gray-200"
            v-text="paramName"
        />
        <div class="mt-1 relative">
            <button
                type="button"
                class="
                    relative
                    w-full
                    bg-white
                    border border-gray-300
                    rounded-md
                    shadow-sm
                    pl-3
                    pr-10
                    py-2
                    text-left
                    cursor-default
                    focus:outline-none
                    focus:ring-1
                    focus:ring-indigo-500
                    focus:border-indigo-500
                    sm:text-sm
                    text-gray-700
                "
                aria-haspopup="listbox"
                aria-expanded="true"
                aria-labelledby="listbox-label"
                @click="menuOpen = !menuOpen"
            >
                <span class="block truncate" v-text="selected" />
                <span
                    class="
                        absolute
                        inset-y-0
                        right-0
                        flex
                        items-center
                        pr-2
                        pointer-events-none
                    "
                >
                    <solid-selector-icon
                        class="h-5 w-5 text-gray-400"
                        aria-hidden="true"
                    />
                </span>
            </button>

            <transition
                leave-active-class="transition ease-in duration-100"
                leave-from-class="opacity-100"
                leave-to-class="opacity-0"
            >
                <div
                    v-if="menuOpen"
                    class="
                        absolute
                        z-10
                        mt-1
                        w-full
                        bg-white
                        shadow-lg
                        max-h-60
                        rounded-md
                        py-1
                        text-base
                        ring-1 ring-black ring-opacity-5
                        overflow-auto
                        focus:outline-none
                        sm:text-sm
                    "
                >
                    <ul
                        tabindex="-1"
                        role="listbox"
                        aria-labelledby="listbox-label"
                        aria-activedescendant="listbox-option-3"
                        v-for="(option, i) in paramOptions"
                        :key="i"
                    >
                        <li
                            @mouseover="active = option"
                            @mouseleave="active = selected"
                            @click="selectAndClose(option)"
                            :class="
                                active == option
                                    ? 'text-white bg-indigo-600'
                                    : 'text-gray-900'
                            "
                            class="
                                cursor-default
                                select-none
                                relative
                                py-2
                                pl-8
                                pr-4
                            "
                        >
                            <span
                                :class="
                                    active == option
                                        ? 'font-semibold'
                                        : 'font-normal'
                                "
                                class="block truncate"
                                v-text="option"
                            />

                            <span
                                :class="
                                    active == option
                                        ? 'text-white'
                                        : 'text-indigo-600'
                                "
                                class="
                                    absolute
                                    inset-y-0
                                    left-0
                                    flex
                                    items-center
                                    pl-1.5
                                "
                            >
                                <solid-check-icon
                                    v-show="active == option"
                                    class="h-5 w-5"
                                    aria-hidden="true"
                                />
                            </span>
                        </li>
                    </ul>
                </div>
            </transition>
        </div>
    </div>
</template>

<script>
    export default {
        name: "InputFieldServiceConfigSampleRequest",
        props: {
            paramOptions: {
                type: Array,
                required: true,
            },
            paramKey: {
                type: String,
                required: true,
            },
            paramName: {
                type: String,
                required: true,
            },
            sampleParamsPublicId: {
                type: String,
                required: true,
            },
        },
        data() {
            return {
                selected: null,
                active: null,
                menuOpen: false,
            };
        },

        computed: {
            ConfigParam() {
                return this.$store.$db().model("config-params");
            },
            configParam() {
                return this.ConfigParam.query()
                    .where("sample_params_public_id", this.sampleParamsPublicId)
                    .where('key', this.paramKey)
                    .first();
            }
        },
        
        mounted() {
            this.selected = this.configParam.value;
        },

        methods: {
            selectAndClose(value) {
                this.selected = value;

                this.updateConfigParam(value)

                this.menuOpen = false;
            },
            
            updateConfigParam(value) {
                this.ConfigParam.update({
                    where: this.configParam.id,
                    data: { value: value}
                });
            },
            
        },
    };
</script>

<style>
</style>
