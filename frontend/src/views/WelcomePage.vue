<template>
  <div>
    <h1>{{ title }}</h1>
    <p v-if="isEnabled">{{ subtitle }}</p>
    <button @dblclick="toggle">トグルボタン(ダブルクリック)</button>
    <p>{{ text }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      title: '初めてのvueアプリ',
      subtitle: 'ようこそ',
      isEnabled: true
    }
  },
  computed: {
    text() {
      if (this.isEnabled) return 'こんにちは！'
      return 'さようなら！'
    }
  },
  methods: {
    toggle() {
      this.isEnabled = !this.isEnabled
    }
  }
}
</script>