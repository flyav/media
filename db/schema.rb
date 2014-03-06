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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140305222647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "media", force: true do |t|
    t.string   "title"
    t.integer  "runtime"
    t.string   "genre"
    t.string   "platform"
    t.string   "director"
    t.text     "cast"
    t.date     "release_date"
    t.integer  "critic_rating"
    t.integer  "audience_rating"
    t.boolean  "foreign"
    t.text     "summary"
    t.string   "trailer_link"
    t.string   "movie_link"
    t.string   "rotten_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "watched"
    t.integer  "hassan_rating"
    t.string   "poster_link"
    t.boolean  "own"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
