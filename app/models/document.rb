require 'fileutils'
class Document < ActiveRecord::Base
  has_one :css_document
  has_one :js_document
  has_one :html_document

  validates_uniqueness_of :title
  validates_presence_of :title

  before_save :update_static_files

  include Rails.application.routes.url_helpers # brings ActionDispatch::Routing::UrlFor
  include ActionView::Helpers::TagHelper

  def safe_name
    self.title.gsub(' ', '_')
  end

  def reponame
    "document_repo"
  end

  def relative_path
    "/#{self.safe_name}"
  end

  def dirname
    "#{reponame}/#{self.safe_name}/"
  end
  
  def complete_dirname
    "public/#{dirname}"
  end

  def jsname
    "my_nodebox.js"
  end

  def cssname
    "my_nodebox.css"
  end
  
  def html_template
     "index.html"
  end
  
  def template_includes
    ["raphael_nodebox.js", "raphael_nodebox.css"]
  end
  
  def css_include
    "raphael/raphael_nodebox.css"
  end

  private
  def setup_documents
    JsDocument.create(:document=>self, :path =>complete_dirname, :name=>jsname)
    CssDocument.create(:document=>self, :path =>complete_dirname, :name=>cssname)
    
    av = ActionView::Base.new(Rails.root.join('app', 'views'))
    File.open("#{complete_dirname}/#{html_template}", 'w') {|f| f <<  av.render(:template => 'home/template') }
    
    template_includes.each do |inc|
      FileUtils.cp("public/raphael_nodebox_includes/#{inc}", "#{complete_dirname}/#{inc}")  
    end

  end
  
  def setup_folders
    Dir.mkdir(reponame) if !Dir.exists?("public/#{reponame}")
    Dir.mkdir(complete_dirname) if !Dir.exists?(complete_dirname)
    setup_documents()
  end

  def update_static_files
    setup_folders() if !Dir.exists?(complete_dirname)
    self.path = dirname if (!path)
    File.open("#{complete_dirname}/#{jsname}", 'a') do |f| f.puts(self.js_document.data) end if self.js_document
    File.open("#{complete_dirname}/#{cssname}", 'a') do |f| f.puts(self.css_document.data) end if self.css_document
  end
end
