class CreateMobileNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :mobile_numbers do |t|
      t.bigint :mobile_number, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
