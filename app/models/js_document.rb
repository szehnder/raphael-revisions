class JsDocument < ActiveRecord::Base
  has_many :revisions, :as => :revisionable
  belongs_to :document
  before_create :setup_doc
  
  private
  def setup_doc
    self.data = "//copyright 2010-2011 Sean Zehnder\r\rfunction draw()\r{\r\t//drawing code here\r}"
    File.open(self.name, 'w') do |f|
      f.puts(self.data)
    end
  end
end
