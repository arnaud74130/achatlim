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

ActiveRecord::Schema.define(version: 20141106141648) do

  create_table "consultations", force: true do |t|
    t.string   "code"
    t.string   "libelle"
    t.date     "debut"
    t.date     "fin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "statut",     default: true
  end

  create_table "consultations_etablissements", id: false, force: true do |t|
    t.integer "etablissement_id", null: false
    t.integer "consultation_id",  null: false
  end

  create_table "etablissements", force: true do |t|
    t.string   "nom"
    t.string   "code_adherent"
    t.string   "telephone"
    t.string   "fax"
    t.string   "adresse_ligne1"
    t.string   "adresse_ligne2"
    t.string   "code_postal"
    t.string   "ville"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fncs", force: true do |t|
    t.string   "raison_litige"
    t.string   "numero_commande"
    t.string   "produits"
    t.date     "commande_passee"
    t.date     "livraison_demandee"
    t.string   "lot_ou_dlc"
    t.boolean  "instruction_avoir"
    t.boolean  "instruction_facture"
    t.boolean  "instruction_surv_prepa"
    t.boolean  "instruction_reprendre"
    t.boolean  "instruction_relivrer"
    t.string   "instruction_autre"
    t.string   "respect_delais"
    t.string   "proprete_camion"
    t.string   "etat_emballage"
    t.string   "conformite_produit"
    t.string   "respect_dlc"
    t.string   "temperature_produit"
    t.string   "abs_tracabilite"
    t.string   "tarification"
    t.integer  "market_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "cloturee",               default: false
    t.integer  "etablissement_id"
  end

  add_index "fncs", ["market_id"], name: "index_fncs_on_market_id"

  create_table "fournisseurs", force: true do |t|
    t.string   "nom"
    t.string   "telephone"
    t.string   "fax"
    t.string   "adresse_ligne1"
    t.string   "adresse_ligne2"
    t.string   "code_postal"
    t.string   "ville"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markets", force: true do |t|
    t.string   "code"
    t.integer  "fournisseur_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "consultation_id"
  end

  add_index "markets", ["consultation_id"], name: "index_markets_on_consultation_id"
  add_index "markets", ["fournisseur_id"], name: "index_markets_on_fournisseur_id"

  create_table "observations", force: true do |t|
    t.string   "message"
    t.integer  "fnc_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "observations", ["fnc_id"], name: "index_observations_on_fnc_id"
  add_index "observations", ["user_id"], name: "index_observations_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nom"
    t.integer  "role"
    t.string   "prenom"
    t.integer  "entreprise_id"
    t.string   "entreprise_type"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "telephone"
    t.boolean  "active",                 default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["entreprise_id", "entreprise_type"], name: "index_users_on_entreprise_id_and_entreprise_type"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
