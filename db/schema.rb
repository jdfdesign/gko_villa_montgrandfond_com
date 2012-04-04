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

ActiveRecord::Schema.define(:version => 20120404161363) do

  create_table "accounts", :force => true do |t|
    t.string   "reference",  :limit => 40
    t.string   "nickname"
    t.string   "status",     :limit => 40
    t.string   "type",       :limit => 40
    t.datetime "deleted_at"
    t.datetime "expires_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "configurations", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "type",       :limit => 50
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "content_translations", :force => true do |t|
    t.integer  "content_id"
    t.string   "locale"
    t.text     "body"
    t.string   "meta_title"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "slug"
    t.string   "title"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "content_translations", ["content_id"], :name => "index_content_translations_on_content_id"
  add_index "content_translations", ["locale"], :name => "index_content_translations_on_locale"

  create_table "contents", :force => true do |t|
    t.integer  "site_id"
    t.integer  "section_id"
    t.integer  "account_id"
    t.integer  "author_id"
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.datetime "published_at"
    t.string   "layout",           :limit => 40
    t.string   "meta_title"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.text     "options"
    t.string   "author_name",      :limit => 120
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "globalized",                      :default => 0
    t.integer  "position",                        :default => 1
  end

  add_index "contents", ["position", "section_id"], :name => "index_contents_on_position_and_section_id"
  add_index "contents", ["section_id"], :name => "index_contents_on_section_id"
  add_index "contents", ["site_id"], :name => "index_contents_on_site_id"
  add_index "contents", ["slug"], :name => "index_contents_on_slug"

  create_table "countries", :force => true do |t|
    t.string   "iso_name"
    t.string   "iso3",       :limit => 3
    t.string   "iso",        :limit => 2
    t.string   "name"
    t.integer  "numcode"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "site_id"
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "document_assignments", :force => true do |t|
    t.integer  "position",                      :default => 1, :null => false
    t.integer  "document_id",                                  :null => false
    t.integer  "attachable_id",                                :null => false
    t.string   "attachable_type", :limit => 40,                :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "document_assignments", ["attachable_id", "attachable_type"], :name => "index_document_assignments_on_attachable_id_and_attachable_type"
  add_index "document_assignments", ["document_id"], :name => "index_document_assignments_on_document_id"

  create_table "document_items", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.date     "published_at"
    t.integer  "site_id"
    t.integer  "section_id"
    t.string   "document_mime_type"
    t.string   "document_name"
    t.integer  "document_size"
    t.string   "document_uid"
    t.string   "document_ext"
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "country_id"
  end

  add_index "document_items", ["country_id"], :name => "index_press_articles_on_country_id"
  add_index "document_items", ["section_id"], :name => "index_press_articles_on_section_id"
  add_index "document_items", ["site_id"], :name => "index_press_articles_on_site_id"

  create_table "document_translations", :force => true do |t|
    t.integer  "document_id"
    t.string   "locale"
    t.string   "alt"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "document_translations", ["document_id"], :name => "index_document_translations_on_document_id"
  add_index "document_translations", ["locale"], :name => "index_document_translations_on_locale"

  create_table "documents", :force => true do |t|
    t.string   "title",                      :limit => 100
    t.string   "lang",                       :limit => 4
    t.string   "alt"
    t.integer  "account_id"
    t.integer  "site_id"
    t.integer  "document_assignments_count",                :default => 0
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.string   "document_mime_type"
    t.string   "document_name"
    t.integer  "document_size"
    t.string   "document_uid"
    t.string   "document_ext"
    t.integer  "globalized",                                :default => 0
    t.integer  "author_id"
  end

  add_index "documents", ["account_id"], :name => "index_documents_on_account_id"
  add_index "documents", ["author_id"], :name => "index_documents_on_author_id"
  add_index "documents", ["site_id"], :name => "index_documents_on_site_id"

  create_table "image_assignments", :force => true do |t|
    t.integer  "position",                      :default => 1, :null => false
    t.integer  "image_id",                                     :null => false
    t.integer  "attachable_id",                                :null => false
    t.string   "attachable_type", :limit => 40,                :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "image_assignments", ["attachable_id", "attachable_type"], :name => "index_image_assignments_on_attachable_id_and_attachable_type"
  add_index "image_assignments", ["image_id"], :name => "index_image_assignments_on_image_id"

  create_table "image_folders", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "image_folders", ["parent_id"], :name => "index_image_folders_on_parent_id"
  add_index "image_folders", ["site_id"], :name => "index_image_folders_on_site_id"

  create_table "image_stickers", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "image_stickers", ["name"], :name => "index_image_stickers_on_name"
  add_index "image_stickers", ["site_id"], :name => "index_image_stickers_on_site_id"

  create_table "image_stickings", :force => true do |t|
    t.integer  "sticker_id"
    t.integer  "image_id"
    t.integer  "image_stickings_count", :default => 0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "image_stickings", ["sticker_id", "image_id"], :name => "index_image_stickings_on_sticker_id_and_image_id"

  create_table "image_translations", :force => true do |t|
    t.integer  "image_id"
    t.string   "locale"
    t.string   "alt"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "image_translations", ["image_id"], :name => "index_image_translations_on_image_id"
  add_index "image_translations", ["locale"], :name => "index_image_translations_on_locale"

  create_table "images", :force => true do |t|
    t.string   "title",                   :limit => 100
    t.string   "alt"
    t.integer  "account_id"
    t.integer  "author_id"
    t.integer  "site_id"
    t.integer  "image_assignments_count",                :default => 0
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.integer  "globalized",                             :default => 0
    t.integer  "image_folder_id"
  end

  add_index "images", ["account_id"], :name => "index_images_on_account_id"
  add_index "images", ["author_id"], :name => "index_images_on_author_id"
  add_index "images", ["image_folder_id"], :name => "index_images_on_image_folder_id"
  add_index "images", ["site_id"], :name => "index_images_on_site_id"

  create_table "inquiries", :force => true do |t|
    t.string   "type"
    t.string   "confirmation_code", :limit => 40
    t.string   "to_email"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.boolean  "open",                            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "confirmed_at"
    t.boolean  "spam",                            :default => false
    t.text     "options"
    t.integer  "site_id"
  end

  add_index "inquiries", ["site_id"], :name => "index_inquiries_on_site_id"

  create_table "liquid_models", :force => true do |t|
    t.integer  "site_id"
    t.text     "body"
    t.string   "path"
    t.string   "format"
    t.string   "locale"
    t.string   "handler"
    t.boolean  "partial",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "mail_methods", :force => true do |t|
    t.integer  "site_id"
    t.string   "environment"
    t.boolean  "active",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "mail_methods", ["site_id"], :name => "index_mail_methods_on_site_id"

  create_table "partner_translations", :force => true do |t|
    t.integer  "partner_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "partner_translations", ["locale"], :name => "index_partner_translations_on_locale"
  add_index "partner_translations", ["partner_id"], :name => "index_partner_translations_on_partner_id"

  create_table "partners", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.integer  "site_id"
    t.integer  "section_id"
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "globalized",      :default => 0
    t.integer  "position",        :default => 1
  end

  add_index "partners", ["position", "section_id"], :name => "index_partners_on_position_and_section_id"
  add_index "partners", ["section_id"], :name => "index_partners_on_section_id"
  add_index "partners", ["site_id"], :name => "index_partners_on_site_id"

  create_table "preferences", :force => true do |t|
    t.string   "key",                      :null => false
    t.string   "value_type", :limit => 50
    t.string   "value"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "preferences", ["key"], :name => "index_preferences_on_key", :unique => true

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "section_translations", :force => true do |t|
    t.integer  "section_id"
    t.string   "locale"
    t.string   "path"
    t.text     "body"
    t.string   "menu_title"
    t.string   "meta_title"
    t.text     "meta_description"
    t.string   "redirect_url"
    t.text     "meta_keywords"
    t.string   "title_addon"
    t.string   "slug"
    t.string   "title"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "section_translations", ["locale"], :name => "index_section_translations_on_locale"
  add_index "section_translations", ["section_id"], :name => "index_section_translations_on_section_id"

  create_table "sections", :force => true do |t|
    t.integer  "site_id"
    t.integer  "parent_id"
    t.integer  "link_id"
    t.string   "link_type"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "type"
    t.string   "name"
    t.string   "slug"
    t.string   "path"
    t.text     "options"
    t.string   "title"
    t.string   "layout"
    t.text     "body"
    t.string   "meta_title"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "redirect_url"
    t.string   "title_addon"
    t.datetime "published_at"
    t.boolean  "hidden",            :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "menu_title"
    t.integer  "globalized",        :default => 0
    t.integer  "level"
    t.boolean  "shallow_permalink", :default => true
  end

  add_index "sections", ["link_id", "link_type"], :name => "index_sections_on_link_id_and_link_type"
  add_index "sections", ["parent_id"], :name => "index_sections_on_parent_id"
  add_index "sections", ["site_id"], :name => "index_sections_on_site_id"

  create_table "settings", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",             :default => true
    t.string   "scoping"
    t.boolean  "restricted",              :default => false
    t.string   "callback_proc_as_string"
    t.string   "form_value_type",         :default => "text_area", :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "settings", ["name"], :name => "index_settings_on_name"
  add_index "settings", ["site_id"], :name => "index_settings_on_site_id"

  create_table "site_registrations", :force => true do |t|
    t.integer "user_id"
    t.integer "site_id"
  end

  add_index "site_registrations", ["user_id", "site_id"], :name => "index_site_registrations_on_user_id_and_site_id"

  create_table "site_translations", :force => true do |t|
    t.integer  "site_id"
    t.string   "locale"
    t.string   "meta_title"
    t.string   "subtitle"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "site_translations", ["locale"], :name => "index_site_translations_on_locale"
  add_index "site_translations", ["site_id"], :name => "index_site_translations_on_site_id"

  create_table "sites", :force => true do |t|
    t.integer  "account_id"
    t.string   "host"
    t.string   "title"
    t.string   "meta_title"
    t.string   "subtitle"
    t.string   "timezone"
    t.string   "locales",                  :limit => 17
    t.boolean  "public",                                 :default => true
    t.text     "options"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "globalized",                             :default => 0
    t.text     "plugins"
    t.integer  "site_registrations_count",               :default => 0
    t.string   "logo_mime_type"
    t.string   "logo_name"
    t.integer  "logo_size"
    t.integer  "logo_width"
    t.integer  "logo_height"
    t.string   "logo_uid"
    t.string   "logo_ext"
    t.integer  "theme_id"
  end

  add_index "sites", ["account_id"], :name => "index_sites_on_account_id"
  add_index "sites", ["host"], :name => "index_sites_on_host", :unique => true
  add_index "sites", ["theme_id"], :name => "index_sites_on_theme_id"

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.integer "country_id"
  end

  add_index "states", ["country_id"], :name => "index_states_on_country_id"

  create_table "supports", :force => true do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.text    "infos"
  end

  add_index "supports", ["owner_id", "owner_type"], :name => "index_supports_on_owner_id_and_owner_type", :unique => true

  create_table "themes", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "theme_id"
    t.string   "author"
    t.string   "version"
    t.string   "homepage"
    t.text     "summary"
    t.integer  "active"
    t.string   "document_mime_type"
    t.string   "document_name"
    t.integer  "document_size"
    t.string   "document_uid"
    t.string   "document_ext"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.text     "settings"
  end

  create_table "tokenized_permissions", :force => true do |t|
    t.integer  "permissable_id"
    t.string   "permissable_type"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokenized_permissions", ["permissable_id", "permissable_type"], :name => "index_tokenized_name_and_type"

  create_table "users", :force => true do |t|
    t.integer  "account_id"
    t.string   "email",                                   :default => "", :null => false
    t.string   "encrypted_password",       :limit => 128, :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_created_at"
    t.integer  "sign_in_count",                           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",                 :limit => 60
    t.string   "firstname",                :limit => 60
    t.string   "lastname",                 :limit => 60
    t.string   "preferred_language",       :limit => 5
    t.string   "timezone"
    t.integer  "site_registrations_count",                :default => 0
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.integer  "failed_attempts",                         :default => 0,  :null => false
    t.datetime "last_request_at"
    t.string   "login"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
