Vue.createApp({
    data() {
        return {
            loading: true,
            error: '',
            query: '',
            tokens: []
        }
    },

    async mounted() {
        this.find()
    },

    methods: {
        async find(query = undefined) {
            try {
                const result = await fetch(`/rates?query=${ query }`)
    
                const response = await result.json()
    
                this.tokens = response
    
                this.loading = false
            } catch (error) {
                this.loading = false
                this.error = error
            }
        }
    }
}).mount('#app')