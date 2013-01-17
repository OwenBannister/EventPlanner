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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20130117200359) do

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "phone_number"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
=======
ActiveRecord::Schema.define(:version => 20130117034005) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.integer  "duration"
    t.date     "date"
    t.time     "time"
    t.integer  "max_users"
    t.integer  "min_users"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
>>>>>>> ff2268ba1570d1ec9341a1a96798d83d685f045f
  end

end
