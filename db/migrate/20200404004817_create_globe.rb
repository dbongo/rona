class CreateGlobe < ActiveRecord::Migration[6.0]
  def change
    create_table :globe do |t|
      t.datetime :last_update, null: true
      t.integer  :confirmed,    null: true,  default: 0
      t.integer  :deaths,      null: true,  default: 0
      t.integer  :recovered,   null: true,  default: 0
      t.integer  :active,      null: true,  default: 0

      t.timestamps
    end
  end
end
