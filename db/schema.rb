# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110221041034) do

  create_table "css_documents", :force => true do |t|
    t.text     "data"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "path"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "html_documents", :force => true do |t|
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.binary   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "js_documents", :force => true do |t|
    t.text     "data"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revisions", :force => true do |t|
    t.integer  "revisionable_id"
    t.string   "revisionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
