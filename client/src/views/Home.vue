<template>
  <div>
    <h1>Fib Calculator</h1>
    <p>Enter your index</p>
    <input v-model="index" placeholder="Input index" />
    <button v-on:click="submitIndex">Submit</button>
    <h2>Index I have seen:</h2>
    <p v-for="(i, index, x) in seenIndexes" :key="x">{{ i.number }}</p>
    <h2>Calculated values</h2>
    <p v-for="(val, index) in values" :key="index">
      Index {{ index }} : {{ val }}
    </p>
  </div>
</template>

<script>
import EventService from '@/EventService'

export default {
  name: 'Home',
  data() {
    return {
      values: null,
      index: null,
      seenIndexes: [],
    }
  },
  methods: {
    async submitIndex(event) {
      event.preventDefault()
      console.log('clicked')
      await EventService.postIndex(this.index)
      this.index = null
    },
  },
  created() {
    EventService.fecthValues().then((res) => {
      this.values = res.data
    })
    EventService.fetchseenIndexes().then((res) => {
      this.seenIndexes = res.data
    })
  },
}
</script>
