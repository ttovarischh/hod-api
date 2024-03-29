# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_04_30_075233) do

  create_table "effects", force: :cascade do |t|
    t.string "name"
    t.text "descr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "effects_monsters", id: false, force: :cascade do |t|
    t.integer "monster_id", null: false
    t.integer "effect_id", null: false
    t.index ["effect_id", "monster_id"], name: "index_effects_monsters_on_effect_id_and_monster_id"
    t.index ["monster_id", "effect_id"], name: "index_effects_monsters_on_monster_id_and_effect_id"
  end

  create_table "effects_players", id: false, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "effect_id", null: false
    t.index ["effect_id", "player_id"], name: "index_effects_players_on_effect_id_and_player_id"
    t.index ["player_id", "effect_id"], name: "index_effects_players_on_player_id_and_effect_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "fight", default: false
    t.integer "turn", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "initiative"
    t.integer "hp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "game_id", null: false
    t.integer "armor"
    t.boolean "conc", default: false
    t.boolean "active", default: false
    t.index ["game_id"], name: "index_monsters_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "initiative", default: 0
    t.string "language"
    t.integer "perc"
    t.integer "inv"
    t.integer "ins"
    t.boolean "conc", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "game_id", null: false
    t.string "username"
    t.string "imagestring"
    t.boolean "active", default: false
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "jti"
    t.string "username"
    t.string "about"
    t.string "sex", default: "male"
    t.string "show", default: "count"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "users"
  add_foreign_key "monsters", "games"
  add_foreign_key "players", "games"
end
