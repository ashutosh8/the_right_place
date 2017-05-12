require 'contentful'
class ProductsController < ApplicationController
    
   
    
    def ssg1
         client = getCFClient()
        @ssg1 = client.entry '1vsz5G3S7SeEuWiEw2gukm'
        @ssg1_img = client.asset('1sUYXy4WCUCeeoqMESC6Cw').image_url
    end
    
    def lenl1
         client = getCFClient()
        @lenl1 = client.entry '6rRppRDk6QGe6uoYIOMqCs'
        @lenl1_img = client.asset('4HMAmOFnpKq0kyiGEse4YM').image_url
    end
    
    def eyep1
         client = getCFClient()
        @eyep1 = client.entry '6rHbXJ7PFK6yq62q0ggsom'
        @eyep1_img = client.asset('11HGSKty6Simm2qws8SAg8').image_url
    end
    
end
