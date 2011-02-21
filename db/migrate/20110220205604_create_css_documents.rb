class CreateCssDocuments < ActiveRecord::Migration
  def self.up
    create_table :css_documents do |t|
      t.text :data
      t.references :document
      t.timestamps
    end
  end

  def self.down
    drop_table :css_documents
  end
end
