<template>
  <div class="container">
    <NavBar />
    <ChatWindow @connectCable="connectCable" :messages="formattedMessages" ref="chatWindow" />
    <NewChatFormVue @connectCable="connectCable" />
  </div>
</template>

<script>
import NavBar from '@/components/NavBar'
import ChatWindow from '@/components/ChatWindow'
import NewChatFormVue from '@/components/NewChatForm'
import axios from 'axios'
import ActionCable from 'actioncable'
import { formatDistanceToNow } from 'date-fns'
import { ja } from 'date-fns/locale'

export default {
  components: { NavBar, ChatWindow, NewChatFormVue },
  data() {
    return {
      messages: [],
    }
  },
  computed: {
    formattedMessages() {
      if (!this.messages.length) { return [] }
      return this.messages.map(message => {
        let time = formatDistanceToNow(new Date(message.created_at), { locale: ja })
        return { ...message, created_at: time }
      })
    }
  },
  methods: {
    async getMessages() {
      try {
        const res = await axios.get('http://localhost:3000/messages', {
          headers: {
            uid: window.localStorage.getItem('uid'),
            "access-token": window.localStorage.getItem('access-token'),
            client:window.localStorage.getItem('client')
          }
        })
        if (!res) {
          new Error('メッセージを取得できませんでした')
        }
        this.messages = res.data
      } catch(err) {
        console.log(err)
      }
    },
    connectCable(message) {
      this.messageChannel.perform('receive', {
        message: message,
        email: window.localStorage.getItem('uid')
      })
    }
  },
  mounted() {
    const cable = ActionCable.createConsumer('ws://localhost:3000/cable')
    this.messageChannel = cable.subscriptions.create('RoomChannel', {
      connected: () => {
        this.getMessages().then(() => {
          this.$refs.chatWindow.scrollToBottom()
        })
      },
      received: () => {
        this.getMessages().then(() => {
          this.$refs.chatWindow.scrollToBottom()
        })
      }
    })
  },
  beforeUnmount() {
    this.messageChannel.unsubscribe()
  }
}
</script>

<style scoped></style>
