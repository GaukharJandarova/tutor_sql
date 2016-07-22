json.array!(@challenges) do |challenge|
  json.extract! challenge, :id
  json.url challende_url(challenge, format: :json)
end
