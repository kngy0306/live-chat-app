<template>
  <p>コンポーネントのテキスト</p>
  <button @click="onClick">親メソッドを実行する</button>
</template>

<script>
export default {
  props: ['message'],
  methods: {
    onClick() {
      this.$emit('toggle')
    }
  }
}
</script>