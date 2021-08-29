<template>
    <div
        class="min-h-screen flex flex-col justify-center py-10 sm:px-6 lg:px-8"
    >
        <transition
            enter-active-class="transition ease-out duration-100 transform"
            enter-from-class="opacity-0 scale-95"
            enter-to-class="opacity-100 scale-100"
            leave-active-class="transition ease-in duration-75 transform"
            leave-from-class="opacity-100 scale-100"
            leave-to-class="opacity-100 scale-100"
        >
            <notification-status
                v-show="alert"
                :success="false"
                :msg="msg"
                msg-sub="Sub Message comes here"
                @alert-off="alert = false"
            />
        </transition>

        <div class="sm:mx-auto sm:w-full sm:max-w-md">
            <img
                class="mx-auto h-12 w-auto"
                src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg"
                alt="Superpowers"
            />
            <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-300">
                Sign in to your account
            </h2>
            <p class="mt-2 text-center text-sm text-gray-400 max-w">
                You don't have an account yet?
                <nuxt-link
                    class="font-medium text-indigo-400 hover:text-indigo-300"
                    to="/signup"
                >
                    Sign up here
                </nuxt-link>
                .
            </p>
        </div>

        <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
            <div class="bg-gray-700 py-8 px-4 shadow sm:rounded-lg sm:px-10">
                <form class="space-y-6" :action="login" method="POST">
                    <div>
                        <label
                            for="email"
                            class="block text-sm font-medium text-gray-300"
                        >
                            Email address
                        </label>
                        <div class="mt-1">
                            <input
                                id="email"
                                v-model="form.email"
                                name="email"
                                type="email"
                                autocomplete="email"
                                required
                                class="
                                    appearance-none
                                    block
                                    w-full
                                    px-3
                                    py-2
                                    border border-gray-800
                                    rounded-md
                                    shadow-sm
                                    placeholder-gray-600
                                    focus:outline-none
                                    focus:ring-indigo-400
                                    focus:border-indigo-400
                                    sm:text-sm
                                "
                            />
                        </div>
                    </div>

                    <div>
                        <label
                            for="password"
                            class="block text-sm font-medium text-gray-300"
                        >
                            Password
                        </label>
                        <div class="mt-1">
                            <input
                                id="password"
                                v-model="form.password"
                                name="password"
                                type="password"
                                autocomplete="current-password"
                                required
                                class="
                                    appearance-none
                                    block
                                    w-full
                                    px-3
                                    py-2
                                    border border-gray-800
                                    rounded-md
                                    shadow-sm
                                    placeholder-gray-400
                                    focus:outline-none
                                    focus:ring-indigo-500
                                    focus:border-indigo-500
                                    sm:text-sm
                                "
                            />
                        </div>
                    </div>

                    <!-- <div class="flex items-center justify-between">
            <div class="flex items-center">
              <input id="remember_me" name="remember_me" type="checkbox" class="h-4 w-4 text-indigo-400 focus:ring-indigo-500 border-gray-800 rounded" />
              <label for="remember_me" class="ml-2 block text-sm text-gray-900">
                Remember me
              </label>
            </div> -->

                    <!-- <div class="text-sm">
            <a href="#" class="font-medium text-indigo-400 hover:text-indigo-300">
              Forgot your password?
            </a>
          </div> -->
                    <!-- </div> -->

                    <div>
                        <button
                            type="submit"
                            class="
                                w-full
                                flex
                                justify-center
                                py-2
                                px-4
                                border border-transparent
                                rounded-md
                                shadow-sm
                                text-sm
                                font-medium
                                text-white
                                bg-indigo-600
                                hover:bg-indigo-700
                                focus:outline-none
                                focus:ring-2
                                focus:ring-offset-2
                                focus:ring-indigo-500
                            "
                        >
                            Sign in
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                alert: false,
                msg: "",
                form: {
                    email: "",
                    password: "",
                },
            };
        },
        methods: {
            async login() {
                const payload = {
                    email: this.form.email,
                    password: this.form.password,
                };
                try {
                    await this.$auth.loginWith("local", {
                        data: payload,
                    });
                } catch (err) {
                    // const status = err.data.response.status
                    this.alert = true;
                    console.log(err);
                    this.msg = err;
                    // if (status === 401 || status === 404) {
                    //     console.log()
                    //   this.$bvToast.toast('Invalid password or email.', {
                    //     autoHideDelay: 5000,
                    //     variant: 'danger'
                    //   })
                    // } else {
                    //   this.$bvToast.toast('There seems to be a problem. Please try again later.', {
                    //     autoHideDelay: 5000,
                    //     variant: 'danger'
                    //   })
                    // }
                }
            },
        },
    };
</script>
