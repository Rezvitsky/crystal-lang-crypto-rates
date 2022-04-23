require "./deps"

get "/" do |env|
  render "src/views/index.ecr"
end

get "/rates" do |env|
  env.response.content_type = "application/json"
  query = env.params.query["query"]
    
  response = HTTP::Client.get "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,binancecoin,tether,tron,busd,cardano&vs_currencies=usd&include_24hr_change=true"

  result = JSON.parse(response.body.lines.first)

  puts query

  tokens = [
    {
      name: "Bitcoin",
      symbol: "BTC",
      logo: "https://cryptologos.cc/logos/bitcoin-btc-logo.svg",
      usd: result["bitcoin"]["usd"]
    },
    {
      name: "Ethereum",
      symbol: "ETH",
      logo: "https://cryptologos.cc/logos/ethereum-eth-logo.svg",
      usd: result["ethereum"]["usd"]
    },
    {
      name: "Binance coin",
      symbol: "BNB",
      logo: "https://cryptologos.cc/logos/bnb-bnb-logo.svg",
      usd: result["binancecoin"]["usd"]
    },
    {
      name: "Tether",
      symbol: "USDT",
      logo: "https://cryptologos.cc/logos/tether-usdt-logo.svg",
      usd: result["tether"]["usd"]
    },
    {
      name: "Tron",
      symbol: "TRX",
      logo: "https://cryptologos.cc/logos/tron-trx-logo.svg",
      usd: result["tron"]["usd"]
    },
    {
      name: "Binance usd",
      symbol: "BUSD",
      logo: "https://cryptologos.cc/logos/binance-usd-busd-logo.svg",
      usd: result["busd"]["usd"]
    },
    {
      name: "Cardano",
      symbol: "ADA",
      logo: "https://cryptologos.cc/logos/cardano-ada-logo.svg",
      usd: result["cardano"]["usd"]
    }
  ].to_json
end

Kemal.run(3021)