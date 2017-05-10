class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: 'Sooner: our first motivation site: Just for you'
  end

end
