# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100118160248) do

  create_table "assignments", :force => true do |t|
    t.string   "text",                        :null => false
    t.date     "date",                        :null => false
    t.string   "tag",                         :null => false
    t.integer  "position"
    t.integer  "photos_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "tweeted_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.text     "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentions", :force => true do |t|
    t.string   "tweet_id",                             :null => false
    t.string   "text",                                 :null => false
    t.string   "user_id",                              :null => false
    t.string   "screen_name",                          :null => false
    t.string   "profile_image_url",                    :null => false
    t.boolean  "was_parsed",        :default => false
    t.datetime "tweeted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photogs", :force => true do |t|
    t.string   "screen_name",                      :null => false
    t.string   "profile_image_url",                :null => false
    t.integer  "photos_count",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photogs", ["screen_name"], :name => "index_photogs_on_screen_name", :unique => true

  create_table "photos", :force => true do |t|
    t.string   "url",           :null => false
    t.string   "thumb_url",     :null => false
    t.string   "screen_name",   :null => false
    t.integer  "assignment_id"
    t.integer  "photog_id"
    t.string   "tweet_id"
    t.datetime "tweeted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "medium_url"
  end

  add_index "photos", ["assignment_id"], :name => "index_photos_on_assignment_id"
  add_index "photos", ["photog_id"], :name => "index_photos_on_photog_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "suggestions", :force => true do |t|
    t.string   "name"
    t.string   "twitter_user_name"
    t.text     "suggestion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                            :null => false
    t.string   "email",                            :null => false
    t.boolean  "is_admin",      :default => false
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
