require "./deps"

get "/" do |env|
  render "src/views/index.ecr"
end

get "/rates" do |env|
  env.response.content_type = "application/json"
  ids = env.params.query["ids"]

  HTTP::Client.get("https://api.coingecko.com/api/v3/simple/price?ids=#{ ids }&vs_currencies=usd&include_24hr_change=true") do |response|
    response.status_code
    response.body_io.gets
  end
end


Kemal.run