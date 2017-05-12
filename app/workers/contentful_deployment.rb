module ContentfulDeployment
    def self.perform
        client = Contentful::Management::Client.new(
            '1a682186e8af0aaeb68c9966fdc66c021dc2614849e79605ba792afa2351dba6',
            default_locale: 'en-GB', raise_errors: true
            )
            
            space = client.spaces.find('97khnaaw3ccw')
            return "Error initializing Contentful space #{space.error}" if space.try(:error)
           
            create_content_types(space)
            
            puts ">>>>>>>>>> Asset Deployment Complete"
            
            #ContentfulEntryMigration.perform
            :success
            
    end
    
    def self.create_content_types(space)
      puts "Creating Product Catalog Content Type"
     
      catalog = space.content_types.create(id: 'productCatalog', name: 'Product Catalog')
     
      
      catalog.fields.create(id: 'productId', name: 'Product ID', type: 'Integer', localized: true)
      catalog.fields.create(id: 'productName', name: 'Product Name', type: 'Text', localized: true)
      catalog.fields.create(id: 'productDesc', name: 'Product Description', type: 'Text', localized:true)
      catalog.update(displayField: 'productName')
      catalog.activate

      puts "Creating Entry/Entries which is/are known for product catalog"
      catalogs = []
      catalogs << catalog.entries.create(id: 'ssg2', name: 'SS Gal 2')
      catalogs << catalog.entries.create(id: 'htseeh1', name: 'HTSEE H1')
      catalogs.map(&:publish)
    end
    
    def self.create_entry(space_id, content_type_id, entry_id)
        client = Contentful::Management::Client.new(
            '1a682186e8af0aaeb68c9966fdc66c021dc2614849e79605ba792afa2351dba6',
            default_locale: 'en-GB', raise_errors: true
            )
            
        space = client.spaces.find(space_id.to_s)
        return "Error initializing Contentful space #{space.error}" if space.try(:error)
         
        content_type = space.content_types.find(content_type_id.to_s)
        return "Error initializing Contentful content type #{content_type.error}" if content_type.try(:error)
       
        puts "Creating Entry for #{content_type.name}"
        
        entry = content_type.entries.create(id: entry_id.to_s)
        entry.publish
        
        :success
    end
end