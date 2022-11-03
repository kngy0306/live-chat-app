<template>
  <div>
    <h1>{{ title }}</h1>
    <ChildComponent message="親コンポーネントからpropsで渡したmessage" @toggle="toggle" />
    <p v-if="isEnabled">クリックで表示された</p>
  </div>
</template>

<script>
import ChildComponent from '@/components/ChildComponent.vue'

export default {
  components: {
    ChildComponent
  },
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