<template>
  <nav>
    <div>
      <p>こんにちは、<span class="name">{{ name }}</span>さん</p>
      <p class="email">現在、{{ email }}でログイン中です</p>
    </div>
    <button @click="logout">ログアウト</button>
  </nav>
</template>

<script>
import axios from 'axios'
import removeItem from './removeItem'

export default {
  data() {
    return {
      name: window.localStorage.getItem('name'),
      email: window.localStorage.getItem('uid'),
      error: null
    }
  },
  methods: {
    async logout() {
      this.error = null
      try {
        const res = await axios.delete('http://localhost:3000/auth/sign_out', {
          headers: {
            uid: this.email,
            'access-token': window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })

        if (!res) {
          new Error('ログアウトできませんでした')
        }

        console.log("ログアウトしました")
        removeItem()

        this.$router.push({ name: 'WelcomePage' })

        return res
      } catch (error) {
        this.error = 'ログアウトできませんでした'
      }
    }
  }
}
</script>

<style scoped>
  nav {
    padding: 20px;
    border-bottom: 1px solid #eee;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  nav p {
    margin: 2px auto;
    font-size: 16px;
    color: #444;
  }
  nav p.email {
    font-size: 14px;
    color: #999;
  }
</style>
