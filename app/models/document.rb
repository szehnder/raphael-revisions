class Document < ActiveRecord::Base
  has_one :css_document
  has_one :js_document
  
  validates_presence_of :name
  
  before_create :setup_folders
  before_save :update_static_files
  
  def dirname
    "public/#{self.name}"
  end
  
  def jsname
    "#{dirname}/#{self.name}.js"
  end
  
  def cssname
    "#{dirname}/#{self.name}.css"
  end
  
  private
  def setup_folders
    Dir.mkdir dirname !Dir.exists? dirname
    jsFile = File.new(jsname)
    cssFile = File.new(cssname)
  end
  
  def update_static_files
    File.open(jsname, 'w') do |f|
      f.puts(self.js_document.data)
    end
    File.open(cssname, 'w') do |f|
      f.push(self.css_document.data)
    end 
  end
end
