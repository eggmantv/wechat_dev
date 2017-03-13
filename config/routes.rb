Rails.application.routes.draw do

  root 'welcome#index'

  namespace :wechat do
    controller :push do
      get '/push' => :index
    end
  end
end
