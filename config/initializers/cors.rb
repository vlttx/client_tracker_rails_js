Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://clienttracker123.herokuapp.com'

    resource 'https://clienttracker123.herokuapp.com',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
