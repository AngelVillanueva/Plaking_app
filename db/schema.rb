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

ActiveRecord::Schema.define(:version => 20120904153655) do

  create_table "cities", :force => true do |t|
    t.string  "name"
    t.integer "state_id"
  end

  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "prices", :force => true do |t|
    t.integer  "vehicle_id"
    t.integer  "city_id"
    t.decimal  "price",            :precision => 10, :scale => 3
    t.integer  "year"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "cc_engine"
    t.integer  "number_cylinders"
    t.integer  "stroke"
  end

  add_index "prices", ["vehicle_id", "city_id", "year"], :name => "index_prices_on_type_id_and_city_id_and_year"

  create_table "quotes", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "city"
    t.string   "vehicle"
    t.integer  "cc_engine"
    t.integer  "number_cylinders"
    t.integer  "stroke"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.boolean  "covered"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
