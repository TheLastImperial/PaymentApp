class CreatePayslipDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payslip_details do |t|
      t.string :description
      t.decimal :quantity
      t.decimal :total, precision: 10, scale: 2
      t.references :salary_detail, null: false, foreign_key: true
      t.references :payslip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
