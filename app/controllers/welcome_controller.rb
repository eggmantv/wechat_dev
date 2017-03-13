class WelcomeController < ApplicationController

  def index
    render html: "<h1>hello world</h1>".html_safe
  end

end
