class CreateJsDocuments < ActiveRecord::Migration
  def self.up
    create_table :js_documents do |t|
      t.text :data
      t.references :document
      t.string :name
      t.string :path
      t.timestamps
    end
  end

  def self.down
    drop_table :js_documents
  end
end
