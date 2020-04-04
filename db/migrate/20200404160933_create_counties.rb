class CreateCounties < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :counties, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string     :fips, limit: 5
      t.string     :name
      t.references :state, type: :uuid
      t.references :country, type: :uuid
      t.datetime   :last_update, null: true
      t.float      :lat
      t.float      :long
      t.integer    :confirmed,  null: true,  default: 0
      t.integer    :deaths,    null: true,  default: 0
      t.integer    :recovered, null: true,  default: 0
      t.integer    :active,    null: true,  default: 0
      t.string     :fullname

      t.timestamps
    end
    add_index :counties, :fips
  end
end
