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

ActiveRecord::Schema.define(:version => 20130318090404) do

  create_table "galaxies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "night_images", :force => true do |t|
    t.integer  "galaxy_id"
    t.date     "night"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "fits_file_name"
    t.string   "fits_content_type"
    t.integer  "fits_file_size"
    t.datetime "fits_updated_at"
  end

  add_index "night_images", ["galaxy_id"], :name => "index_night_images_on_galaxy_id"

  create_table "references", :force => true do |t|
    t.integer  "galaxy_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "fits_file_name"
    t.string   "fits_content_type"
    t.integer  "fits_file_size"
    t.datetime "fits_updated_at"
  end

  add_index "references", ["galaxy_id"], :name => "index_references_on_galaxy_id"

end
