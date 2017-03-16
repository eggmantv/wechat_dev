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

      doc = Nokogiri::XML(body)
      user_open_id = doc.search("FromUserName").text

      event = doc.search("Event").text
      event_key = doc.search("EventKey").text

      msg_type = doc.search("MsgType").text
      content = doc.search("Content").text
      case msg_type.to_sym
      when :text
        render xml: wechat_gate_config.message_body(:text, user_open_id, "我们收到了: #{content}")
        return
      when :event
        case event.to_sym
        when :subscribe
          render xml: wechat_gate_config.message_body(:text, user_open_id, "欢迎关注蛋人网!")
          return
        end
      else
        Rails.logger.info "WECHAT: push: unknown msg_type #{msg_type}"
      end

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
