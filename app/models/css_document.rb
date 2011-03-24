class CssDocument < ActiveRecord::Base
   has_many :revisions, :as => :revisionable
   belongs_to :document
   before_create :setup_doc
   
   private
   def full_path
      "#{path}/#{name}"
    end
    
   def setup_doc
     self.data = "/* copyright 2010-2011 Sean Zehnder */"
     File.open(full_path, 'w') do |f|
       f.puts(self.data)
     end
   end
end
