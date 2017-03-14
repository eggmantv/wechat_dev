module Wechat
  class PushController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_action :auth_wechat_server

    def index
      Rails.logger.info "WECHAT: #{params}"
      render plain: params[:echostr]
    end

    def data
      body = request.body.read
      Rails.logger.info "WECHAT: #{body}"

      render plain: 'success'
    end

    protected
    def auth_wechat_server
      unless is_legal_from_wechat_server?
        render plain: "illegal signature"
      end
    end
  end
end
