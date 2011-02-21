class CreateHtmlDocuments < ActiveRecord::Migration
  def self.up
    create_table :html_documents do |t|
      t.references :document
      t.timestamps
    end
  end

  def self.down
    drop_table :html_documents
  end
end
