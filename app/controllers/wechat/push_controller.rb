module Wechat
  class PushController < ApplicationController

    def index
      Rails.logger.info "WECHAT: #{params}"
      render plain: params[:echostr]
    end
  end
end
