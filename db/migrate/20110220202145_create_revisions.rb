class CreateRevisions < ActiveRecord::Migration
  def self.up
    create_table :revisions do |t|
      t.references :revisionable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :revisions
  end
end
