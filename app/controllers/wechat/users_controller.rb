module Wechat
  class UsersController < ApplicationController

    def callback
      rsp = wechat_gate_config.oauth2_access_token(params[:code])
      user_open_id = rsp['openid']

      user_data = wechat_gate_config.oauth2_user(rsp['access_token'], user_open_id)
      Rails.logger.info "WECHAT: OAuth2 user: #{user_data}, state: #{params[:state]}"

      render plain: user_data
    end

  end
end
