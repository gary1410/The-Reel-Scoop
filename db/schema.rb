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

ActiveRecord::Schema.define(version: 20150403224234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "genre",             default: [], array: true
    t.integer  "rotten_id"
    t.string   "imdb_id"
    t.string   "mob_poster_url"
    t.string   "det_poster_url"
    t.datetime "release_date"
    t.integer  "rt_critics_score"
    t.integer  "rt_audience_score"
    t.string   "mpaa_rating"
    t.text     "synopsis"
    t.integer  "runtime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "email"
    t.integer  "rating"
    t.string   "comment"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
