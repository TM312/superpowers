import Vue from 'vue'

Vue.mixin({
  methods: {
    sleep(s) {
      return new Promise(resolve => setTimeout(resolve, s/1000))
    },
  }
})
