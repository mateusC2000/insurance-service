class CreatePolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :policies do |t|
      t.string :number, unique: true
      t.date :emission_date
      t.date :coverage_end_date

      t.timestamps
    end
  end
end
