module ApiQueryProvider
  class Provider
    cattr_accessor :api_url
    cattr_accessor :api_path
    
    attr_reader :where_constraints
    attr_reader :count_constraint
    attr_reader :select_fields
    
    def initialize (base)    
      api_url = base.api_url
      api_path = base.api_path
      if base.is_a? Class
        @where_constraints = {}
        @select_fields = []
        @count_constraint = 0
      else
        @where_constraints = base.where_constraints
        @select_fields = base.select_fields
        @count_constraint = base.count_constraint
      end

    end
    
    def where(opt = {})
      @where_constraints.merge! opt
      
      return self
    end
    
    def limit(count)
      @count_constraint = count
      
      return self
    end
    
    def self.where(opt = {})
      interface.where(opt)
    end
    
    def self.limit(count)
      interface.limit(count)
    end
    
    def replace_path
      replaced_path = api_path
      
      @where_constraints.each do |key, value|
        replaced_path.gsub! /:#{key}/, value.to_s
      end
      
      replaced_path
    end
    
    def execute
      
    end
    
    def self.interface
      ApiQueryProvider::Provider.new(self)
    end
  end
end