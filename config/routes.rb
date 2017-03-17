Rails.application.routes.draw do

  root 'welcome#index'

  namespace :wechat do
    controller :push do
      get '/push' => :index
      post '/push' => :data
    end

    controller :users, path: 'users' do
      get '/callback' => :callback
    end

    controller :ticket, path: 'ticket' do
      get '' => :index
      get 'share_test' => :share_test
    end
  end
end
