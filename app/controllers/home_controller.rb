require 'http'
require 'json'
require 'contentful'
class HomeController < ApplicationController
  def index
   client = getCFClient()
   @products = client.entries('sys.id[ne]' => '2JbbIlOa0oWyYK0SMyoekg')
  end
  
  def aboutus
    client = getCFClient()
    
    @about = client.entry '2JbbIlOa0oWyYK0SMyoekg'
    @logoimg = client.asset('5yoa2WEcM0CIMcMme04Y8m').image_url
  end
  
  def contactus
    client = getCFClient()
    
    @about = client.entry '2JbbIlOa0oWyYK0SMyoekg'
  end
end
