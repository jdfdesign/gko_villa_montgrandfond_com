# This migration comes from gko_inquiries (originally 20120904182500)
class RemoveMailMethodsTable < ActiveRecord::Migration
  def up
    if table_exists?(:mail_methods)
      add_column :sites, :mailer_settings, :text unless column_exists?(:sites, :mailer_settings)
      pref_keys = ['mail_host', 'mail_domain', 'mail_port', 'mail_auth_type', 'smtp_username', 'smtp_password', 'delivery_method', 'secure_connection_type', 'mails_from', 'mail_bcc']
      result = connection.execute("SELECT id, site_id FROM mail_methods WHERE environment='production'")
      result.each do |mm|
        Site.current = site = Site.find(mm[1])
        pref_keys.each do |k|
          if p = Preference.find_by_key("mail_method/#{k.to_s}/#{mm[0]}")
            site[k] = p.value
            p.destroy
          end
        end
        site.save!
      end
      drop_table :mail_methods
    end
  end
end