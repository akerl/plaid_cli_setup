require 'json'
require 'plaid'
require 'sinatra'

client = Plaid::Client.new(env: ENV['PLAID_ENV'],
                           client_id: ENV['PLAID_CLIENT_ID'],
                           secret: ENV['PLAID_SECRET'],
                           public_key: ENV['PLAID_PUBLIC_KEY'])

get '/' do
  erb :index
end

post '/get_access_token' do
  exchange_token_response = client.item.public_token.exchange(params['public_token'])
  content_type :json
  exchange_token_response.to_json
end
