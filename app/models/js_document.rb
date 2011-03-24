require 'cgi'
class JsDocument < ActiveRecord::Base
  has_many :revisions, :as => :revisionable
  belongs_to :document
  before_create :setup_doc
  
  after_save :update_document
  
  private
  
  def full_path
    "#{path}/#{name}"
  end
  
  def setup_doc
    self.data = "//copyright 2010-2011 Sean Zehnder\r\rfunction draw()\r{\r\t//drawing code here\r}"
    debugger
    File.open(full_path, 'w') do |f|
      f.puts(unescaped_data)
    end
  end
  
  def update_document
    File.open(full_path, 'w') do |f|
      f.puts(unescaped_data)
    end
  end
  
  def unescaped_data
    CGI.unescape(self.data)
  end
end
