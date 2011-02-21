class Document < ActiveRecord::Base
  has_one :css_document
  has_one :js_document
  has_one :html_document

  validates_presence_of :name

  before_save :update_static_files
  after_create :setup_documents



  def safe_name
    self.name.gsub(' ', '_')
  end

  def reponame
    "public/document_repo"
  end

  def dirname
    "#{reponame}/#{self.safe_name}"
  end

  def jsname
    "#{dirname}/raphael_nodebox.js"
  end

  def cssname
    "#{dirname}/raphael_nodebox.css"
  end

  private
  def setup_documents
    JsDocument.create(:document=>self)
    CssDocument.create(:document=>self)
    HtmlDocument.create(:document=>self)
  end
  
  def setup_folders
    Dir.mkdir(reponame) if !Dir.exists?(reponame)
    Dir.mkdir(dirname)
    jsFile = File.open(jsname, 'w') do |f|
      f.puts("//copyright 2010-2011 Sean Zehnder")
    end
    cssFile = File.open(cssname, 'w') do |f|
      f.puts("/* copyright 2010-2011 Sean Zehnder */")
    end
  end

  def update_static_files
    setup_folders() if !Dir.exists?(dirname)
    File.open(jsname, 'a') do |f| f.puts(self.js_document.data) end if self.js_document
    File.open(cssname, 'a') do |f| f.push(self.css_document.data) end if self.css_document
  end
end
