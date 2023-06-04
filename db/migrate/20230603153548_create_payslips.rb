class CreatePayslips < ActiveRecord::Migration[7.0]
  def change
    create_table :payslips do |t|
      t.decimal :total, precision: 10, scale: 2
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
