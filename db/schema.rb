# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20150323153313) do

  create_table "chronicler_documents", :force => true do |t|
    t.string "name"
    t.string "document"
  end

  create_table "chronicler_images", :force => true do |t|
    t.string "name"
    t.string "image"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "image_alt"
    t.string   "venue"
    t.decimal  "price",            :precision => 5, :scale => 2
    t.text     "summary"
    t.text     "content"
    t.date     "date_start"
    t.date     "date_end"
    t.text     "meta_description"
    t.text     "meta_tags"
    t.boolean  "highlight",                                      :default => false
    t.boolean  "display",                                        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manticore_administrators", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_send_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "layout"
    t.string   "style"
    t.string   "title"
    t.string   "image"
    t.string   "image_alt"
    t.text     "content"
    t.text     "meta_description"
    t.text     "meta_tags"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "home_page",        :default => false
    t.boolean  "contact_page",     :default => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "partners", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "image_alt"
    t.string   "web"
    t.text     "summary"
    t.integer  "position"
    t.boolean  "display",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "willow_branches", :force => true do |t|
    t.string  "tree"
    t.string  "name"
    t.integer "position",              :default => 0
    t.string  "ancestry"
    t.integer "ancestry_depth",        :default => 0
    t.string  "positions_depth_cache"
    t.integer "leaf_id"
    t.string  "leaf_type"
    t.string  "access_key"
    t.boolean "sturdy",                :default => false
    t.boolean "can_have_children",     :default => false
    t.boolean "primary",               :default => false
  end

  add_index "willow_branches", ["ancestry"], :name => "index_willow_branches_on_ancestry"

  create_table "willow_leaves", :force => true do |t|
    t.string "name"
    t.string "route"
    t.string "type"
  end

end
