Vue.createApp({
    data() {
        return {
            query: '',
            tokens: [
                {
                    name: 'Bitcoin',
                    symbol: 'BTC',
                    logo: 'https://cryptologos.cc/logos/bitcoin-btc-logo.svg',
                    usd: 0
                },
                {
                    name: 'Ethereum',
                    symbol: 'ETH',
                    logo: 'https://cryptologos.cc/logos/ethereum-eth-logo.svg',
                    usd: 0
                },
                {
                    name: 'Binance coin',
                    symbol: 'BNB',
                    logo: 'https://cryptologos.cc/logos/bnb-bnb-logo.svg',
                    usd: 0
                },
                {
                    name: 'Tether',
                    symbol: 'USDT',
                    logo: 'https://cryptologos.cc/logos/tether-usdt-logo.svg',
                    usd: 0
                },
                {
                    name: 'Tron',
                    symbol: 'TRX',
                    logo: 'https://cryptologos.cc/logos/tron-trx-logo.svg',
                    usd: 0
                },
                {
                    name: 'Binance usd',
                    symbol: 'BUSD',
                    logo: 'https://cryptologos.cc/logos/binance-usd-busd-logo.svg',
                    usd: 0
                },
                {
                    name: 'Cardano',
                    symbol: 'ADA',
                    logo: 'https://cryptologos.cc/logos/cardano-ada-logo.svg',
                    usd: 0
                }
            ]
        }
    },

    async mounted() {
        const result = await fetch('/rates?ids=bitcoin,ethereum,binancecoin,tether,tron,busd,cardano')

        const response = await result.json()

        this.tokens[0].usd = response?.bitcoin.usd
        this.tokens[1].usd = response?.ethereum.usd
        this.tokens[2].usd = response?.binancecoin.usd
        this.tokens[3].usd = response?.tether.usd
        this.tokens[4].usd = response?.tron.usd
        this.tokens[5].usd = response?.busd.usd
        this.tokens[6].usd = response?.cardano.usd
    }
}).mount('#app')