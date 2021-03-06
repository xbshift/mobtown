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

ActiveRecord::Schema.define(:version => 20130924151241) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "rank"
    t.string   "slug"
    t.text     "prose"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "dance_classes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.decimal  "price",         :precision => 8, :scale => 2
    t.decimal  "student_price", :precision => 8, :scale => 2
    t.string   "session_dates"
    t.string   "slug"
    t.integer  "category_id"
  end

  add_index "dance_classes", ["slug"], :name => "index_dance_classes_on_slug"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "expiration"
    t.boolean  "special"
    t.text     "summary"
    t.text     "prose"
    t.string   "url"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "slug"
    t.string   "link"
    t.text     "schedule"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.boolean  "registration_switch"
    t.decimal  "price",               :precision => 8, :scale => 2
    t.decimal  "student_price",       :precision => 8, :scale => 2
  end

  add_index "events", ["slug"], :name => "index_events_on_slug"

  create_table "feature_boxes", :force => true do |t|
    t.text     "prose"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "occurrences", :force => true do |t|
    t.date     "start"
    t.date     "end"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "passes", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.decimal  "price",         :precision => 8, :scale => 2
    t.boolean  "available"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.string   "description"
    t.integer  "limit"
    t.integer  "passable_id"
    t.string   "passable_type"
    t.string   "session"
    t.boolean  "archived",                                    :default => false
    t.decimal  "student_price", :precision => 8, :scale => 2
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.boolean  "publish"
    t.text     "prose"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "registrations", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.decimal  "amount_paid", :precision => 8, :scale => 2
    t.string   "how_paid"
    t.integer  "pass_id"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.boolean  "void",                                      :default => false
    t.boolean  "student",                                   :default => false
  end

  create_table "rental_inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "description"
    t.string   "when"
    t.integer  "guest_count"
    t.integer  "budget"
    t.text     "details"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "schedule_exceptions", :force => true do |t|
    t.datetime "datetime"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedule_exceptions", ["event_id"], :name => "index_schedule_exceptions_on_event_id"

  create_table "schedule_recurrences", :force => true do |t|
    t.datetime "datetime"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedule_recurrences", ["event_id"], :name => "index_schedule_recurrences_on_event_id"

  create_table "staff", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "email"
    t.integer  "order"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
