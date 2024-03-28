Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             credentials: false,
             expose: ['Authorization', 'Token'], # Include any other headers that need to be exposed
             max_age: 600 # Optional; set this to the number of seconds the preflight OPTIONS response should be cached
  end
end