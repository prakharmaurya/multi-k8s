import axios from 'axios'

export default {
  fecthValues() {
    return axios.get('api/values/current')
  },
  fetchseenIndexes() {
    return axios.get('/api/values/all')
  },
  postIndex(index) {
    return axios.post('/api/values', { index: index })
  },
}
