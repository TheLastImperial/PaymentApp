class CreateSalaryDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :salary_details do |t|
      t.string :name
      t.decimal :value, precision: 10, scale: 2
      t.decimal :conditional_value
      t.boolean :is_quantity
      t.boolean :is_discount
      t.boolean :is_main
      t.references :role, null: true, foreign_key: true

      t.timestamps
    end
  end
end
