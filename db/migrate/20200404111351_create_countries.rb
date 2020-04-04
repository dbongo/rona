class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :countries, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string   :name
      t.datetime :last_update, null: true
      t.float     :lat
      t.float     :long
      t.integer  :confirmed,  null: true,  default: 0
      t.integer  :deaths,    null: true,  default: 0
      t.integer  :recovered, null: true,  default: 0
      t.integer  :active,    null: true,  default: 0

      t.timestamps
    end
    add_index :countries, :name, unique: true
  end
end
