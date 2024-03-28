Rails.application.routes.draw do
  root to: proc { [200, { 'Content-Type' => 'text/html' }, ['Welcome to the Task Manager API']] }
  
  resources :tasks
end
