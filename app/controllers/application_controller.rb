class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  self.wechat_gate_app_name = 'eggman'
end
