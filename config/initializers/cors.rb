Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://amazing-chebakia-476b39.netlify.app'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options]
    end
end