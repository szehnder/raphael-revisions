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
    "public/document_repo"
  end

  def relative_path
    "/#{self.safe_name}"
  end

  def dirname
    "#{reponame}/#{self.safe_name}"
  end

  def jsname
    "#{dirname}/my_nodebox.js"
  end

  def cssname
    "#{dirname}/my_nodebox.css"
  end
  
  def html_template
     "#{dirname}/index.html"
  end
  
  def template_includes
    ["raphael_nodebox.js", "raphael_nodebox.css"]
  end
  
  def css_include
    "raphael/raphael_nodebox.css"
  end

  private
  def setup_documents
    JsDocument.create(:document=>self, :path =>dirname, :name=>jsname)
    CssDocument.create(:document=>self, :path =>dirname, :name=>cssname)
    
    av = ActionView::Base.new(Rails.root.join('app', 'views'))
    File.open(html_template, 'w') {|f| f <<  av.render(:template => 'home/template') }
    
    template_includes.each do |inc|
      FileUtils.cp("public/raphael_nodebox_includes/#{inc}", "#{dirname}/#{inc}")  
    end

  end
  
  def setup_folders
    Dir.mkdir(reponame) if !Dir.exists?(reponame)
    Dir.mkdir(dirname) if !Dir.exists?(dirname)
    setup_documents()
  end

  def update_static_files
    setup_folders() if !Dir.exists?(dirname)
    self.path = relative_path;
    File.open(jsname, 'a') do |f| f.puts(self.js_document.data) end if self.js_document
    File.open(cssname, 'a') do |f| f.push(self.css_document.data) end if self.css_document
  end
end
