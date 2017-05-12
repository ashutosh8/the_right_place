class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  require 'contentful'
  
  def getCFClient

  client = Contentful::Client.new(
  space: '97khnaaw3ccw',
  access_token: '67a5095081ab1d0124d9e93a576e16f1e392e43b52c0375724548c8da610e474',
  dynamic_entries: :auto
  )

    return client  
  end
end