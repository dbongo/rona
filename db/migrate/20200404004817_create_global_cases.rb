class CreateGlobalCases < ActiveRecord::Migration[6.0]
  def change
    create_table :global_cases do |t|
      t.string  :fips,            null: true, limit: 5
      t.string  :county_name,    null: true
      t.string  :province_state, null: true
      t.string  :country_region, null: false
      t.date    :last_update,    null: true
      t.float    :latitude,       null: true
      t.float    :longitude,      null: true
      t.integer :confirmed,       null: true, default: 0
      t.integer :deaths,         null: true, default: 0
      t.integer :recovered,      null: true, default: 0
      t.integer :active,         null: true, default: 0
      t.string  :combined_key,   null: true

      t.timestamps
    end
    add_index :global_cases, :fips, unique: true
  end
end
