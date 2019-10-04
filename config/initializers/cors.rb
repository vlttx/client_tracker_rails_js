Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://blooming-sea-43662.herokuapp.com'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
