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

ActiveRecord::Schema.define(version: 20170510035227) do

  create_table "affiliates", force: :cascade do |t|
    t.string   "title",        limit: 50
    t.text     "about"
    t.integer  "phone_number",                         null: false
    t.string   "email",                   default: "", null: false
    t.string   "address"
    t.string   "suburb",       limit: 20
    t.integer  "postcode"
    t.integer  "annual_fee"
    t.string   "category",     limit: 15
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["user_id"], name: "index_affiliates_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.boolean  "attended_meeting"
    t.boolean  "rating_provided"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["meeting_id", "user_id"], name: "index_attendances_on_meeting_id_and_user_id"
  end

  create_table "controllers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "Contact"
    t.string   "index"
    t.string   "mail"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_controllers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_controllers_on_reset_password_token", unique: true
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "affiliate_id"
    t.string   "title",        limit: 50
    t.text     "blurb"
    t.string   "address"
    t.string   "suburb",       limit: 20
    t.integer  "postcode"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["affiliate_id"], name: "index_meetings_on_affiliate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 25
    t.string   "last_name",              limit: 50
    t.integer  "phone_number",                                   null: false
    t.string   "username"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
